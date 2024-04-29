{
	imports = [
		./indent-blankline.nix
		./lualine.nix
	];

  plugins = {
    bufferline.enable = true; # TODO: barbar
  };
}
