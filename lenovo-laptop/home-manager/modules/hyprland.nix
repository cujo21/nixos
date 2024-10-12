{pkgs, ... }: {

  home.packages = with pkgs; [
    rofi-wayland-unwrapped
		pavucontrol
    qt5ct
		qt6ct
  ];

	services = {
		blueman-applet.enable = true;
	};

  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
			
			general = {
				gaps_in = 0;
				gaps_out = 0;
			};
			decoration = {
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
					"$mod&Shift_L, 1, movetoworkspace, 1"
					"$mod&Shift_L, 2, movetoworkspace, 2"
					"$mod&Shift_L, 3, movetoworkspace, 3"
					"$mod&Shift_L, 4, movetoworkspace, 4"
					"$mod&Shift_L, 5, movetoworkspace, 5"

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
					"$mod, mouse:273, resizewindow"
			];
      env = 
				[
				"XCURSOR_SIZE,16"
				"GTK_THEME,adw-gtk3"
				"HYPRCURSOR_SIZE,16"
				"QT_QPA_PLATFORMTHEME,qt5ct"
				"QT_QPA_PLATFORM,wayland"
				];
		};
    extraConfig = "
      monitor = eDP-1, 1920x1080@165.00Hz, 0x0, 1
    ";
  };
}
