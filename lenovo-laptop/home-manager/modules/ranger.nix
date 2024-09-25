{

  programs.ranger = {
    enable = true;
    extraConfig = "
      default_linemode devicons2
    ";
    settings = {
      preview_images_method = "kitty";
    };
    plugins = [
      {
	name = "devicons2";
	src = builtins.fetchGit {
	  url = "https://github.com/cdump/ranger-devicons2.git";
	  rev = "9606009aa01743768b0f27de0a841f7d8fe196c5";
	};
      }
      {
	name = "archives";
	src = builtins.fetchGit {
	  url = "https://github.com/maximtrp/ranger-archives.git";
	  rev = "b4e136b24fdca7670e0c6105fb496e5df356ef25";
	};
      }
    ];
  };

}
