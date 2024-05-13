{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Plugins not in nixpkgs
    move = {
      url = "github:fedepujol/move.nvim";
      flake = false;
    };
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = let
          mkKeymap = mode: key: action: desc: {
            inherit mode key action;
            options = {
              inherit desc;
              silent = true;
              noremap = true;
            };
          };
        in {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {
            inherit inputs mkKeymap;
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };

        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nil
            alejandra
          ];
        };
      };
    };
}
