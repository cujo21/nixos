{
	programs.nixvim = {
		plugins.neo-tree = {
			enable = true;
			sources = ["filesystem" "buffers" "git_status" "document_symbols"];
			addBlankLineAtTop = true;

			filesystem = {
				bindToCwd = false;
				followCurrentFile = {
					enabled = true;
				};
			};

			defaultComponentConfigs = {
				indent = {
					withExpanders = true;
					expanderCollapsed = "󰅂";
					expanderExpanded = "󰅀";
					expanderHighlight = "NeoTreeExpander";
				};

				gitStatus = {
					symbols = {
						added = " ";
						conflict = "󰩌 ";
						deleted = "󱂥";
						ignored = " ";
						modified = " ";
						renamed = "󰑕";
						staged = "󰩍";
						unstaged = "";
						untracked = " ";
					};
				};
			};
		};

		keymaps = [
			{
				mode = ["n"];
				key = "<C-t>";
				action = "<cmd>Neotree toggle<cr>";
				options = {desc = "Open/Close Neotree";};
			}
		];
	};
}
