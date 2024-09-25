{

  programs.mpv = {
    enable = true;
    config = {
      geometry="50%:50%";
      profile="gpu-hq";
    }
    defaultProfiles = [ "gpu-hq" ];
  };

}
