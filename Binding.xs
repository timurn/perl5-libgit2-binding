#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <git2.h>

MODULE = LibGit2::Binding PACKAGE = LibGit2::Binding
PROTOTYPES: DISABLE

# repository functions

git_repository *
new_repository()
    CODE:
        git_repository * repo;
        RETVAL = repo;
    OUTPUT:
        RETVAL

#int
#git_repository_config(git_config * out, git_repository * repo)
#    CODE:
#        RETVAL = git_repository_config(&out, repo);
#    OUTPUT:
#        out
#        RETVAL

#int
#git_repository_discover(char * repository_path, size_t size, const char * start_path, int across_fs, const char * ceiling_dirs)
#
void
git_repository_free(git_repository * repo)

#
#int
#git_repository_head(git_reference * head_out, git_repository * repo)
#    CODE:
#        RETVAL = git_repository_head(&head_out, repo);
#    OUTPUT:
#        head_out
#        RETVAL
#
#int
#git_repository_head_detached(git_repository * repo)
#
#int
#git_repository_head_orphan(git_repository * repo)
#
#int
#git_repository_index(git_index * out, git_repository * repo)
#    CODE:
#        RETVAL = git_repository_index(&out, repo);
#    OUTPUT:
#        out
#        RETVAL
#
int
git_repository_init(git_repository * repo_out, const char * path, unsigned is_bare)
    CODE:
        RETVAL = git_repository_init(&repo_out, path, is_bare);
    OUTPUT:
        repo_out
        RETVAL

int
git_repository_is_bare(git_repository * repo)

int
git_repository_is_empty(git_repository * repo)
#
#int
#git_repository_odb(git_odb * out, git_repository * repo)
#    CODE:
#        RETVAL = git_repository_odb(&out, repo);
#    OUTPUT:
#        out
#        RETVAL

int
git_repository_open(git_repository * repo_out, const char * path)
    CODE:
        RETVAL = git_repository_open(&repo_out, path);
    OUTPUT:
        repo_out
        RETVAL

const char *
git_repository_path(git_repository * repo)
#
#void
#git_repository_set_config(git_repository * repo, git_config * config)
#
#void
#git_repository_set_index(git_repository * repo, git_index * index)
#
#void
#git_repository_set_odb(git_repository * repo, git_odb * odb)
#
#int
#git_repository_set_workdir(git_repository * repo, const char * workdir)
#

const char *
git_repository_workdir(git_repository * repo)
