{
  imports = [
    ./alpha.nix
    ./barbar.nix
    ./indent-blankline.nix
    ./lualine.nix
  ];

  colorschemes.gruvbox.enable = true;

  plugins = {
    dressing.enable = true;
    gitsigns.enable = true;
  };
}
