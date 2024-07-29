{ configs, pkgs, ... }: {

	home.packages = [
		(import ./cujopush.nix { inherit pkgs; })
	];

}

