{

        description = "System Configuration";
        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

                home-manager = {
                        url = "github:nix-community/home-manager";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
        };

        outputs = { self, nixpkgs, home-manager, ... }:
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
                        modules = [ ./lenovo-laptop/home-manager/home.nix ];
                        };

                nixosConfigurations.nixos-server = nixpkgs.lib.nixosSystem {
                        inherit system;
                        modules = [ 
                                ./server/nixos/configuration.nix
                                ];
                };
        };

}


