# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/bundle.nix
    ];


  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  #GRUB 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
       enable = true;
       efiSupport = true;
       #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
       device = "nodev";
    };
  };

#  services.dnsmasq = {
#		enable = true;
# 		settings = {
#			server = [ "192.168.0.107" ];
#			};
#
#  };

  #FLAKES
  nix.settings.experimental-features = ["nix-command" "flakes"]; 
  
  #CACHIX
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  
  #networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  #networking.wireless.enable = true;  # Enables` wireless support via wpa_supplicant.
  #networking.networkmanager.unmanaged = [ "wlan0" ];
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  #services.avahi.enable = true;
  #services.avahi.nssmdns4 = false;
  #services.avahi.nssmdns6 = false;

# 	networking = {
#		networkmanager = {
#			enable = true;
#			wifi = {
#				powersave = false;
#			};
#			# insertNameservers = [ "1.1.1.1" ];
#		};
#		hostName = "nixos";
#		useDHCP = lib.mkDefault false;
#		interfaces.wlan0.useDHCP = lib.mkDefault true;
#		firewall.enable = false;
#	};
#	system.nssModules = lib.mkForce []; 
	
#	systemd.services.NetworkManager-wait-online.enable = false;
	
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
	
	services.gollum.math.enable = true;


  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
 
  # FLATPAK

  services.flatpak.enable = true;

  # KDE INSTALLATION
  #services.xserver.enable = true;
  #services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  #Hyprland 

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  #programs.kitty.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  programs.waybar.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images


  # DELETE OLDER THAN 30DAYS 
  nix.gc = {
    	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 30d";
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.cujo = {
     isNormalUser = true;
     extraGroups = [ "wheel" "input" "networkmanager" ]; # Enable ‘sudo’ for the user.
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     #vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     fastfetch
     home-manager
     inter
  #   wget
     kdePackages.filelight
     iwd
     xdg-desktop-portal-gtk
     xdg-desktop-portal-hyprland
  ];

  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    # wlr.enable = true;
    # lxqt.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
  #VIRT-MANAGER	

  #virtualisation.libvirtd.enable = true;
  #programs.virt-manager.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

