{ pkgs, ... }: 
{

  programs.mpv = {
    enable = true;

    config = {
      geometry="1280x720";
    };

    profiles = {
      "music_opus" = {
	profile-desc = "set windows to 800x600 when .opus plays";
	profile-cond = ''filename:match"[.]opus$" ~= nil'';
	audio-display = "no";
      };
    };
  };

}
