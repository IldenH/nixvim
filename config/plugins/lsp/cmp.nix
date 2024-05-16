{...}: {
  plugins = {
    cmp = {
      enable = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim_lsp_document_symbol";}
          {name = "nvim_lsp_signature_help";}
          {name = "path";}
        ];

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
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-nvim-lua.enable = true;
  };
}
