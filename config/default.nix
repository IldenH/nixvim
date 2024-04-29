{
  imports = [
    ./bufferline.nix
		./options.nix
  ];

	colorschemes.gruvbox.enable = true;

	plugins = {
		lualine.enable = true;
	};
}
