{ pkgs, ... }: { 

  stylix = {
    enable = true;
    image = ./wallpapers/monogatari_1.png;
    polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
		opacity = {
			applications = 0.8;
			terminal = 0.8;
			desktop = 0.8;
			popups = 0.8;
		};

    fonts = {
      serif = {
				package = pkgs.jetbrains-mono;
				name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
				package = pkgs.jetbrains-mono;
				name = "JetBrainsMono Nerd Font";
      };
      monospace = {
				package = pkgs.jetbrains-mono;
				name = "JetBrainsMono Nerd Font";
      };
      sizes = {
				applications = 12;
				desktop = 12;
				popups = 12;
				terminal = 12;
      };
    };

		targets = {
			firefox.enable = true;
			kitty.enable = true;
			nixvim.enable = true;
			hyprland.enable = true;
			kde.enable = true;
			waybar.enable = true;
			rofi.enable = true;
		};

  };

}
