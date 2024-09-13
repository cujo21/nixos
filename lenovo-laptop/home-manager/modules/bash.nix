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
			lookgc = "looking-glass-client -m 97";
			wifi_connect = "sudo wpa_supplicant -c /home/cujo/wpa_supplicant.conf -i wlp4s0";
		};
        };

}
