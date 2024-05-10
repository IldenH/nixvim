{
	imports = [
		./barbar.nix
		./indent-blankline.nix
		./lualine.nix
	];

	colorschemes.gruvbox.enable = true;

  plugins = {
		gitsigns.enable = true;
  };
}
