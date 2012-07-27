# Vimfiles

## Description
This repository tracks my vim configuration, and specifically, my _.vimrc_ file and _.vim_ folder.

The configuration was created from scratch, and current main features are:

### General
* __pathogen.vim__  
_Purpose_: plugin management and autoload
* __matchit__  
_Purpose_: enhanced `%` matching
* __vim-indexed-search__  
_Purpose_: enhanced search result counting and navigation
* __YankRing.vim__  
_Purpose_: yank, change, delete buffer
  * `\y`: show yank ring
* __gundo__  
_Purpose_: non-linear undo navigation
  * `\u`: toggle undo history pane
* __vim-repeat__  
_Purpose_: repeat plugin mappings with `.`
* __abolish__  
_Purpose_: enhanced abbreviation, substitution and coercion

### Navigation
* __vim-fuzzyfinder__ + deps (_l9_)  
_Purpose_: file / buffer navigation
  * `\t`: fuzzy matcher
  * `\f`: file browsing
  * `\b`: buffer browsing
* __Ack__  
_Purpose_: multiple file searching
  * `:Ack {expression}` to find in files under pwd

### Typing aids
* __vim-autoclose__  
_Purpose_: auto type closing chars
* __vim-surround__  
_Purpose_: surround management
  * `cs` to change surround. _Example:_ `cs{(` to change from { to (
  * `ds` to delete surround. _Example:_ `dst` to delete tag surrounds like <p></p>
  * `ys{motion}{surrounding}` to add surrounding. _Example:_ `ys2w"` to add " surround to next 2 words
* __vim-textobj-rubyblock__  
_Purpose_: inner / outer ruby block selector
  * `ir` refers to inner ruby block
  * `ar` refers to outer (all) ruby block
* __vim-textobj-user__  
_Purpose_: vim-textobj-rubyblock dependency
* __vim-endwise__  
_Purpose_: auto end functions
* __tcomment_vim__  
_Purpose_: commenting mapings
  * `gc{motion}` or `gcc` to toggle comment in Normal Mode
  * `gc` to toggle comment on Visual Mode
* __supertab__  
_Purpose_: tab completion

### Syntax
* __syntastic__  
_Purpose_: syntax checking, error / warning mapping
* __vim-rails__  
_Purpose_: syntax highlight, project navigation, rake/rails interface, partial extration, migration inversion
* __vim-jquery__  
_Purpose_: jQuery syntax
* __vim-coffee-script__  
_Purpose_: CoffeeScript syntax
* __vim-haml__  
_Purpose_: HAML, sass, scss syntax
* __vim-markdown__  
_Purpose_: MarkDown syntax
* __textile.vim__  
_Purpose_: Textile syntax

### Rendering
* __vim-preview__  
_Purpose_: preview markup (`markdown`, `rdoc`, `textile`, `html`) on default browser
  * `\P` to open browser with preview

## Install
Just clone the repository to <somefolder>, symlink _~/.vim_ folder to <somefolder> and _~/.vimrc_ file to _~/.vim/vimrc_.

    git clone https://github.com/lmbacelar/vimfiles.git ~/.vim <somefolder>
    ln -nfs ~/.vim/vim <somefolder>
    ln -nfs ~/.vim/vimrc ~/.vimrc
