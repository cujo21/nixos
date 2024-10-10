{pkgs, ...}: {

	programs.waybar = {
		enable = true;
		systemd.enable = true;

		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				height = 10;
				output = [
					"eDP-1"
				];
				modules-left = [ "hyprland/workspaces" ];
				modules-center = [ "clock" ];
				modules-right = [ "tray" "battery" ];
				"battery" = {
					interval = 60;
					states = {
						warning = 30;
						critical = 20;
					};
					format = " {capacity}% {icon} ";
					format-icons = ["" "" "" "" ""];
					max-length = 25;
				};
				"clock" = {
					interval = 60;
					format = " {:%H:%M} ";
					max-length = 25;
				};
			};
		};
	};

}
