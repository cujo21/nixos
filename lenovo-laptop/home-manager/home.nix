{ pkgs, ... }: {
	home = {
		username = "cujo";
		homeDirectory = "/home/cujo";
		stateVersion = "24.05";

		packages = with pkgs; [
			htop
			firefox
			keepassxc
			unzip 
			zip
			tree
			pciutils
			looking-glass-client
			spotify
			vscodium
			logseq
			git
			noto-fonts-cjk-sans
			speedtest-cli
			qbittorrent
			android-tools
			speedtest-cli
			rpi-imager
			wget
			busybox
			rar
			flameshot
			libreoffice
			ffmpeg
			parted
			qownnotes
			thunderbird
			payload-dumper-go
			wireguard-tools
			wl-clipboard
			timg
			easyeffects
			onlyoffice-bin
			discord
			glow
			ghostwriter
			strawberry
			streamrip
			lollypop
			lsd
			ocs-url
			mimeo
			zathura
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
