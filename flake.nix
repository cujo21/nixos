{

        description = "System Configuration";
        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

                home-manager = {
                        url = "github:nix-community/home-manager";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
	
		nix-flatpak.url = "github:gmodena/nix-flatpak";

		nix-on-droid = {
	      		url = "github:nix-community/nix-on-droid/release-24.05";
	      		inputs.nixpkgs.follows = "nixpkgs";
	    	};
        };

        outputs = { self, nixpkgs, home-manager, nix-flatpak, nix-on-droid, ... }:
                let 
                        system = "x86_64-linux";
                in {
                nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                        inherit system;
                        modules = [ 
                                ./lenovo-laptop/nixos/configuration.nix
                                ];
                };

                homeConfigurations.cujo = home-manager.lib.homeManagerConfiguration {
                        pkgs = nixpkgs.legacyPackages.${system};
                        modules = [
				 nix-flatpak.homeManagerModules.nix-flatpak
				 ./lenovo-laptop/home-manager/home.nix 
				];
                        };

                nixosConfigurations.nixos-server = nixpkgs.lib.nixosSystem {
                        inherit system;
                        modules = [ 
                                ./server/nixos/configuration.nix
                                ];
                };

		nixOnDroidConfigurations.android = nix-on-droid.lib.nixOnDroidConfiguration {
			pkgs = import nixpkgs { system = "aarch64-linux"; };
			modules = [
				./nix-on-droid/nix-on-droid.nix
				];
		};
        };

}


