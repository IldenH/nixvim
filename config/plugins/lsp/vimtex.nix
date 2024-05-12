{mkKeymap, ...}: {
  plugins.vimtex = {
    enable = true;
    texlivePackage = null; # use nix shell
    settings = {
      compiler_method = "latexmk";
      compiler_latexmk_engines = {
        "_" = "-pdf";
        "pdf_escaped" = "-pdf -pdflatex=\"pdflatex -shell-escape %O %S\"";
      };
      view_enabled = 1;
      view_method = "zathura";
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>tt" "<cmd>VimtexCompile<cr>" "Compile")
    (mkKeymap "n" "<leader>tv" "<cmd>VimtexView<cr>" "View")
    (mkKeymap "n" "<leader>ts" "<cmd>VimtexStop<cr>" "Stop")
    (mkKeymap "n" "<leader>te" "<cmd>VimtexErrors<cr>" "Errors")
    (mkKeymap "n" "<leader>tS" "<cmd>VimtexStatus<cr>" "Status")
    (mkKeymap "n" "<leader>ti" "<cmd>VimtexInfo<cr>" "Info")
    (mkKeymap "n" "<leader>tC" "<cmd>VimtexClean<cr>" "Clean")
    (mkKeymap "n" "<leader>to" "<cmd>VimtexCompileSS<cr>" "Compile Once")
  ];
}
