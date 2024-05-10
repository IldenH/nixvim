{ mkKeymap, ... }:

{
	plugins.hop = {
		enable = true;
		settings = {
			keys = "asdfghjkløæqwertyuiopåzxcvbnm,.-";
		};
	};

	keymaps = [
		(mkKeymap "n" "<leader><space>" ":HopWord<cr>" "Hop")
	];
}
