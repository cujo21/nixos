{

  description = "System Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    stylix = {
			# url = "github:danth/stylix";
			url = "github:danth/stylix/ed91a20c84a80a525780dcb5ea3387dddf6cd2de";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    nixvim = {
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };
		hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, plasma-manager, stylix, nixvim, hyprland, ... } @inputs :
	  let 
		  system = "x86_64-linux";
	  in {
	  nixosConfigurations = {
		  nixos = nixpkgs.lib.nixosSystem {
			  inherit system;
			  modules = [ 
				  ./lenovo-laptop/nixos/configuration.nix
			  ];
		  };
		  nixos-server = nixpkgs.lib.nixosSystem {
			  inherit system;
			  modules = [
				  ./server/nixos/configuration.nix
			  ];
		  };
	  };

	  homeConfigurations.cujo = home-manager.lib.homeManagerConfiguration {
		  pkgs = nixpkgs.legacyPackages.${system};
		  modules = [
		    inputs.plasma-manager.homeManagerModules.plasma-manager
		    nix-flatpak.homeManagerModules.nix-flatpak
		    nixvim.homeManagerModules.nixvim
		    stylix.homeManagerModules.stylix
				{  
					wayland.windowManager.hyprland = {
						enable = true;
						# set the flake package
						package = inputs.hyprland.packages.${system}.hyprland;
					};
				}

		    ./lenovo-laptop/home-manager/home.nix
		  ];
	  };		
  };

}


