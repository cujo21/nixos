{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaPeach;
    name = "Catppuccin-Mocha-Peach-Cursors";
    size = 40;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "Mononoki" ]; });
      name = "Mononoki Nerd Font Regular";
      size = 10;
    };
    iconTheme = {
      package = (pkgs.catppuccin-papirus-folders.override { flavor = "mocha"; accent = "peach"; });
      name  = "Papirus-Dark";
    };
    theme = {
      package = (pkgs.catppuccin-gtk.override { accents = [ "peach" ]; size = "standard"; variant = "mocha"; });
      name = "Catppuccin-Mocha-Standard-Peach-Dark";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

}
