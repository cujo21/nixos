{


        programs.bash = {
             
                shellAliases =
                let
                        flakePath = "/home/cujo/nix";
                in {
                        
                        rebuild = "sudo nixos-rebuild switch --flake '${flakePath}#nixos-server'";
			docker_update = "docker run --rm -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --run-once ";
			radarr_update = "docker exec -it recyclarr recyclarr sync -c /config/radarr.yml";
			anime_update = "docker exec -it recyclarr recyclarr sync -c /config/sonarr_anime.yml";
			rip = "/home/cujo/.local/bin/rip"
                };
			
        };

}


