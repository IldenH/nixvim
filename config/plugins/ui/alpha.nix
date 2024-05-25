{...}: {
  plugins.alpha = {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = [
          "	              _-o#&&*''''?d:>b_              "
          "          _o/'`''  '',, dMF9MMMMMHo_          "
          "       .o&#'        `'MbHMMMMMMMMMMMHo.       "
          "     .o'' '         vodM*$&&HMMMMMMMMMM?.     "
          "    ,'              $M&ood,~'`(&##MMMMMMH     "
          "   /               ,MMMMMMM#b?#bobMMMMHMMML   "
          "  &              ?MMMMMMMMMMMMMMMMM7MMM$R*Hk  "
          " ?$.            :MMMMMMMMMMMMMMMMMMM/HMMM|`*L "
          "|               |MMMMMMMMMMMMMMMMMMMMbMH'   T,"
          "$H#:            `*MMMMMMMMMMMMMMMMMMMMb#}'  `?"
          "]MMH#             ''*''''*#MMMMMMMMMMMMM'    -"
          "MMMMMb_                   |MMMMMMMMMMMP'     :"
          "HMMMMMMMHo                 `MMMMMMMMMT       ."
          "?MMMMMMMMP                  9MMMMMMMM}       -"
          "-?MMMMMMM                  |MMMMMMMMM?,d-     "
          " :|MMMMMM-                 `MMMMMMMT .M|.   : "
          "  .9MMM[                    &MMMMM*' `'    .  "
          "   :9MMk                    `MMM#'        -   "
          "     &M}                     `          .-    "
          "      `&.                             .       "
          "        `~,   .                     ./        "
          "            . _                  .-           "
          "              '`--._,dd###pp='''              "
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = let
          button = shortcut: text: {
            type = "button";
            opts = {
              position = "center";
              shortcut = shortcut;
              cursor = 3;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Type";
            };
            val = text;
          };
        in [
          # new and quit don't do anything yet TODO
          (button "n" "  New")
          (button "SPC f f" "  Files")
          (button "SPC s" "  Restore Session")
          (button "q" "  Quit")
        ];
        opts.spacing = 1;
      }
    ];
  };
}
