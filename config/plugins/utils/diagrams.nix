{
  plugins.plantuml-syntax.enable = true;

  extraConfigVim = ''
    augroup plantuml_compile
      autocmd!
      autocmd BufWritePost *.puml silent !plantuml <afile>
    augroup END
  '';
}
