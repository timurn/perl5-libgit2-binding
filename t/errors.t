use strict;
use warnings;

use Test::More;
use FindBin '$Bin';
use File::Path qw/ mkpath rmtree /;
use Data::Dumper;

use lib 't/lib';
use TestUtils;
use LibGit2::Binding ':api';

my $repo   = LibGit2::Binding::new_repository();

my $error_code;

$error_code = git_repository_open( $repo,   $NOT_REPOSITORY_PATH );
is( git_lasterror(), 'The given path is not a valid Git repository', 'git_lasterror: GIT_ENOTAREPO' );
is( git_strerror( $error_code ), 'The specified repository is invalid', 'git_strerror: GIT_ENOTAREPO' );
git_clearerror();
is( git_lasterror(), undef, 'git_lasterror: after git_clearerror()' );

$error_code = git_repository_open( $repo,   $NOT_EXISTING_PATH );
is( git_lasterror(), undef, 'git_lasterror: GIT_EOSERR' );
isnt( git_strerror( $error_code ), undef, 'git_strerror: GIT_EOSERR' );
git_clearerror();

done_testing();
