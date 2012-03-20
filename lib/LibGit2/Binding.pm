package LibGit2::Binding;

use 5.010001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use LibGit2::Binding ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our @api_repository_functions = qw/
    git_repository_config git_repository_discover git_repository_free
    git_repository_head git_repository_head_detached git_repository_head_orphan
    git_repository_index git_repository_init git_repository_is_bare git_repository_is_empty
    git_repository_odb git_repository_open git_repository_path
    git_repository_set_config git_repository_set_index git_repository_set_odb
    git_repository_set_workdir git_repository_workdir
/;
our @api_functions = ( @api_repository_functions );
our @constructor_functions = qw/ new_repository /;

our %EXPORT_TAGS = (
    'all' => [ @api_functions, @constructor_functions ],
    'api' => [ @api_functions ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('LibGit2::Binding', $VERSION);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

LibGit2::Binding - Perl extension for blah blah blah

=head1 SYNOPSIS

  use LibGit2::Binding;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for LibGit2::Binding, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Timur Nozadze, E<lt>timur.nozadze@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Timur Nozadze

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.


=cut
