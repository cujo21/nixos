{ pkgs }:

pkgs.writeShellScriptBin "cujopush" ''
        cd /home/cujo/nix
        curdate=$(date +'%D')
        git add .
        git commit -m $curdate 
        git branch -M main
        git remote add origin https://github.com/cujo21/nixos-configs.git
        git push -u origin main
''


