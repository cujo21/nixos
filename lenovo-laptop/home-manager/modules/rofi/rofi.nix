{ pkgs, lib, ... }: {

	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland-unwrapped;
		theme = lib.mkForce "./nix/lenovo-laptop/home-manager/modules/rofi/catppuccin-mocha.rasi";
		extraConfig = {
				modi = "run,drun,window";
				show-icons = true;
				terminal = "kitty";
				drun-display-format = "{icon} {name}";
				location = 0;
				disable-history = false;
				hide-scrollbar = true;
				display-drun = "   Apps ";
				display-run = "   Run ";
				display-window = " 󰕰  Window";
				display-Network = " 󰤨  Network";
				sidebar-mode = true;
			};
	};

}
