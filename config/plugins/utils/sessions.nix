{mkKeymap, ...}: {
  plugins.auto-session = {
    enable = true;
    autoRestore.enabled = false;
    autoSave.enabled = true;
    autoSession = {
      enabled = true;
      enableLastSession = true;
      createEnabled = true;
      useGitBranch = true;
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>s" ":SessionRestore<cr>" " Restore Session")
  ];
}
