{ config, pkgs, lib, ... }: {
	home = {
		username = "cujo";
		homeDirectory = "/home/cujo";
		stateVersion = "24.05";

		packages = with pkgs; [
			htop
			firefox
			keepassxc
			#syncthing
			unzip 
			zip
			#neovim
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
			#freecad
			speedtest-cli
			rpi-imager
			wget
			busybox
			rar
			flameshot
			libreoffice
			#filezilla
			ffmpeg
			parted
			#element-desktop
			brave
			#obsidian
			#qownnotes
			thunderbird
			payload-dumper-go
			telegram-desktop
			wireguard-tools
			wl-clipboard
			timg
			easyeffects
			onlyoffice-bin
			discord
			#deluge
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

	#services.flatpak = {
	#	enable = true;
	#	packages = [
	#		{ appId = "com.spotify.Client"; origin = "flathub"; }
	#		
	#		"com.logseq.Logseq"
	#		"com.anydesk.Anydesk"
	#		"org.onlyoffice.desktopeditors"
	# 		];
	#};
	nixpkgs.config.permittedInsecurePackages = [
                "electron-27.3.11"
        ];
}
