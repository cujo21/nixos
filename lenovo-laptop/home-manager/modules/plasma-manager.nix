{ pkgs, ... }: {

  home = {
    packages = with pkgs; [
      catppuccin-kde
    ];
  };

  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "CatppuccinFrappeBlue"; # plasma-apply-colorscheme --list-schemes
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
