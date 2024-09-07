{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ lightline-vim ];
    extraConfig = ''
      set nocompatible	
      filetype on
      filetype plugin on
      filetype indent on
      syntax on
      set number
      set autoindent
      set clipboard+=unnamedplus
      '';
    };
}
