# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
let

	cujopush = import ./shellscripts/cujopush.nix {inherit pkgs; };
in
{
	nix = {
		settings.experimental-features = [ "nix-command" "flakes" ]; 
 	};
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/bundle.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos-server"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

	networking = {
		networkmanager = {
			enable = true;
			insertNameservers = [ "192.168.0.1" ];
		};
		hostName = "nixos-server";
		useDHCP = false;
		
		interfaces.enp1s0.useDHCP = true;
		firewall.enable = false;
	};
	
	services.openssh = {
		enable = true;
		ports = [ 22 ];
		
		settings = {
			UseDns = false;
			PasswordAuthentication = false;
			PermitRootLogin = "no";
		};
	};
			
	virtualisation = {
		docker = {
			enable = true;
			daemon.settings = {
				data-root = "/home/cujo/docker_files";
				userland-proxy = false;
				experimental = true;
			};
		};
	};
	
#	services.caddy = {
#		enable = true;
#		virtualHosts."95661601.xyz".extraConfig = ''
#			redir /radarr /radarr/
#		   	redir /jellyfin /jellyfin/
#			redir /sonarr /sonarr/
#			redir /prowlarr /prowlarr/
#			
#			reverse_proxy /radarr/* {
#				to 192.168.0.104:7878
#			}
#			
#			reverse_proxy /jellyfin/* {
#				to 192.168.0.104:8096
#			}
#			
#			reverse_proxy /sonarr/* {
#				to 192.168.0.104:8989
#			}
#
#			reverse_proxy /prowlarr/* {
#				to 192.168.0.104:9696
#			}
#			
#			reverse_proxy {
#				to 192.168.0.104:8080
#			}
#		'';
#		virtualHosts."docker.95661601.xyz".extraConfig = ''
#			reverse_proxy {
#				to 192.168.0.104:9000
#			} 
#		'';
#		
#    	};
		  
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


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.cujo = {
    		isNormalUser = true;
    		extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    		packages = with pkgs; [
			docker-compose
    		];
  	};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    brightnessctl
    zip
    git
    cujopush 
    speedtest-cli
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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

