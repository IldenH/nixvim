{mkKeymap, ...}: {
  keymaps = [
    # probably a better way to do this
    (mkKeymap "n" "<C-s>" ":w<cr>" null)
    (mkKeymap "i" "<C-s>" ":w<cr>" null)
    (mkKeymap "v" "<C-s>" ":w<cr>" null)
  ];
}
