{

  programs.plasma = {
    enable = true;
	
	workspace = {
		colorScheme = "CatppuccinMocha";
	};

  hotkeys.commands = {
			"launch-kitty" = {
				name = "Launch Kitty";
				key = "Meta+T";
				command = "kitty";
			};
			"launch-firefox" = {
				name = "Launch Firefox";
				key = "Meta+F";
				command = "firefox";
			};
		};
	};

}
