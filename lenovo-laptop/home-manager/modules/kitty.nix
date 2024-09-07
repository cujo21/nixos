{

	programs.kitty = {
		enable = true;
		shellIntegration = {
			enableBashIntegration = true;
		};
		theme = "Monokai Soda";
		font = {
			name = "Monospace";
			size = 11;
		};
		extraConfig = "
			# Window layout

			remember_window_size  no
			initial_window_width  1280
			initial_window_height 720
			hide_window_decorations yes

			# Tab bar

			tab_bar_style powerline
			tab_bar_align center	
		"; 
	};

}

