{mkKeymap, ...}: {
  keymaps = [
    # probably a better way to do this
    (mkKeymap "n" "<C-s>" "<cmd>w<cr>" null)
    (mkKeymap "i" "<C-s>" "<cmd>w<cr>" null)
    (mkKeymap "v" "<C-s>" "<cmd>w<cr>" null)
  ];
}
