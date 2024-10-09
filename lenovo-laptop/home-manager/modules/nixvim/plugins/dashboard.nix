{

	programs.nixvim = {
		plugins.dashboard = {
			enable = true;

			settings = {
				change_to_vcs_root = true;
				config = {
					header = [
						"███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
						"████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
						"██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
						"██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
						"██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
						"╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
					];
					footer = [
						"Welcome back, cujo"
					];
					mru = {
						limit = 10;
					};
					project = {
						enable = false;
					};
					shortcut = [
						{
							action = {
								__raw = "function(path) vim.cmd('Telescope find_files') end";
							};
							desc = "Files";
							group = "Label";
							icon = " ";
							icon_hl = "@variable";
							key = "f";
						}
					];
					week_header = {
						enable = true;
					};
				};
				theme = "hyper";	
			};
		};
	};

}
