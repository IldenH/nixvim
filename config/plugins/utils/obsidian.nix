{
  mkRegistration,
  mkKeymap,
  ...
}: {
  plugins.obsidian = {
    enable = true;
    settings = {
      workspaces = [
        {
          name = "vault";
          path = "~/dev/Vault";
        }
      ];

      notes_subdir = "notes";
      templates.subdir = "templates";
      attachments.img_folder = "assets";

      daily_notes = {
        folder = "daily";
        date_format = "%Y-%m-%d";
      };

      completion.min_chars = 0;

      log_level = "error";

      note_id_func =
        # lua
        ''
          function(title)
            local name = ""
            if title ~= nil then
              -- If title is given, transform it into valid file name.
              name = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
              -- If title is nil, just add 4 random uppercase letters to the name.
              for _ = 1, 4 do
                name = name .. string.char(math.random(65, 90))
              end
            end
            return name
          end
        '';
    };
  };

  plugins.which-key.settings.spec = [
    (mkRegistration "<leader>o" " Obsidian")
  ];

  keymaps = [
    (mkKeymap "n" "<leader>on" "<cmd>ObsidianNew<cr>" " New note")
    (mkKeymap "n" "<leader>op" "<cmd>ObsidianOpen<cr>" " Open")
    (mkKeymap "n" "<leader>or" "<cmd>ObsidianRename<cr>" "󱇨 Rename")
    (mkKeymap "n" "<leader>ob" "<cmd>ObsidianBacklinks<cr>" " Backlinks")
    (mkKeymap "n" "<leader>of" "<cmd>ObsidianQuickSwitch<cr>" " Find")
    (mkKeymap "n" "<leader>os" "<cmd>ObsidianSearch<cr>" " Search")
    (mkKeymap "n" "<leader>od" "<cmd>ObsidianDailies<cr>" " Dailies")
    (mkKeymap "n" "<leader>ot" "<cmd>ObsidianToday<cr>" " Today")
    (mkKeymap "n" "<leader>oi" "<cmd>ObsidianPasteImg<cr>" " Paste img")
  ];
}