{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [ 
      
      lightline-vim
      nerdtree
      vim-devicons
      {
	plugin = gruvbox-nvim;
	config = "colorscheme gruvbox";
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
      set autoindent
      set smartindent
      set clipboard+=unnamedplus
      set encoding=UTF-8
      let mapleader = " "

      nnoremap <C-n> :NERDTree
      nnoremap <C-t> :NERDTreeToggle
      nnoremap <C-f> :NERDTreeFind
      nnoremap <S-t> :terminal
     
      autocmd VimEnter * NERDTree
      autocmd VimEnter * NERDTree | wincmd p
      autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
      autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
      '';
    };
}
