{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [ 
      vim-devicons 
      markdown-preview-nvim
      {
	plugin = nerdtree;
	config = "let g:NERDTreeWinSize=30";
      }
     
      {
	plugin = lualine-nvim;
	type = "lua";
	config = ''
	    require('lualine').setup(
	      {
		options = {
		  icons_enabled = true,
		  theme = 'base16',
		  component_separators = { left = '', right = ''},
		  section_separators = { left = '', right = ''},
		  disabled_filetypes = {
		    statusline = {},
		    winbar = {},
		  },
		  ignore_focus = {},
		  always_divide_middle = true,
		  globalstatus = false,
		  refresh = {
		    statusline = 1000,
		    tabline = 1000,
		    winbar = 1000,
		  }
		},
		sections = {
		  lualine_a = {'mode'},
		  lualine_b = {'branch', 'diff', 'diagnostics'},
		  lualine_c = {'filename'},
		  lualine_x = {'encoding', 'fileformat', 'filetype'},
		  lualine_y = {'progress'},
		  lualine_z = {'location'}
		},
		inactive_sections = {
		  lualine_a = {},
		  lualine_b = {},
		  lualine_c = {'filename'},
		  lualine_x = {'location'},
		  lualine_y = {},
		  lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	      }
	    )
	'';
      }
      {
	plugin = base16-vim;
	config = "colorscheme base16-tomorrow-night";
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
