{
  inputs,
  pkgs,
  mkKeymap,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "move.nvim";
      src = inputs.move;
    })
  ];

  extraConfigLua = ''require("move").setup({})'';

  keymaps = [
    (mkKeymap "n" "<M-j>" ":MoveLine(1)<cr>" null)
    (mkKeymap "n" "<M-k>" ":MoveLine(-1)<cr>" null)
    (mkKeymap "i" "<M-j>" ":MoveLine(1)<cr>" null)
    (mkKeymap "i" "<M-k>" ":MoveLine(-1)<cr>" null)
    (mkKeymap "v" "<M-j>" ":MoveBlock(1)<cr>" null)
    (mkKeymap "v" "<M-k>" ":MoveBlock(-1)<cr>" null)
  ];
}
