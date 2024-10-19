{ pkgs, ... }: {

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

	environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-connections
    epiphany
    gnome.geary 
    evince
  ];

}
