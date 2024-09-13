{

        description = "System Configuration";
        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

                home-manager = {
                        url = "github:nix-community/home-manager";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
	
                nix-flatpak.url = "github:gmodena/nix-flatpak";
		hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        };

        outputs = { self, nixpkgs, home-manager, nix-flatpak, hyprland, ... } @inputs :
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
			  {
			    wayland.windowManager.hyprland = {
			      enable = true;
			      package = inputs.hyprland.packages.${system}.hyprland;
			    };
			  }
                          ./lenovo-laptop/home-manager/home.nix
			  ];
                        };		
        };

}


