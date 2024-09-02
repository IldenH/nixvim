{colorScheme, ...}: {
  extraConfigVim = ''
    augroup obsidian_markdown
      autocmd!
      autocmd BufRead,BufNewFile *.md setlocal linebreak
    augroup END
  '';

  plugins.headlines = {
    enable = true;
    settings.markdown = {
      headline_highlights = [
        "Headline1"
        "Headline2"
        "Headline3"
        "Headline4"
        "Headline5"
        "Headline6"
      ];
      fat_headlines = false;

      bullets = false;
    };
  };

  highlight = with colorScheme.palette; {
    Headline1.fg = "#${base08}";
    Headline2.fg = "#${base0A}";
    Headline3.fg = "#${base0B}";
    Headline4.fg = "#${base0C}";
    Headline5.fg = "#${base0D}";
    Headline6.fg = "#${base0E}";
    Quote.fg = "#${base0A}";
  };
}
