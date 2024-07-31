{ config, pkgs, lib, ... }: {
	home = {
		username = "cujo";
		homeDirectory = "/home/cujo";
		stateVersion = "24.05";

		packages = with pkgs; [
			htop
			firefox
			keepassxc
			syncthing
			unzip 
			zip
			neovim
			tree
			pciutils
			mpv
			looking-glass-client
			ungoogled-chromium
			spotify
			vscodium
			logseq
			git
			noto-fonts-cjk-sans
			speedtest-cli
			nix-bash-completions
			qbittorrent
			android-tools
			finamp
			freecad
			speedtest-cli
			rpi-imager
			wget
			busybox
			rar
			flameshot
			libreoffice	
		];
	};
	
	imports = [
		./modules/bundle.nix
		./bash/scripts.nix
	];

	  nixpkgs = {
	    config = {
	      allowUnfree = true;
	      allowUnfreePredicate = (_: true);
	    };
	  };
        nixpkgs.config.permittedInsecurePackages = [
                "electron-27.3.11"
        ];
	
}
