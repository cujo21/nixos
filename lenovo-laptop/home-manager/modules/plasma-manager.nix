{

  programs.plasma = {
    enable = true;
	
	workspace = {
		colorScheme = "RosPine";
		splashScreen = {
			engine = "none";
			theme = "None";
		};
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
