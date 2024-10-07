{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    shellAliases =
      let
	flakePath = "/home/cujo/nix";
      in {
	hms = ''home-manager switch --flake '${flakePath}#cujo' -b "$(date)"'';
	rebuild = "sudo nixos-rebuild switch --flake '${flakePath}#nixos'";
	v = "nvim";
	r = "lf";
	lookgc = "looking-glass-client -m 97";
	wifi_connect = "sudo wpa_supplicant -c /home/cujo/wpa_supplicant.conf -i wlp4s0";
	ls = "lsd";
	rm = "rm -f";
    };

    prezto = {
      enable = true;
      prompt = {
	theme = "kylewest";
      };
      terminal = {
	autoTitle = true;
      };
    };

    envExtra = ''
      export EDITOR='nvim'
      export TERM='xterm-256color'
      export NIXPKGS_ALLOW_UNFREE=1
      export GST_PLUGIN_SYSTEM_PATH_1_0=/run/current-system/sw/lib/gstreamer-1.0/
      export GST_PLUGIN_SYSTEM_PATH=/run/current-system/sw/lib/gstreamer-1.0/
      export OPENER='mimeo'
      export VISUAL='nvim'
      export SHELL='zsh'
    '';
  };

}
