{ pkgs, ... }: { 

  stylix = {
    enable = true;
    autoEnable = true;
    image = ./wallpapers/monogatari_1.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    fonts = {
      serif = {
				package = pkgs.roboto;
				name = "Roboto";
      };
      sansSerif = {
				package = pkgs.roboto;
				name = "Roboto";
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

    targets = {
      kitty = {
				enable = true;
				variant256Colors = true;
      };
      neovim = {
				enable = true;
      };
    };
  };

}
