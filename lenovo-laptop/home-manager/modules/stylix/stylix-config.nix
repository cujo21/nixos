{ pkgs, ... }: { 

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./wallpapers/monogatari_1.png;
    polarity = "dark";
		base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

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
				applications = 11;
				desktop = 11;
				popups = 11;
				terminal = 12;
      };
    };
  };

}
