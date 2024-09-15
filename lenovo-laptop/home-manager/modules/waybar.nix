{pkgs, ...}: {

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	layer = "top";
	position = "top";
	height = 30;
	output = [
	  "eDP-1"
	];
	modules-right = [ "battery" ];
	"battery" = {
	  "states" = { 
	    "good" = 95;
	    "warning" = 30;
	    "critical" = 20;
	  };
	  "format" = "{icon}  {capacity}%";
	  "format-charging" = " {capacity}%";
	  "format-plugged" = " {capacity}%";
	  "format-alt" = "{time} {icon}";
	  "format-icons" = ["" "" "" "" ""];
	};
      };
    };
  };
}
