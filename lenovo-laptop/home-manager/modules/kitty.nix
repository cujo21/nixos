{

	programs.kitty = {
		enable = true;
		shellIntegration = {
			enableZshIntegration = true;
		};

		extraConfig = "
			#include /home/cujo/nix/lenovo-laptop/home-manager/modules/kitty-themes/catppuccin_mocha.conf
			shell zsh

			# Window layout

			remember_window_size  no
			initial_window_width  1280
			initial_window_height 800
			hide_window_decorations no

			# Tab bar

			tab_bar_style powerline
			tab_bar_align left 
			tab_bar_edge top
		"; 
	};

}

