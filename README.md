Oliver-Maximum-Awesome
===============

Config files for vim, bash, zsh, and git.

Install
-------

    rake


Use
---

Use git submodules to add new things like Vim plugins

    cd vim/bundle/
    git submodule add ssh://blah submodule_dir
    git submodule init

Updating

    cd submodule_dir
    git checkout master
    git pull

Or

    git submodule foreach git pull origin master

Troubleshoot
------------

If you have trouble compiling the Command-T C extension, check mkmf.log in the
current directory; you may need to use `xcode-select(1)`.
