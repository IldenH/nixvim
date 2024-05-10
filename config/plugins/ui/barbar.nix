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
      movePrevious = "<M-,>";
      moveNext = "<M-.>";

      pick = "<leader>bo";
    };
  };
}
