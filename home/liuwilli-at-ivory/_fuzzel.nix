_: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "Iosevka Nerd Font:size=16";
        cache = "\"/dev/null\"";
      };

      colors = {
        background = "000000cc";
        text = "ffffffff";
        match = "2e9ef4ff";
        selection = "ffffffcc";
        selection-text = "000000cc";
        selection-match = "4c7899ff";
      };

      key-bindings = {
        execute-or-next = "none";
        next-with-wrap = "Tab";
        prev-with-wrap = "Shift+Tab";
      };
    };
  };
}
