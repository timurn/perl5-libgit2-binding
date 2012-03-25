package LibGit2::Binding;

use 5.010001;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# libgit2 error codes
use constant {
    GIT_SUCCESS              => 0,
    GIT_ERROR                => -1,
    # Input was not a properly formatted Git object id.
    GIT_ENOTOID              => -2,
    # Input does not exist in the scope searched.
    GIT_ENOTFOUND            => -3,
    # Not enough space available.
    GIT_ENOMEM               => -4,
    # Consult the OS error information.
    GIT_EOSERR               => -5,
    # The specified object is of invalid type
    GIT_EOBJTYPE             => -6,
    # The specified repository is invalid
    GIT_ENOTAREPO            => -7,
    # The object type is invalid or doesn't match
    GIT_EINVALIDTYPE         => -8,
    # The object cannot be written because it's missing internal data
    GIT_EMISSINGOBJDATA      => -9,
    # The packfile for the ODB is corrupted
    GIT_EPACKCORRUPTED       => -10,
    # Failed to acquire or release a file lock
    GIT_EFLOCKFAIL           => -11,
    # The Z library failed to inflate/deflate an object's data
    GIT_EZLIB                => -12,
    # The queried object is currently busy
    GIT_EBUSY                => -13,
    # The index file is not backed up by an existing repository
    GIT_EBAREINDEX           => -14,
    # The name of the reference is not valid
    GIT_EINVALIDREFNAME      => -15,
    # The specified reference has its data corrupted
    GIT_EREFCORRUPTED        => -16,
    # The specified symbolic reference is too deeply nested
    GIT_ETOONESTEDSYMREF     => -17,
    # The pack-refs file is either corrupted or its format is not currently supported
    GIT_EPACKEDREFSCORRUPTED => -18,
    # The path is invalid
    GIT_EINVALIDPATH         => -19,
    # The revision walker is empty; there are no more commits left to iterate
    GIT_EREVWALKOVER         => -20,
    # The state of the reference is not valid
    GIT_EINVALIDREFSTATE     => -21,
    # This feature has not been implemented yet
    GIT_ENOTIMPLEMENTED      => -22,
    # A reference with this name already exists
    GIT_EEXISTS              => -23,
    # The given integer literal is too large to be parsed
    GIT_EOVERFLOW            => -24,
    # The given literal is not a valid number
    GIT_ENOTNUM              => -25,
    # Streaming error
    GIT_ESTREAM              => -26,
    # invalid arguments to function
    GIT_EINVALIDARGS         => -27,
    # The specified object has its data corrupted
    GIT_EOBJCORRUPTED        => -28,
    # The given short oid is ambiguous
    GIT_EAMBIGUOUSOIDPREFIX  => -29,
    # Skip and passthrough the given ODB backend
    GIT_EPASSTHROUGH         => -30,
    # The path pattern and string did not match
    GIT_ENOMATCH             => -31,
    # The buffer is too short to satisfy the request
    GIT_ESHORTBUFFER         => -32,
};

our @api_error_codes = qw/
     GIT_SUCCESS GIT_ERROR GIT_ENOTOID GIT_ENOTFOUND GIT_ENOMEM GIT_EOSERR
     GIT_EOBJTYPE GIT_ENOTAREPO GIT_EINVALIDTYPE GIT_EMISSINGOBJDATA
     GIT_EPACKCORRUPTED GIT_EFLOCKFAIL GIT_EZLIB GIT_EBUSY GIT_EBAREINDEX
     GIT_EINVALIDREFNAME GIT_EREFCORRUPTED GIT_ETOONESTEDSYMREF
     GIT_EPACKEDREFSCORRUPTED GIT_EINVALIDPATH GIT_EREVWALKOVER
     GIT_EINVALIDREFSTATE GIT_ENOTIMPLEMENTED GIT_EEXISTS GIT_EOVERFLOW
     GIT_ENOTNUM GIT_ESTREAM GIT_EINVALIDARGS GIT_EOBJCORRUPTED
     GIT_EAMBIGUOUSOIDPREFIX GIT_EPASSTHROUGH GIT_ENOMATCH GIT_ESHORTBUFFER
/;
our @api_repository_functions = qw/
    git_repository_config git_repository_discover git_repository_free
    git_repository_head git_repository_head_detached git_repository_head_orphan
    git_repository_index git_repository_init git_repository_is_bare git_repository_is_empty
    git_repository_odb git_repository_open git_repository_path
    git_repository_set_config git_repository_set_index git_repository_set_odb
    git_repository_set_workdir git_repository_workdir
/;
our @api_error_functions = qw/ git_clearerror git_lasterror git_strerror /;
our @api_functions = ( @api_repository_functions, @api_error_functions );
our @constructor_functions = qw/ new_repository /;



our %EXPORT_TAGS = (
    'all' => [ @api_functions, @api_error_codes, @constructor_functions ],
    'api' => [ @api_functions, @api_error_codes ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('LibGit2::Binding', $VERSION);

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
