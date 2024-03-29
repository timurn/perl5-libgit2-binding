use 5.010001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'LibGit2::Binding',
    VERSION_FROM      => 'lib/LibGit2/Binding.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    BUILD_REQUIRES    => {
        Archive::Tar => 0,
    },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/LibGit2/Binding.pm', # retrieve abstract from module
       AUTHOR         => 'Timur Nozadze <timur.nozadze@gmail.com>') : ()),
#    LIBS              => [''], # e.g., '-lm'
    LIBS => ["-lgit2"],
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
    clean => { FILES => "tmp" }
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
