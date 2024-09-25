{

  programs.ranger = {
    enable = true;
    plugins = [
      {
	name = "ranger-devicons2"
	src = builtins.fetchGit {
	  url = "https://github.com/cdump/ranger-devicons2.git";
	  rev "9606009aa01743768b0f27de0a841f7d8fe196c5";
	};
      }
    ];
  };

}
