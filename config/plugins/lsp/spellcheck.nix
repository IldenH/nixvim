{
  pkgs,
  mkKeymap,
  mkRegistration,
  ...
}: let
  # `globpath(&rtp, "spell/*.spell")` from `spell/cleanadd.vim`
  # expects there to be a subdir called `spell` in the runtimepath: `.spell/spell`
  spellDir = "$HOME/.spell"; # TODO: maybe put this in ~/local/share
  mkSpellFile = lang: "${spellDir}/spell/${lang}.utf-8.add";
  global_lang = "en_us";
  global_file = mkSpellFile global_lang;
in {
  opts = {
    spell = false;
    spl = global_lang;
    spf = global_file;
  };

  # Otherwise the cleanup script complains about not finding the path through a very cryptic error `No such variable: "s:fname"`, which just means that it has to be on runtimepath
  extraConfigLua = ''
    vim.opt.runtimepath:append("${spellDir}")
  '';

  plugins.which-key.settings.spec = [
    (mkRegistration "<leader>c" " Spellcheck")
    (mkRegistration "<leader>cl" "󰗊 Language")
    (mkRegistration "<leader>cL" "󰗊 Buffer language")
  ];

  keymaps = let
    # :h spellfile, :h spelllang
    # The spellfile for the global lang is always enabled
    # Whichever file comes first in `spellfile`or `spf` is the one that gets written to
    _mkSpell = lang: "spl=${lang},${global_lang} spf=${mkSpellFile lang},${global_file} | :setlocal spell<cr>";
    mkSpell = lang: ":set ${_mkSpell lang}";
    mkSpellBuffer = lang: ":setlocal ${_mkSpell lang}";
  in [
    # Switch between langs. Always have english as secondary.
    (mkKeymap "n" "<leader>clb" (mkSpell "nb") "Norsk bokmål")
    (mkKeymap "n" "<leader>cln" (mkSpell "nn") "Norsk nynorsk")
    (mkKeymap "n" "<leader>cle" (mkSpell "en_us") "English US")
    (mkKeymap "n" "<leader>clt" (mkSpell "de") "Deutsch")
    (mkKeymap "n" "<leader>cld" (mkSpell "da") "Dansk")
    (mkKeymap "n" "<leader>cls" (mkSpell "sv") "Svenska")

    (mkKeymap "n" "<leader>cLb" (mkSpellBuffer "nb") "Norsk bokmål")
    (mkKeymap "n" "<leader>cLn" (mkSpellBuffer "nn") "Norsk nynorsk")
    (mkKeymap "n" "<leader>cLe" (mkSpellBuffer "en_us") "English US")
    (mkKeymap "n" "<leader>cLt" (mkSpellBuffer "de") "Deutsch")
    (mkKeymap "n" "<leader>cLd" (mkSpellBuffer "da") "Dansk")
    (mkKeymap "n" "<leader>cLs" (mkSpellBuffer "sv") "Svenska")

    (mkKeymap "n" "<leader>cg" "zg" "Mark as correct")
    (mkKeymap "n" "<leader>cw" "zw" "Mark as wrong")
    (mkKeymap "n" "<leader>cr" "zr" "Mark as rare") # Correct but rarely used
    (mkKeymap "n" "<leader>cu" "zuw" "Undo mark")
    (mkKeymap "n" "<leader>cp" ":WhichKey z=<cr>" "Suggestions")
    (mkKeymap "n" "<leader>cn" "]s" "Next misspelled")
    (mkKeymap "n" "<leader>cN" "[s" "Previous misspelled")
    (mkKeymap "n" "<leader>cC" ":runtime spell/cleanadd.vim | noh<cr>" "Clean spell file")
    (mkKeymap "n" "<leader>cc" ":setlocal spell!<cr>" "Toggle spellcheck")
  ];

  extraFiles = {
    # https://ftp.nluug.nl/pub/vim/runtime/spell/README_nb.txt
    "spell/nb.utf-8.spl".source = pkgs.fetchurl {
      url = "ftp://ftp.nluug.nl/pub/vim/runtime/spell/nb.utf-8.spl";
      hash = "sha256-PImo8hi6Wk9Lt+OO6O+yFezcE2/R4lFTIihEZ7JD/88=";
    };
    # https://ftp.nluug.nl/pub/vim/runtime/spell/README_nn.txt
    "spell/nn.utf-8.spl".source = pkgs.fetchurl {
      url = "ftp://ftp.nluug.nl/pub/vim/runtime/spell/nn.utf-8.spl";
      hash = "sha256-PSnDZyF/Qur3wJHCBSr0hMWPimxa7dRjq+RDo86kS8A=";
    };
    # https://ftp.nluug.nl/pub/vim/runtime/spell/README_en.txt
    "spell/en.utf-8.spl".source = pkgs.fetchurl {
      url = "ftp://ftp.nluug.nl/pub/vim/runtime/spell/en.utf-8.spl";
      hash = "sha256-/sq9yUm2o50ywImfolReqyXmPy7QozxK0VEUJjhNMHA=";
    };
    # https://ftp.nluug.nl/pub/vim/runtime/spell/README_de.txt
    "spell/de.utf-8.spl".source = pkgs.fetchurl {
      url = "ftp://ftp.nluug.nl/pub/vim/runtime/spell/de.utf-8.spl";
      hash = "sha256-c8cQfqM5hWzb6SHeuSpFk5xN5uucByYdobndGfaDo9E=";
    };
    # https://ftp.nluug.nl/pub/vim/runtime/spell/README_da.txt
    "spell/da.utf-8.spl".source = pkgs.fetchurl {
      url = "ftp://ftp.nluug.nl/pub/vim/runtime/spell/da.utf-8.spl";
      hash = "sha256-kmorKLt1tRESopA8mLD1HfFvEMuDcvXugpH4Y2nAiTI=";
    };
    # https://ftp.nluug.nl/pub/vim/runtime/spell/README_sv.txt
    "spell/sv.utf-8.spl".source = pkgs.fetchurl {
      url = "ftp://ftp.nluug.nl/pub/vim/runtime/spell/sv.utf-8.spl";
      hash = "sha256-c+0oRaF2bKIdU4j8dm2SYHSpCnupIjRY/A0Nzsxyq1I=";
    };
  };
}
