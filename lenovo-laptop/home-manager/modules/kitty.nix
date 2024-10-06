{

	programs.kitty = {
		enable = true;
		shellIntegration = {
			enableZshIntegration = true;
		};

		font = {
			name = "JetBrainsMono Nerd Font";
			size = 12;
		};
		extraConfig = "
			include /home/cujo/nix/lenovo-laptop/home-manager/modules/kitty-themes/catppuccin_mocha.conf
			shell zsh
			background_opacity 0.8

			# Window layout

			remember_window_size  no
			initial_window_width  1920
			initial_window_height 1080
			hide_window_decorations yes

			# Tab bar

			tab_bar_style powerline
			tab_bar_align left 
			tab_bar_edge top
		"; 
	};

}

