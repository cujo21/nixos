{ configs, pkgs, lib, ... }:

{
	home = {
		username = "nix-on-droid";
		homeDirectory = "/data/data/com.termux.nix/files/home";
		stateVersion = "24.05";
		packages = with pkgs; [
			fastfetch
			];
	};

}
