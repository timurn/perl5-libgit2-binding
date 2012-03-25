use strict;
use warnings;

use Test::More;
use FindBin '$Bin';
use File::Path qw/ mkpath rmtree /;
use Data::Dumper;

use lib 't/lib';
use TestUtils;
use LibGit2::Binding ':api';

my $standard_repo   = LibGit2::Binding::new_repository();
my $empty_repo      = LibGit2::Binding::new_repository();
my $empty_bare_repo = LibGit2::Binding::new_repository();
my $tmp_repo;

# git_repository_open
is( git_repository_open( $standard_repo,   $NOT_EXISTING_PATH ),          GIT_EOSERR,    'git_repository_open: path not exist' );
is( git_repository_open( $standard_repo,   $NOT_REPOSITORY_PATH ),        GIT_ENOTAREPO, 'git_repository_open: path not a repo' );
is( git_repository_open( $standard_repo,   $REPOSITORY_PATH ),            GIT_SUCCESS,   'git_repository_open: standard repository' );
is( git_repository_open( $empty_repo,      $EMPTY_REPOSITORY_GIT_DIR ),   GIT_SUCCESS,   'git_repository_open: empty repository' );
is( git_repository_open( $empty_bare_repo, $EMPTY_BARE_REPOSITORY_PATH ), GIT_SUCCESS,   'git_repository_open: empty bare repository' );

# git_repository_is_bare
is( git_repository_is_bare( $standard_repo ),   0, 'git_repository_is_bare: standard repository' );
is( git_repository_is_bare( $empty_repo ),      0, 'git_repository_is_bare: empty repository' );
is( git_repository_is_bare( $empty_bare_repo ), 1, 'git_repository_is_bare: empty bare repository' );

# git_repository_is_empty
is( git_repository_is_empty( $standard_repo ),   0, 'git_repository_is_empty: standard repository' );
is( git_repository_is_empty( $empty_repo ),      1, 'git_repository_is_empty: empty repository' );
is( git_repository_is_empty( $empty_bare_repo ), 1, 'git_repository_is_empty: empty bare repository' );

# git_repository_path
is( git_repository_path( $standard_repo ),   $REPOSITORY_GIT_DIR,         'git_repository_path: standard repository' );
is( git_repository_path( $empty_repo ),      $EMPTY_REPOSITORY_GIT_DIR,   'git_repository_path: empty repository' );
is( git_repository_path( $empty_bare_repo ), $EMPTY_BARE_REPOSITORY_PATH, 'git_repository_path: empty bare repository' );

# git_repository_workdir
is( git_repository_workdir( $standard_repo ),   $REPOSITORY_PATH,       'git_workdir_path: standard repository' );
is( git_repository_workdir( $empty_repo ),      $EMPTY_REPOSITORY_PATH, 'git_workdir_path: empty repository' );
is( git_repository_workdir( $empty_bare_repo ), undef,                  'git_workdir_path: empty bare repository' );

# git_repository_init
$tmp_repo = LibGit2::Binding::new_repository();
my $bare_tmp_repo_path = $Bin . '/tmp/bare/';
mkpath( $bare_tmp_repo_path );
is( git_repository_init( $tmp_repo, $bare_tmp_repo_path, 1 ), GIT_SUCCESS, 'git_repository_init: bare repository' );
is( git_repository_path( $tmp_repo ), $bare_tmp_repo_path, 'git_repository_init: check bare repository path' );
is( git_repository_workdir( $tmp_repo ), undef, 'git_repository_init: check bare repository workdir' );
git_repository_free( $tmp_repo );

$tmp_repo = LibGit2::Binding::new_repository();
my $normal_tmp_repo_path = $Bin . '/tmp/normal/';
mkpath( $normal_tmp_repo_path );
is( git_repository_init( $tmp_repo, $normal_tmp_repo_path, 0 ), GIT_SUCCESS, 'git_repository_init: normal repository' );
is( git_repository_path( $tmp_repo ), $normal_tmp_repo_path . '.git/', 'git_repository_init: check normal repository path' );
is( git_repository_workdir( $tmp_repo ), $normal_tmp_repo_path, 'git_repository_init: check normal repository workdir' );
git_repository_free( $tmp_repo );

git_repository_free( $standard_repo );
git_repository_free( $empty_repo );
git_repository_free( $empty_bare_repo );

rmtree( $Bin . '/tmp/' );

done_testing();
