{

	programs.kitty = {
		enable = true;
		shellIntegration = {
			enableZshIntegration = true;
		};

		settings = {
			shell = "zsh";
			remember_window_size = false;
			hide_window_decorations = false;
			initial_window_width = 1280;
			initial_window_height = 800;
			tab_bar_style = "powerline";
			tab_bar_align = "left";
			tab_bar_edge = "top";
		};

		extraConfig = ''
			# background_opacity 0.90
		'';
	};

}

