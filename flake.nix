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

    cmp-vimtex = {
      url = "github:micangl/cmp-vimtex";
      flake = false;
    };

    cmp-nerdfont = {
      url = "github:chrisgrieser/cmp-nerdfont";
      flake = false;
    };
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

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
          mkRegistration = key: desc: {
            __unkeyed-1 = key;
            inherit desc;
          };
        in {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {inherit inputs mkKeymap mkRegistration;};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        packages.default = nvim;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nixd
            alejandra
            lua-language-server
            stylua
          ];
        };
      };
    };
}
