{pkgs, config, ... }: {

  xdg.configFile."lf/icons".source = ./lf-icons;

  programs.lf = {

    enable = true;

    settings = {
      icons = true;
      drawbox = true;
      ignorecase = true;
      preview = true;
      relativenumber = true;
      ratios = [
				1
				2
				3
      ];
    };

    commands = {
      open = ''&$OPENER "$f"'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
      '';
    };
    
    keybindings = {
      gh = "cd ~";
      e = ''$$EDITOR "$f"'';
      "<enter>" = ''$$OPENER "$f"'';
    };

    extraConfig = 
    let 
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''
        file=$1
        w=$2
        h=$3
        x=$4
        y=$5
        
        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi
        
        ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };

}
