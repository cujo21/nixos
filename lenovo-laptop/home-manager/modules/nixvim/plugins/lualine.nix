{
	programs.nixvim = {
		plugins.lualine = {
			enable = true;
			
			settings = {
				options = {
					disabled_filetypes = {
						__unkeyed-1 = "neo-tree";
						__unkeyed-2 = "dashboard";
					};
					icons_enabled = true;
					theme = "auto";
					globalstatus = true;
					component_separators = {
	          left = "";
		        right = "";
					};
					section_separators = {
						left = "";
						right = "";
					};
					always_divide_middle = true;
				};
				sections = {
					lualine_a = [
						{ __unkeyed-1 = "mode"; }
					];
					lualine_b = [
						{ __unkeyed-1 = "branch"; }
						{ __unkeyed-1 = "diff"; }
						{ __unkeyed-1 = "diagnostics"; }
					];
					lualine_c = [
						{ __unkeyed-1 = "filename"; }
					];
					lualine_x = [
						{ __unkeyed-1 = "encoding"; }
						{ __unkeyed-1 = "fileformat"; }
						{ __unkeyed-1 = "filetype"; }
					];
					lualine_y = [
						{ __unkeyed-1 = "progrss"; }
					];
					lualine_z = [
						{ __unkeyed-1 = "location"; }
					];
				};
			};
		};
	};

}
