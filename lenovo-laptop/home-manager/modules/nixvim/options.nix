{

  programs.nixvim = {
    defaultEditor = true;
    
    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      breakindent = true;
      smartindent = true;
      mouse = "a";
      termguicolors = true;
      encoding = "UTF-8";
    };

		clipboard = {
			providers.wl-copy.enable = true;
		};
  };

}
