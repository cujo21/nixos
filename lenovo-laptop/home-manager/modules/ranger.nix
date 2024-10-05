{

  programs.ranger = {
    enable = true;
    mappings = {
      yp = "oscyank path";
      yd = "oscyank dir";
      yn = "oscyank name";
      "y." = "oscyank name_without_extension";
    };
    extraConfig = "
      default_linemode devicons2
    ";
    settings = {
      preview_images_method = "kitty";
      line_numbers = "relative";
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
      {
	name = "oscyank";
	src = builtins.fetchGit {
	  url = "https://github.com/laggardkernel/ranger-oscyank.git";
	  rev = "4bd84de5fde0b7edb223d62a5a4ee9ef4f1fe472";
	};
      }
    ];
  };

}
