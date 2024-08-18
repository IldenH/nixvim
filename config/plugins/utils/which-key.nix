{mkRegistration, ...}: {
  plugins.which-key = {
    enable = true;
    settings = {
      notify = false;
      spec = [
        (mkRegistration "<leader>f" " Files")
        (mkRegistration "<leader>t" " LaTeX")
        (mkRegistration "<leader>l" " LSP")
      ];
      icons = {
        mappings = false;
        separator = "➜";
        group = "";
      };
      triggers_black_list = {
        i = ["h" "j" "k" "l" "v"];
        v = ["h" "j" "k" "l"];
      };
    };
  };
}
