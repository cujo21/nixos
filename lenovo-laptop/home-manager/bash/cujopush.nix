{ pkgs }:

pkgs.writeShellScriptBin "cujopush" ''
	cd /home/cujo/nix
        curdate=$(date +'%D')
	git add .
	git commit -m $curdate
	git push -u origin main
	rebuild
	hms
''


