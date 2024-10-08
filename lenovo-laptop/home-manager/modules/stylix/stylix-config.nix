{ pkgs, ... }: { 

  stylix = {
    enable = true;
    image = ./wallpapers/monogatari_1.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

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
      kde.enable = true;
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
