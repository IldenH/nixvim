{...}: {
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      disabledLanguages = [
        "tex"
        "latex"
      ];
    };
  };
}
