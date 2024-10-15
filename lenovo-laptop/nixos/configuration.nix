{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./modules/bundle.nix
    ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
       enable = true;
       efiSupport = true;
       device = "nodev";
    };
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"]; 
  
  networking.networkmanager.enable = true; 
	
	hardware.bluetooth = {
        	enable = true;
                powerOnBoot = true;
                settings = {
                        General = {
                                Enable = "Source,Sink,Media,Socket";
                                Experimental = true;
                        };
                };
        };
	
  time.timeZone = "Asia/Kolkata";
	
	services.gvfs.enable = true;
  services.flatpak.enable = true;
	services.blueman.enable = true;

  nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    };

  users.users.cujo = {
     isNormalUser = true;
     extraGroups = [ "wheel" "input" "networkmanager" ];
  };
	
	programs.hyprland.enable = true;
	environment.sessionVariables.NIXOS_OZONE_WL = "1";
	programs.nm-applet = {
		enable = true;
		indicator = true;
	};

  environment.systemPackages = with pkgs; [
     fastfetch
     home-manager
     inter
     kitty
     iwd
  ];

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    font-awesome
    nerdfonts
    jetbrains-mono
    corefonts
    vistafonts
    inconsolata
  ];

  programs.zsh.enable = true;

	services.openssh = {
		enable = true;
  		settings = {
			Ciphers = [
  				"chacha20-poly1305@openssh.com"
  				"aes256-gcm@openssh.com"
  				"aes128-gcm@openssh.com"
  				"aes256-ctr"
  				"aes192-ctr"
  				"aes128-ctr"
			];
		};
	}; 	

  system.stateVersion = "24.05"; 

}

