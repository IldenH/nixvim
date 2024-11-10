{
  mkKeymap,
  mkRegistration,
  pkgs,
  ...
}: {
  imports = [
    ./cmp.nix
    ./spellcheck.nix
    ./treesitter.nix
    ./vimtex.nix
  ];

  plugins.lsp = {
    enable = true;
    servers = {
      ts-ls.enable = true;
      cssls.enable = true;
      emmet-ls.enable = true;
      eslint.enable = true;
      pyright.enable = true;
      lua-ls.enable = true;
      jsonls.enable = true;
      nixd = {
        enable = true;
        settings = {
          diagnostic.suppress = ["sema-escaping-with" "var-bind-to-this"];
        };
      };
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
        settings.check.command = "clippy";
      };
      hls.enable = true;
      gopls.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true;
      html.enable = true;
      elixirls.enable = true;
    };

    keymaps = {
      silent = true;
      diagnostic = {
        "<leader>k" = "goto_prev";
        "<leader>j" = "goto_next";
        "<leader>ll" = "open_float";
      };
      lspBuf = {
        "<leader>ld" = "definition";
        "<leader>li" = "implementation";
        "<leader>lr" = "rename";
        "<leader>la" = "code_action";
        "<leader>lk" = "hover";
      };
    };
  };

  plugins.which-key.settings.spec = [
    (mkRegistration "<leader>k" "Previous diagnostic")
    (mkRegistration "<leader>j" "Next diagnostic")
    (mkRegistration "<leader>ll" "Line diagnostics")
    (mkRegistration "<leader>ld" "Definition")
    (mkRegistration "<leader>li" "Implementation")
    (mkRegistration "<leader>lr" "Rename")
    (mkRegistration "<leader>la" "Code actions")
    (mkRegistration "<leader>lk" "Hover")
  ];

  keymaps = [
    (mkKeymap "n" "<leader>lR" "<cmd>LspRestart<cr>" "Restart")
    (mkKeymap "n" "<leader>lI" "<cmd>LspInfo<cr>" "Info")
  ];

  extraPackages = [
    pkgs.prettierd
    pkgs.black
    pkgs.stylua
    pkgs.alejandra
    pkgs.rustfmt
    pkgs.ormolu
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_no_formatters = false;
      notify_no_error = false;
      log_level = "off";
      format_on_save = {
        lspFallback = true;
        timeoutMs = 0;
        quiet = true;
      };
      formatters_by_ft = {
        html = ["prettierd"];
        css = ["prettierd"];
        javascript = ["prettierd"];
        javascriptreact = ["prettierd"];
        typescript = ["prettierd"];
        python = ["black"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = ["prettierd"];
        rust = ["rustfmt"];
        svelte = ["prettierd"];
        haskell = ["ormolu"];
      };
    };
  };
}
