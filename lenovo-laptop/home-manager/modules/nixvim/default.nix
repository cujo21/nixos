{

  programs.nixvim = {
    enable = true;
  };

  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins/default.nix
  ];

}
