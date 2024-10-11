{pkgs, ... }: {

  home.packages = with pkgs; [
    rofi-wayland-unwrapped
		pavucontrol
  ];

	services = {
		blueman-applet.enable = true;
	};

  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
			
			general = {
				gaps_in = 3;
				gaps_out = 3;
			};
			decoration = {
				rounding = "5";
				blur = {
					enabled = true;
					size = 8;
				};
			};
			input = {
				touchpad = {
					natural_scroll = true;
				};
			};
			gestures = {
				workspace_swipe = true;
			};
			misc = {
				disable_hyprland_logo = true;
			};

      bind =
				[
					"$mod, F, exec, firefox"
					", Print, exec, grimblast copy area"
					"$mod, T, exec, kitty"
					"$mod, SPACE, exec, rofi -show drun"
					"$mod, G, exec, thunar"

					"$mod, 1, workspace, 1"
					"$mod, 2, workspace, 2"
					"$mod, 3, workspace, 3"
					"$mod, 4, workspace, 4"
					"$mod, 5, workspace, 5"
					"$mod&Shift_L, 1, movetoworkspacesilent, 1"
					"$mod&Shift_L, 2, movetoworkspacesilent, 2"
					"$mod&Shift_L, 3, movetoworkspacesilent, 3"
					"$mod&Shift_L, 4, movetoworkspacesilent, 4"
					"$mod&Shift_L, 5, movetoworkspacesilent, 5"

					"$mod, Q, killactive,"
					"$mod, M, exit,"
					"$mod&Shift_L, F, togglefloating,"
				]
				++ (
				# workspaces
				# binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
				builtins.concatLists (builtins.genList (i:
					let ws = i + 1;
					in [
						"$mod, code:1${toString i}, workspace, ${toString ws}"
						"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
					]
					)
					9)
				);
			bindm = [
					"$mod, mouse:272, movewindow"
			];
      env = 
				[
				"XCURSOR_SIZE,16"
				"GTK_THEME,adw-gtk3"
				"HYPRCURSOR_SIZE,16"
				];
		};
    extraConfig = "
      monitor = eDP-1, 1920x1080@165.00Hz, 0x0, 1
    ";
  };
}
