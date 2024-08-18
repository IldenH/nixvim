{mkKeymap, ...}: {
  plugins.auto-session = {
    enable = true;
    logLevel = "error";
    autoRestore.enabled = false;
    autoSave.enabled = true;
    autoSession = {
      enabled = true;
      enableLastSession = false;
      createEnabled = true;
      useGitBranch = true;
    };
    extraOptions.silent_restore = true;
  };

  keymaps = [
    (mkKeymap "n" "<leader>s" "<cmd>SessionRestore<cr>" " Restore Session")
  ];
}
