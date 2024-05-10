{
  plugins.which-key = {
    enable = true;
		registrations = {
      "<leader>f".name = " Files";
		};
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
