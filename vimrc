" Vim configuration.

set nocompatible                  " Must come first because it changes other options.

call pathogen#infect()            " Load plugins in bundle folder.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set t_Co=256                      " Needed for railscasts colorscheme
colorscheme railscasts            " Or use topfunky-light, vividchalk, railscasts2

" jumps to the last known position in a file just after opening it
autocmd BufReadPost * 
  \ if line("'\"") > 1 && line("'\"") <= line("$") | 
  \   exe "normal! g`\"" | 
  \ endif

" Clear search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" CommandT mappings.
map <Leader>b :CommandTFlush<cr>\|:CommandTBuffer<cr>
map <Leader>g :CommandTFlush<cr>\|:CommandT<cr>
map <Leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <Leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <Leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <Leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <Leader>gl :CommandTFlush<cr>\|:CommandT lib/<cr>
map <Leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <Leader>gG :topleft 100 :split Gemfile<cr>
map <Leader>gR :topleft 100 :split Rakefile<cr>

" Gundo mapping
nnoremap <Leader>u :GundoToggle<Enter>

" YankRing mapping
nnoremap <Leader>y :YRShow<Enter>

"mark syntax errors with :signs
let g:syntastic_enable_signs=1


" Tab mappings.
" map <leader>tt :tabnew<cr>
" map <leader>te :tabedit
" map <leader>tc :tabclose<cr>
" map <leader>to :tabonly<cr>
" map <leader>tn :tabnext<cr>
" map <leader>tp :tabprevious<cr>
" map <leader>tf :tabfirst<cr>
" map <leader>tl :tablast<cr>
" map <leader>tm :tabmove

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2


" Running tests
map <leader>t :call RunTestFile()<cr>
" map <leader>T :call RunNearestTest()<cr>
" map <leader>ta :call RunTests('')<cr>
" map <leader>c :w\|:!script/features<cr>
" map <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
      call SetTestFile()
    elseif !exists("t:grb_test_file")
      return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction
                                             
function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function!  RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
  " Clears terminal after clearing test results
  :silent !clear
endfunction
