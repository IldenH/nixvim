{pkgs, ...}: {
  imports = [
    ./data-viewer.nix
    ./diagrams.nix
    ./hop.nix
    ./luasnip
    ./move.nix
    ./obsidian
    ./oil.nix
    ./sessions.nix
    ./telescope.nix
    ./which-key.nix
    ./zotcite.nix
  ];

  plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    mkdir-nvim
  ];
}
