{
  plugins.which-key = {
    enable = true;
		registrations = {
      "<leader>f".name = " Files";
			"<leader>l".name = " LSP";
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
