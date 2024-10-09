{

  programs.nixvim = {
    defaultEditor = true;
    enbaleMan = true;
    
    globalOpts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      encoding = "UTF-8";
      nocompatible = true;
      mapleader = " ";
      filetype = true;
    };
  };

}
