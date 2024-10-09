{
	programs.nixvim = {
		plugins.web-devicons.enable = true;
		plugins.telescope = {
			enable = true;
			extensions = {
				file-browser = {
					enable = true;
				};
			};
			keymaps = {
				"ff" = {
					action = "find_files";
				};
			};
		};
	};

}
