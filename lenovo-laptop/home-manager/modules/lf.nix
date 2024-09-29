{pkgs, config, ... }: {

  xdg.configFile."lf/icons".source = ./lf-icons;
  programs.lf = {
    enable = true;
    settings = {
      icons = true;
    };
    commands = {
      open = "$$OPENER $f";
    };
  };

}
