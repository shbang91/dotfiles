# Tmux
### Key Binding
```sh
# new session
$ tmux new-session -s 'session-name'
# detach session
$ tmux detach
# attach session
$ tmux attach -t 'session-name'
# session list
$ tmux ls
# new window
$ ctrl a + c
# window navigation
$ ctrl a + 'window-number'
# window kill
$ ctrl a + x
# new pane
$ ctrl a + v or s
# pane navigation
$ ctrl a + hjkl
# pane kill
$ ctrl a + x
# copy mode
$ ctrl a + [
# terminal copy and past to vim
$ ctrl a + ctrl t
# terminal screen capture
$ ctrl a + ctrl c
# fuzzy-finder
$ cd ~/**<TAB>
$ vim ~/**<TAB>
```
# Vim
### Basic
- navigation
```vim 
" arrow key
h j k l
" navigate word
e b 
" navigate paragraph
{ }
" goto line
:'number'
" grab screen
ctrl e or y
" visual mode
v V
" insert mode
i a I A
" edit file
:e
" save file
:w
" quit file
:q
" new buffer
ctrl w + v or s
" navigate buffer
ctrl w + h j k l
" goto alphabet
f + 'alphabet'
```

### General
- [fuzzy finder](https://github.com/junegunn/fzf)
```vim
ctrl p
```
- [commenter](https://github.com/scrooloose/nerdcommenter)
```vim
" invert
, + c + i 
" invert and yank
, + c + y
```
- [snippet](https://github.com/honza/vim-snippets)
```vim
'trigger' + <TAB>
```
- rgrep : f3
- kill white space : f5
- paste mode : f8
- [tagbar](https://github.com/majutsushi/tagbar) : f9
- replace
```vim
" change all
,s 'word'
" change one by one
,s 'word'/gc
```
- [table mode](https://github.com/dhruvasagar/vim-table-mode)
```vim
" table mode enable / disable
, + t + m
" row and column
| , ||
```
- [vim surround](https://github.com/tpope/vim-surround)
```vim
, + S + 'parenthesis'
```
- [multi curosr](https://github.com/paradigm/vim-multicursor) ( on the word or visual mode )
```vim
ctrl n
```
- [goyo](https://github.com/junegunn/goyo.vim)
```vim
:Goyo
```
- [git fugitive](https://github.com/tpope/vim-fugitive)
```vim
:Gdiff
```
- [easy align](https://github.com/junegunn/vim-easy-align)
```vim
ga
```
### C++/C
- [a.vim](https://github.com/vim-scripts/a.vim)
```vim
" switch to header or source
:A or AV
```
- [completer](https://github.com/maralla/completor.vim)
to use semantic need to generate file .clang_complete : if you use cmake, you could use ccmake to auto genenerate
no trigger for completer, async type
- [ctags](https://github.com/ludovicchabant/vim-gutentags)
```vim
" goto definition
ctrl }
" come back to previous
ctrl o
```
### Python
TODO

### Latex
For OS X, install [Skim](https://sourceforge.net/projects/skim-app/) for viewer
```sh
# latex make
,ll
# pdf open
,lv
# table of content
,lt
```

### MarkDown
See [XMark](https://github.com/junegunn/vim-xmark)
