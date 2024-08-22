{mkRegistration, ...}: {
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
    };
  };

  # TODO: maybe mappings
  # plugins.which-key.settings.spec = [
  #   (mkRegistration "<leader>o" " Obsidian")
  # ];
}
