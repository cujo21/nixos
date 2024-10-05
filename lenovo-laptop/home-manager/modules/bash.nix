{
        programs.bash = {
                enable = true;
                shellAliases =
		let
			flakePath = "/home/cujo/nix";
		in {
                        hms = "home-manager switch --flake '${flakePath}#cujo'";
			rebuild = "sudo nixos-rebuild switch --flake '${flakePath}#nixos'";
			v = "nvim";
			r = "ranger";
			lookgc = "looking-glass-client -m 97";
			wifi_connect = "sudo wpa_supplicant -c /home/cujo/wpa_supplicant.conf -i wlp4s0";
			ls = "lsd";
		};
		initExtra = "
		";
		bashrcExtra = "
		  export EDITOR='vim'
		  export TERM='xterm-256color'
		  export NIXPKGS_ALLOW_UNFREE=1
		  export GST_PLUGIN_SYSTEM_PATH_1_0=/run/current-system/sw/lib/gstreamer-1.0/
		  export GST_PLUGIN_SYSTEM_PATH=/run/current-system/sw/lib/gstreamer-1.0/
		  
		  export VISUAL='vim'
		  export PAGER=more
		";
        };

}
