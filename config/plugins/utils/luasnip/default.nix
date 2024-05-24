{...}: {
  plugins.luasnip = {
    enable = true;
    extraConfig = {
      update_events = "TextChanged,TextChangedI";
      store_selection_keys = "<Tab>";
      delete_check_events = "TextChanged";
      enable_autosnippets = true;
      history = false;
    };
    # TODO:
    # fromLua = [
    #   {
    #     paths = ./snippets;
    #     lazyLoad = true;
    #   }
    # ];
  };
}
