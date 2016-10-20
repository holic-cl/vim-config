set nocompatible                        " we want the latest vim settings/options

so ~/.vim/plugins.vim


autocmd Filetype gitcommit setlocal spell textwidth=71

syntax enable

set backspace=indent,eol,start          "Make backspace behave like every other editor
let mapleader = ','                     "The default leader is \, but a comma is much better.
set number	                            "Active line numbers.
set noerrorbells visualbell t_vb=       "No damn bells!

set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"set list                                "Highlights the tabs invisible characters
"set listchars=tab:\|\<Space>


" macro to create protecte var on class
let @a="yiw/}O$this->pi€@7 = $pi€@7;?constructOprivate $pi€@7;/construct/€ÿX\", "
" macro to getter, setter and both
let @g="yiwGOpublic function get^[p`[~A(<80>kr^M{^M$<80>kbreturn $this->^[\"<80>kb^[\"0pa;^["
let @s="yiwGOpublic function set^[\"0p`[~A($^[\"0pA^M{^M$this->^[\"0<80>kb<80>kb^[\"0pa = $^[\"0pa;^["
let @b="yiwGOpublic function set^[\"0p`[~A($^[\"0\"0pA^M{^M$this->^[\"0<80>kb<80>kb^[\"0pa = $^[\"0pa;<80>kd^M^Mpublic function get^ [\"0p`[~A(<80>kr^M{^Mreturn $this->^[\"0pa;^["


" allow html snippets on php file
au BufRead *.php set ft=php.html
au BufNewFile *.php set ft=php.html

"-------------Visuals-------------"
colorscheme jellybeans
set t_CO=256
set guifont=Fira_Code:h17
set linespace=15                        "line-height.
set guioptions-=e                       "We don't want gui tabs


set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window
hi LineNr guibg=bg
set foldcolumn=2
hi foldcolumn guibg=bg

"Get rid of ugly split borders
hi vertsplit guifg=bg guibg=bg

"-------------Search-------------"
set hlsearch                            "Highlight search.
set incsearch                           "Incremental search.



"-------------Splits--------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"-------------Mappings-------------"

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr> 

"Make it easy to edit the Plugins file.
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr> 

"Make it easy to edit the Php snippets file.
nmap <Leader>esp :tabedit ~/.vim/snippets/php.snippets<cr> 

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

nmap <Leader>f :tag<space>

"PHPCS Fixer on directory
nmap <leader>pcd :call PhpCsFixerFixDirectory()<CR>
"PHPCS Fixer on file
nmap <leader>pcf :call PhpCsFixerFixFile()<CR>



"----------------Plugins----------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"Make Search of methods with CtrlP
nmap <c-R> :CtrlPBufTag<cr>
nmap <c-e> :CtrlPMRUFiles<cr>


"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"Make NERDTree easier to toggle
nmap <c-T> :NERDTreeToggle<cr>


"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>


"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ UltiSnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"/
"/ Syntastic
"/
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-----------Laravel-Specific------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>d :e database/<cr>
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :e app/<cr>
nmap <Leader><Leader>v :e resources/views/<cr>


"-------------Auto-Commands-------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END




function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>


function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


"Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located
