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
			r = "lf";
			lookgc = "looking-glass-client -m 97";
			wifi_connect = "sudo wpa_supplicant -c /home/cujo/wpa_supplicant.conf -i wlp4s0";
			ls = "lsd";
		};
		initExtra = "
		";
		bashrcExtra = "
		  export EDITOR='vim'
		  export TERM='xterm-256color'
		  export OPENER='mimeo'
		  export NIXPKGS_ALLOW_UNFREE=1
		";
        };

}
