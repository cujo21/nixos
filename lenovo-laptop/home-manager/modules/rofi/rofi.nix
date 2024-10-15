{ pkgs, ... }: {

	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland-unwrapped;
		font = "Roboto Nerd Font";	
		theme = "./catppuccin-mocha.rasi";
		configPath = "./config.rasi";
	};

};
