{

	programs.hyprland.enable = true;
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
	programs.nm-applet = {
		enable = true;
		indicator = true;
	};


}
