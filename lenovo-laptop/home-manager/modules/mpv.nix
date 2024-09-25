{

  programs.mpv = {
    enable = true;
    #config = {
    #  geometry="640x480";
    #};
    profiles = {
      "music_opus" = {
	profile-desc = "set windows to 800x600 when .opus plays";
	profile-cond = ''filename:match"[.]opus$" ~= nil'';
	geometry = "800x600";
      };
    };
  };

}
