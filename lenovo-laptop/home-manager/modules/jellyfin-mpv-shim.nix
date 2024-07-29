{ pkgs, ... }: {
	
	home.packages = with pkgs; [ jellyfin-mpv-shim ];
	
	systemd.user.services.jellyfin-mpv-shim = {
	
		Unit = { 
			Description = "Start jellyfin-mpv-shim";
		};

		Install = {
			WantedBy = [ "default.target" ];
		};
		
		Service = {
			ExecStart = /home/cujo/.nix-profile/bin/jellyfin-mpv-shim;
		};
	};
}
