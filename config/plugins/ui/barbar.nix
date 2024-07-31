{mkRegistration, ...}: {
  plugins.barbar = {
    enable = true;
    settings = {
      animation = false;
      auto_hide = false;
      clickable = true;
      focus_on_close = "left";
      insert_at_end = false;
      insert_at_start = false;
      maximum_length = 30;
      maximum_padding = 2;
      minimum_padding = 1;
      no_name_title = "[No Name]";
    };
    keymaps = {
      close.key = "<C-c>";
      previous.key = "<M-,>";
      next.key = "<M-.>";

      pick.key = "<leader>b";
    };
  };

  plugins.which-key.settings.spec = [
    (mkRegistration "<leader>b" " Buffers")
  ];
}
