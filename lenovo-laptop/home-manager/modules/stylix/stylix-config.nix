{ pkgs, ... }: { 

  stylix = {
    enable = true;
    image = ./wallpaper.jpeg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    fonts = {
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
    cursor = {
      package = pkgs.catppuccin-cursors;
      name = "Mocha Pink";
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
