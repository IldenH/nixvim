{
  plugins.barbar = {
    enable = true;
    animation = false;
    autoHide = false;
    clickable = true;
    focusOnClose = "left";
    insertAtEnd = false;
    insertAtStart = false;
    maximumLength = 30;
    maximumPadding = 2;
    minimumPadding = 1;
    noNameTitle = "[No Name]";
    keymaps = {
      silent = true;

      close = "<C-c>";
      previous = "<M-,>";
      next = "<M-.>";

      pick = "<leader>b";
    };
  };

	plugins.which-key.registrations = {
		"<leader>b" = " Buffers";
	};
}
