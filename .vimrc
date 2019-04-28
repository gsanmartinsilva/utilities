" VIMRC FILE
let mapleader =" "

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'junegunn/goyo.vim'
"Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
"Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install() } }
Plug 'junegunn/limelight.vim'
Plug 'ashfinal/vim-colors-paper' 
"Plug 'gabrielelana/vim-markdown'
" List ends here. Plugins become visible to Vim after this call.
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
call plug#end()



" junegunn/limelight.vim -------------------------------
let g:limelight_conceal_ctermfg= 'gray'
"-------------------------------------------------------

" plasticboy/vim-markdown ------------------------------
"let g:vim_markdown_folding_disabled = 1
"-------------------------------------------------------
" iamcco/markdown-preview.nvim--------------------------
"let g:mkdp_refresh_slow =  1
"let g:mkdp_markdown_css = '~/.vim/github_md.css'
" for normal mode
"nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
"imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
"nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
"imap <silent> <F9> <Plug>StopMarkdownPreview
"-------------------------------------------------------
" joshdick/onedark.vim ---------------------------------
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
"-------------------------------------------------------
" itchiny/lightline.vim --------------------------------
set laststatus=2
set noshowmode
" ------------------------------------------------------
" General Configs---------------------------------------
set directory^=$HOME/.vim/tmp//
"set t_Co=256   " This is may or may not needed.
"set background=dark
"colorscheme paper


syntax on
colorscheme onedark

" Compile document, be it latex, markdown, rmarkdown, etc...
	map <leader>c :w! \| !compiler.sh <c-r>%<CR><CR>

" Open a document as .pdf/.html/ or preview
	map <leader>p :!opout <c-r>%<CR><CR>
