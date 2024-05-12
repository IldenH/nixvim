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
    (mkKeymap "n" "<M-j>" "<cmd>MoveLine(1)<cr>" null)
    (mkKeymap "n" "<M-k>" "<cmd>MoveLine(-1)<cr>" null)
    (mkKeymap "i" "<M-j>" "<cmd>MoveLine(1)<cr>" null)
    (mkKeymap "i" "<M-k>" "<cmd>MoveLine(-1)<cr>" null)
    (mkKeymap "v" "<M-j>" "<cmd>MoveBlock(1)<cr>" null)
    (mkKeymap "v" "<M-k>" "<cmd>MoveBlock(-1)<cr>" null)
  ];
}
