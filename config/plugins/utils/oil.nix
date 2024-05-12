{mkKeymap, ...}: {
  plugins.oil = {
    enable = true;
    settings = {
      delete_to_trash = true;
      view_options = {
        show_hidden = true;
        # ../ doesn't work and there is probably a better way to do this
        is_always_hidden = ''
          function(name)
            if name == ".git" or name == ".direnv" or name == "../" then
              return true
            end
          end
        '';
      };
    };
  };

  keymaps = [
    # pencil unicode looks a bit strange
    (mkKeymap "n" "<leader>fe" "<cmd>Oil<cr>" "✎ Edit")
  ];
}
