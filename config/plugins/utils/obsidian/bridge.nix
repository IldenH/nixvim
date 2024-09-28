{
  pkgs,
  inputs,
  mkKeymap,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "obsidian-bridge.nvim";
      src = inputs.obsidian-bridge;
    })
  ];

  extraConfigLua =
    # lua
    ''
      -- Token is defined in the environment variable $OBSIDIAN_REST_API_KEY
      require("obsidian-bridge").setup({
        scroll_sync = true;
      })
    '';

  # can't figure out some good way to enable bridge if obsidian is open
  # extraConfigVim = ''
  #   augroup obsidian_bridge
  #     autocmd!
  #     autocmd BufReadPre *.md silent ObsidianBridgeOff
  #     autocmd BufNewFile *.md silent ObsidianBridgeOff
  #   augroup END
  # '';

  keymaps = [
    (mkKeymap "n" "<leader>og" "<cmd>ObsidianBridgeOpenGraph<cr>" "󰡷 Graph")
    (mkKeymap "n" "<leader>oB" "<cmd>ObsidianBridgeToggle<cr>" "Toggle Bridge") # TODO: enable when obsidian is open else disable
  ];
}
