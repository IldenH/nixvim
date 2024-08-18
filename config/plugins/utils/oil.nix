{mkKeymap, ...}: {
  plugins.oil = {
    enable = true;
    settings = {
      delete_to_trash = true;
      view_options = {
        show_hidden = true;
        is_always_hidden = ''
          function(name)
            if name == ".git" or name == ".direnv" then
              return true
            end
          end
        '';
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>fe" "<cmd>Oil<cr>" "󱇨 Edit")
  ];
}
