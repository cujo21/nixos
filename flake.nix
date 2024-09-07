{

        description = "System Configuration";
        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

                home-manager = {
                        url = "github:nix-community/home-manager";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
	
                nix-flatpak.url = "github:gmodena/nix-flatpak";

                nixvim = {
                  url = "github:nix-community/nixvim";
                  # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
                  inputs.nixpkgs.follows = "nixpkgs";
                };
        };

        outputs = { self, nixpkgs, home-manager, nix-flatpak, nixvim, ... } :
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
                          nix-flatpak.homeManagerModules.nix-flatpak
                          nixvim.homeManagerModules.nixvim
                          ./lenovo-laptop/home-manager/home.nix
			  ];
                        };		
        };

}


