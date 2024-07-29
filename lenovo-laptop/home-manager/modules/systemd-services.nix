{

	systemd.user.services.sycthing-autostart = {

		Unit = {
			Description = "Start syncthing";
		};

		Install = {
			WantedBy = [ "default.target" ];
		};

		Service = {
			ExecStart = /home/cujo/.nix-profile/bin/syncthing;
		};
	};

}
