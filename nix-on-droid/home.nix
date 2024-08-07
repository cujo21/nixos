{ configs, pkgs, lib, ... }:

{
	home = {
		username = "nix-on-droid";
		homeDirectory = "/data/data/com.termux.nix/files/home";
		stateVersion = "24.05";
		packages = with pkgs; [
			fastfetch
			];
	};

	programs.bash = {
		enable = true;
		shellAliases = 
		let 
			flakePath = "/data/data/com.termux.nix/files/home";
		in 
			{
				rebuild = "nix-on-droid switch --flake '${flakePath}#android'";
			};
		bashrcExtra = ''
			export PS1="\u@\H :"
		'';
		initExtra = ''
			source ~/.bashrc
		'';
	}; 

}
