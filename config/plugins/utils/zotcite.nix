{
  pkgs,
  inputs,
  mkKeymap,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "zotcite";
      src = inputs.zotcite;
    })
  ];

  extraConfigLua =
    # lua
    ''
      require("zotcite").setup({
          -- your options here (see doc/zotcite.txt)
      })
    '';

  keymaps = [
    # TODO
  ];
}
