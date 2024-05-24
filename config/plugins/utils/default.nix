{pkgs, ...}: {
  imports = [
    ./hop.nix
    ./luasnip
    ./move.nix
    ./oil.nix
    ./sessions.nix
    ./telescope.nix
    ./which-key.nix
  ];

  plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    mkdir-nvim
    guess-indent-nvim
  ];

  extraConfigLua = ''require("guess-indent").setup({})'';
}
