{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
    };
    keymapsSilent = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Telescope";
      };
      "<leader>fs" = {
        action = "live_grep";
        options.desc = "Search";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Recent";
      };
      "<leader>fb" = "git_branches";
      "<leader>fg" = "git_files";
      "<leader>ft" = "git_status";
    };
		settings.defaults = {
			mappings = {
				i = {
					"<esc>".__raw = ''
						function(...) return require("telescope.actions").close(...) end
					'';
					"<C-k>".__raw = ''
						function(...) return require("telescope.actions").move_selection_previous(...) end
					'';
					"<C-j>".__raw = ''
						function(...) return require("telescope.actions").move_selection_next(...) end
					'';
				};
			};
		};
  };
	plugins.which-key.registrations = {
    "<leader>fb" = " Branches";
    "<leader>fg" = " Files";
    "<leader>ft" = " Status";
	};
}
