{
  mkKeymap,
  mkRegistration,
  ...
}: {
  imports = [
    ./cmp.nix
    ./spellcheck.nix
    ./treesitter.nix
    ./vimtex.nix
  ];

  plugins.lsp = {
    # LSPs and formatters should be installed through devshells
    enable = true;
    servers = {
      tsserver = {
        enable = true;
        package = null;
      };
      cssls = {
        enable = true;
        package = null;
      };
      emmet-ls = {
        enable = true;
        package = null;
      };
      eslint = {
        enable = true;
        package = null;
      };
      pyright = {
        enable = true;
        package = null;
      };
      lua-ls = {
        enable = true;
        package = null;
      };
      jsonls = {
        enable = true;
        package = null;
      };
      nixd = {
        enable = true;
        package = null;
        settings = {
          diagnostic.suppress = ["sema-escaping-with" "var-bind-to-this"];
        };
      };
      rust-analyzer = {
        enable = true;
        package = null;
        installCargo = false;
        installRustc = false;
        settings.check.command = "clippy";
      };
      hls = {
        enable = true;
        package = null;
      };
      gopls = {
        enable = true;
        package = null;
      };
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

  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    formattersByFt = {
      html = [["prettierd" "prettier"]];
      css = [["prettierd" "prettier"]];
      javascript = [["prettierd" "prettier"]];
      javascriptreact = [["prettierd" "prettier"]];
      typescript = [["prettierd" "prettier"]];
      python = ["black"];
      lua = ["stylua"];
      nix = ["alejandra"];
      markdown = [["prettierd" "prettier"]];
      rust = ["rustfmt"];
    };
  };
}
