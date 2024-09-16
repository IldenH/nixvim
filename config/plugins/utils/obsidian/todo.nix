{
  inputs,
  pkgs,
  mkKeymap,
  ...
}: {
  extraPlugins = [inputs.obsidian-todo.packages.${pkgs.system}.default];

  extraConfigLua = ''
    require("telescope").load_extension("obsidian_todo")
  '';

  plugins.telescope.settings.extensions.obsidian_todo = {
    search_path = "$HOME/dev/Vault";
  };

  keymaps = [
    (mkKeymap "n" "<leader>oT" ":Telescope obsidian_todo obsidian_todo<cr>" " Todo")
  ];
}
