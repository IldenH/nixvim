{ pkgs, ... }:

{
	imports = [
		./hop.nix
		./sessions.nix
		./which-key.nix
	];
	
	plugins = {
		comment.enable = true;
		nvim-autopairs.enable = true;
	};

	extraPlugins = with pkgs.vimPlugins; [
		mkdir-nvim
	];
}
