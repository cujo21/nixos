{


        programs.bash = {
             
                shellAliases =
                let
                        flakePath = "/home/cujo/nix";
                in {
                        
                        rebuild = "sudo nixos-rebuild switch --flake '${flakePath}#nixos-server'";        
                };
        };

}


