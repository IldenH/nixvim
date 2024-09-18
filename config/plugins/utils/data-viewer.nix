{
  pkgs,
  inputs,
  mkKeymap,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "data-viewer.nvim";
      src = inputs.data-viewer;
    })
  ];

  extraConfigLua = ''
    require("data-viewer").setup({})
  '';

  keymaps = [
    (mkKeymap "n" "<leader>fd" ":DataViewer<cr>" "󰆼 Data")
  ];
}
