# Vimfiles

## Description
This repository tracks my vim configuration, and specifically, my _.vimrc_ file and _.vim_ folder.

The configuration was created from scratch, and current main features are:

* __pathogen.vim__ (autoload plugins)
* __vim-fuzzyfinder__ + deps (_l9_)
 * `\t`: fuzzy matcher
 * `\f`: file browsing
 * `\b`: buffer browsing
* __vim_endwise__
* __vim_rails__
* __vim_surround__
 * `cs` to change surround. _Example:_ `cs{(` to change from { to (
 * `ds` to delete surround. _Example:_ `dst` to delete tag surrounds like <p></p>
 * `ys{motion}{surrounding}` to add surrounding. _Example:_ `ys2w"` to add " surround to next 2 words
* __vim_repeat__
* __tcomment_vim__
 * gc{motion} or gcc to toggle comment in Normal Mode
 * gc to toggle commnet on Visual Mode
* __vim_markdown__
* __Ack__
 * `:Ack {expression}` to find in files under pwd

## Deploying
Just clone the repository to <somefolder>, symlink _~/.vim_ folder to <somefolder> and _~/.vimrc_ file to _~/.vim/vimrc_.

    git clone https://github.com/lmbacelar/vimfiles.git ~/.vim <somefolder>
    ln -nfs ~/.vim/vim <somefolder>
    ln -nfs ~/.vim/vimrc ~/.vimrc
