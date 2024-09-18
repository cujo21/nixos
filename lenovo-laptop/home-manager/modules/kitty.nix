{

	programs.kitty = {
		enable = true;
		shellIntegration = {
			enableBashIntegration = true;
		};

		font = {
			name = "Monospace";
			size = 11;
		};
		extraConfig = "
			include /home/cujo/nix/lenovo-laptop/home-manager/modules/rose-pine.conf
			# Window layout

			remember_window_size  no
			initial_window_width  1920
			initial_window_height 1080
			hide_window_decorations no

			# Tab bar

			tab_bar_style powerline
			tab_bar_align center
		"; 
	};

}

