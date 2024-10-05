{

	programs.kitty = {
		enable = true;
		shellIntegration = {
			enableZshIntegration = true;
		};

		font = {
			name = "Hack";
			size = 11;
		};
		extraConfig = "
			include /home/cujo/nix/lenovo-laptop/home-manager/modules/kitty-themes/base16-tomorrow-night-256.conf
			shell zsh
			# Window layout

			remember_window_size  no
			initial_window_width  1440
			initial_window_height 900
			hide_window_decorations no

			# Tab bar

			tab_bar_style powerline
			tab_bar_align left 
			tab_bar_edge top
		"; 
	};

}

