# Vimfiles

## Description
This repository tracks my vim configuration, and specifically, my _.vimrc_ file and _.vim_ folder.

The configuration was created from scratch, and current main features are:

### General
* __pathogen.vim__
 * _Purpose_: plugin management and autoload
* __matchit__
 * _Purpose_: Enhanced % matching
* __abolish__
 * _Purpose_: Enhanced abbreviation, substitution and coercion
* __vim_repeat__
 * _Purpose_: repeat plugin mappings with .

### Navigation
* __vim-fuzzyfinder__ + deps (_l9_)
 * _Purpose_: file / buffer navigation
  * `\t`: fuzzy matcher
  * `\f`: file browsing
  * `\b`: buffer browsing
* __Ack__
 * Multiple file searching
  * `:Ack {expression}` to find in files under pwd

### Typing aids
* __vim_surround__
 * _Purpose_: surround management
  * `cs` to change surround. _Example:_ `cs{(` to change from { to (
  * `ds` to delete surround. _Example:_ `dst` to delete tag surrounds like <p></p>
  * `ys{motion}{surrounding}` to add surrounding. _Example:_ `ys2w"` to add " surround to next 2 words
* __supertab__
 * _Purpose_: Tab completion
* __vim_endwise__
 * _Purpose_: auto end functions
* __tcomment_vim__
 * _Purpose_: commenting mapings
  * `gc{motion}` or `gcc` to toggle comment in Normal Mode
  * `gc` to toggle comment on Visual Mode

### Syntax
* __vim_rails__
 * _Purpose_: syntax highlight, project navigation, rake/rails interface, partial extration, migration inversion
* __vim_markdown__
 * _Purpose_: MarkDown syntax

## Deploying
Just clone the repository to <somefolder>, symlink _~/.vim_ folder to <somefolder> and _~/.vimrc_ file to _~/.vim/vimrc_.

    git clone https://github.com/lmbacelar/vimfiles.git ~/.vim <somefolder>
    ln -nfs ~/.vim/vim <somefolder>
    ln -nfs ~/.vim/vimrc ~/.vimrc
