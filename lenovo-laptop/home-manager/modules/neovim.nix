{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [ 
      vim-devicons
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      nvim-treesitter-endwise
      oil-nvim
      ranger-nvim
      {
	plugin = nerdtree;
	config = "let g:NERDTreeWinSize=50";
      }
     
      {
	plugin = lightline-vim;
      }

      {
	plugin = rose-pine;
	config = "colorscheme rose-pine";
      }

    ];

    extraConfig = ''
      set nocompatible
      set shiftwidth=2
      filetype on
      filetype plugin on
      filetype indent on
      syntax on
      set number
      set relativenumber
      set autoindent
      set clipboard+=unnamedplus
      set encoding=UTF-8
      let mapleader = " "
      let g:lightline = {
	\ 'colorscheme': 'rosepine',
	\ }

      nnoremap <C-n> :NERDTree
      nnoremap <C-t> :NERDTreeToggle
      nnoremap <C-f> :NERDTreeFind
      nnoremap <S-t> :terminal

      autocmd VimEnter * NERDTree
      autocmd VimEnter * NERDTree | wincmd p

      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

      autocmd StdinReadPre * let s:std_in=1
      autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

      autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
      autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

      '';
    };
}
