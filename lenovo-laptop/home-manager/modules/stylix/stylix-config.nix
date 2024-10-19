{ pkgs, ... }: { 

  stylix = {
    enable = true;
    image = ./wallpapers/monogatari_1.png;
    polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
		opacity = {
			applications = 1.0;
			terminal = 1.0;
			desktop = 1.0;
			popups = 1.0;
		};

    fonts = {
      serif = {
				package = pkgs.roboto;
				name = "Roboto Nerd Font";
      };
      sansSerif = {
				package = pkgs.roboto;
				name = "Roboto Nerd Font";
      };
      monospace = {
				package = pkgs.roboto-mono;
				name = "RobotoMono Nerd Font";
      };
			emoji = {
				package = pkgs.noto-fonts-emoji;
				name = "Noto Color Emoji";
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
