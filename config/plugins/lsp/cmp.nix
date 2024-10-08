{
  inputs,
  pkgs,
  ...
}: {
  # https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
  extraConfigLuaPre = ''
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
  '';

  plugins = {
    cmp = {
      enable = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lsp_document_symbol";}
          {name = "nvim_lsp_signature_help";}
          {name = "luasnip";}
          {name = "path";}
          {name = "calc";}
          {name = "emoji";}
          {name = "latex_symbols";}
          {name = "nerdfont";}
          {name = "vimtex";}
          # {name = "spell";} # laggy sometimes
          {name = "zotcite";}
        ];

        snippet.expand =
          /*
          lua
          */
          ''
            function(args)
            	require("luasnip").lsp_expand(args.body)
            end
          '';

        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-c>" = "cmp.mapping.abort()";
          "<C-cr>" = "cmp.mapping.confirm({ select = false })";
          "<C-Space>" = "cmp.mapping.complete()";

          "<C-j>" =
            /*
            lua
            */
            ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end,
              {"i", "s"})
            '';

          "<C-k>" =
            /*
            lua
            */
            ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end,
              {"i", "s"})
            '';

          "<Tab>" =
            /*
            lua
            */
            ''
              cmp.mapping(function(fallback)
                if require("luasnip").expand_or_locally_jumpable() then
                  require("luasnip").expand_or_jump()
                end
                if cmp.visible() then
                  if #cmp.get_entries() == 1 then
                    cmp.confirm({ select = true })
                  else
                    cmp.select_next_item()
                  end
                elseif has_words_before() then
                  cmp.complete()
                  if #cmp.get_entries() == 1 then
                    cmp.confirm({ select = true })
                  end
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lua.enable = true;
    cmp_luasnip.enable = true;
  };

  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      name = "cmp-nerdfont";
      src = inputs.cmp-nerdfont;
    })
    (buildVimPlugin {
      name = "cmp-vimtex";
      src = inputs.cmp-vimtex;
    })
    (buildVimPlugin {
      name = "cmp-zotcite";
      src = inputs.cmp-zotcite;
    })
  ];
}
