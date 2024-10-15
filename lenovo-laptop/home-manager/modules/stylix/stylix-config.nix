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
				package = pkgs.ubuntu-sans-mono;
				name = "UbuntuSansMono Nerd Font";
      };
      sansSerif = {
				package = pkgs.ubuntu-sans-mono;
				name = "UbuntuSansMono Nerd Font";
      };
      monospace = {
				package = pkgs.ubuntu-sans-mono;
				name = "UbuntuSansMono Nerd Font";
      };
      sizes = {
				applications = 11;
				desktop = 11;
				popups = 11;
				terminal = 11;
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
