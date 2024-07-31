{mkRegistration, ...}: {
  plugins.which-key = {
    enable = true;
    settings.spec = [
      (mkRegistration "<leader>f" " Files")
      (mkRegistration "<leader>t" " LaTeX")
      (mkRegistration "<leader>l" " LSP")
    ];
    icons = {
      separator = "➜";
      group = "";
    };
    triggersBlackList = {
      i = ["h" "j" "k" "l" "v"];
      v = ["h" "j" "k" "l"];
    };
  };
}
