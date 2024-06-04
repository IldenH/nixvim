{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
    };
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fs" = "live_grep";
      "<leader>fr" = "oldfiles";
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
    "<leader>ff" = " Find";
    "<leader>fs" = " Search";
    "<leader>fr" = " Recent";
    "<leader>fb" = " Branches";
    "<leader>fg" = " Files";
    "<leader>ft" = " Status";
  };
}
