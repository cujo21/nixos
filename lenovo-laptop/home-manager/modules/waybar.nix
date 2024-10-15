{pkgs, ...}: {

	home.packages = with pkgs; [
		wlogout
	];

	programs.waybar = {
		enable = true;
		systemd.enable = true;

		style = ''
			* {
				border: none;
				border-radius: 0px;
			}
			
			window#waybar {
				background: transparent;
				margin: 5px;
			}
		
			#battery {
				padding: 5px;
			}

		'';

		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				height = 30;
				tray = { 
					spacing = 10;
				};
				output = [
					"eDP-1"
				];

				modules-left = [ 
					"hyprland/workspaces"
					"hyprland/window"
				];
				
				modules-center = [
					"clock"
				];

				modules-right = [ 
					"tray" 
					"cpu"
					"pulseaudio"
					"battery"
					"custom/wlogout"
				];

				"custom/wlogout" = {
					format = "⏻ ";
					interval = "once";
					on-click = "wlogout -c 5 -r 5 -p layer-shell";
				};

				"battery" = {
					format = "{capacity}% {icon}  ";
					format-alt = "{time} {icon}  ";
					format-charging = "{capacity}%   ";
					format-icons = [ "" "" "" "" "" ];
					format-plugged = "{capacity}%   ";
					states = {
						critical = 15;
						warning = 30;
					};
				};

				"clock" = {
					format-alt = "{:%Y-%m-%d}";
					tooltip-format = "{:%Y-%m-%d | %H:%M}";
				};

				"hyprland/window" = {
					rewrite = {
						"(.*) — Mozilla Firefox" = "󰈹  $1";
						"Spotify Premium" = "󰓇 ";
					};
					separate-outputs = true;
				};

	      pulseaudio = {
					format = "{volume}% {icon} {format_source}";
					format-bluetooth = "{volume}% {icon} {format_source}";
					format-bluetooth-muted = " {icon} {format_source}";
					format-icons = {
						car = "  ";
						default = [ " " "  " "  " ];
						handsfree = "  ";
						headphones = "  ";
						headset = "  ";
						phone = "  ";
						portable = "  ";
					};
					format-muted = " {format_source}";
					format-source = "{volume}%  ";
					format-source-muted = "";
					on-click = "pavucontrol";
				};

				cpu = {
					format = "  {usage}%   ";
					tooltip = false;
				};
			};
		};
	};

}
