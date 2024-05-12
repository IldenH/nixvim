{mkKeymap, ...}: {
  plugins.hop = {
    enable = true;
    settings = {
      keys = "asdfghjkløæqwertyuiopåzxcvbnm,.-";
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader><space>" "<cmd>HopWord<cr>" "Hop")
  ];
}
