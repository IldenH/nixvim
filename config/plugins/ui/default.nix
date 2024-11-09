{...}: {
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
    rainbow-delimiters.enable = true;
  };

  plugins.nvim-colorizer = {
    enable = true;
    userDefaultOptions = {
      names = false;
      css = true;
      css_fn = true;
      tailwind = true;
      mode = "background";
    };
  };
}
