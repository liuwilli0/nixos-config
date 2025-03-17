{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;

    package = pkgs.rofi-wayland;

    # font = "Iosevka Nerd Font 14";
    # terminal = lib.getExe pkgs.foot;

    extraConfig = {
      modes = "drun,run,window";

      display-drun = "  Apps";
      display-run = "  Run";
      display-window = "  Windows";

      show-icons = true;
      disable-history = true;
    };

    # https://github.com/adi1090x/rofi/blob/master/files/launchers/type-1/style-6.rasi
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      /*****----- Main Window -----*****/
      window = {
        /* properties for window widget */
        transparency =               "real";
        location =                   mkLiteral "center";
        anchor =                     mkLiteral "center";
        fullscreen =                 false;
        width =                      mkLiteral "800px";
      
        /* properties for all widgets */
        enabled =                    true;
        margin =                     mkLiteral "0px";
        padding =                    mkLiteral "0px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "10px";
        cursor =                     "default";
        /* Backgroud Colors */
        # background-color =           mkLiteral "@background-colour";
      };
      
      /*****----- Main Box -----*****/
      mainbox = {
        enabled =                    true;
        spacing =                    mkLiteral "10px";
        margin =                     mkLiteral "0px";
        padding =                    mkLiteral "20px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "0px 0px 0px 0px";
        # border-color =               mkLiteral "@border-colour";
        background-color =           mkLiteral "transparent";
        children =                   [ "inputbar" "mode-switcher" "message" "listview" ];
      };
      
      /*****----- Inputbar -----*****/
      inputbar = {
        enabled =                    true;
        spacing =                    mkLiteral "10px";
        margin =                     mkLiteral "0px";
        padding =                    mkLiteral "0px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "0px";
        # border-color =               mkLiteral "@border-colour";
        background-color =           mkLiteral "transparent";
        # text-color =                 mkLiteral "@foreground-colour";
        children =                   [ "textbox-prompt-colon" "entry" ];
      };
      
      prompt = {
        enabled =                    true;
        background-color =           mkLiteral "inherit";
        # text-color =                 mkLiteral "inherit";
      };
      textbox-prompt-colon = {
        enabled =                    true;
        padding =                    mkLiteral "5px 0px";
        expand =                     false;
        str =                        " ";
        background-color =           mkLiteral "inherit";
        # text-color =                 mkLiteral "inherit";
      };
      entry = {
        enabled =                    true;
        padding =                    mkLiteral "5px 0px";
        background-color =           mkLiteral "inherit";
        # text-color =                 mkLiteral "inherit";
        cursor =                     mkLiteral "text";
        placeholder =                "Search...";
        placeholder-color =          mkLiteral "inherit";
      };
      num-filtered-rows = {
        enabled =                    true;
        expand =                     false;
        background-color =           mkLiteral "inherit";
        text-color =                 mkLiteral "inherit";
      };
      textbox-num-sep = {
        enabled =                    true;
        expand =                     false;
        str =                        "/";
        background-color =           mkLiteral "inherit";
        text-color =                 mkLiteral "inherit";
      };
      num-rows = {
        enabled =                    true;
        expand =                     false;
        background-color =           mkLiteral "inherit";
        text-color =                 mkLiteral "inherit";
      };
      case-indicator = {
        enabled =                    true;
        background-color =           mkLiteral "inherit";
        # text-color =                 mkLiteral "inherit";
      };
      
      /*****----- Listview -----*****/
      listview = {
        enabled =                    true;
        columns =                    1;
        lines =                      8;
        cycle =                      true;
        dynamic =                    true;
        scrollbar =                  false;
        layout =                     mkLiteral "vertical";
        reverse =                    false;
        fixed-height =               true;
        fixed-columns =              true;
        
        spacing =                    mkLiteral "5px";
        margin =                     mkLiteral "0px";
        padding =                    mkLiteral "0px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "0px";
        # border-color =               mkLiteral "@border-colour";
        background-color =           mkLiteral "transparent";
        # text-color =                 mkLiteral "@foreground-colour";
        cursor =                     "default";
      };
      scrollbar = {
        handle-width =               mkLiteral "5px ";
        # handle-color =               mkLiteral "@handle-colour";
        border-radius =              mkLiteral "10px";
        # background-color =           mkLiteral "@alternate-background";
      };
      
      /*****----- Elements -----*****/
      element = {
        enabled =                    true;
        spacing =                    mkLiteral "10px";
        margin =                     mkLiteral "0px";
        padding =                    mkLiteral "10px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "8px";
        # border-color =               mkLiteral "@border-colour";
        background-color =           mkLiteral "transparent";
        # text-color =                 mkLiteral "@foreground-colour";
        cursor =                     mkLiteral "pointer";
      };
      element-icon = {
        # background-color =           mkLiteral "transparent";
        # text-color =                 mkLiteral "inherit";
        size =                       mkLiteral "24px";
        cursor =                     mkLiteral "inherit";
      };
      element-text = {
        # background-color =           mkLiteral "transparent";
        # text-color =                 mkLiteral "inherit";
        highlight =                  mkLiteral "inherit";
        cursor =                     mkLiteral "inherit";
        vertical-align =             mkLiteral "0.5";
        horizontal-align =           mkLiteral "0.0";
      };
      
      /*****----- Mode Switcher -----*****/
      mode-switcher = {
        enabled =                    true;
        expand =                     false;
        spacing =                    mkLiteral "10px";
        margin =                     mkLiteral "0px";
        padding =                    mkLiteral "0px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "0px";
        # border-color =               mkLiteral "@border-colour";
        background-color =           mkLiteral "transparent";
        # text-color =                 mkLiteral "@foreground-colour";
      };
      button = {
        padding =                    mkLiteral "12px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "8px";
        # border-color =               mkLiteral "@border-colour";
        # background-color =           mkLiteral "@alternate-background";
        # text-color =                 mkLiteral "inherit";
        cursor =                     mkLiteral "pointer";
      };
      
      /*****----- Message -----*****/
      message = {
        enabled =                    true;
        margin =                     mkLiteral "0px";
        padding =                    mkLiteral "0px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "0px 0px 0px 0px";
        # border-color =               mkLiteral "@border-colour";
        background-color =           mkLiteral "transparent";
        # text-color =                 mkLiteral "@foreground-colour";
      };
      textbox = {
        padding =                    mkLiteral "12px";
        border =                     mkLiteral "0px solid";
        border-radius =              mkLiteral "8px";
        # border-color =               mkLiteral "@border-colour";
        # background-color =           mkLiteral "@alternate-background";
        # text-color =                 mkLiteral "@foreground-colour";
        vertical-align =             mkLiteral "0.5";
        horizontal-align =           mkLiteral "0.0";
        highlight =                  mkLiteral "none";
        # placeholder-color =          mkLiteral "@foreground-colour";
        blink =                      true;
        markup =                     true;
      };
      error-message = {
        padding =                    mkLiteral "0px";
        border =                     mkLiteral "2px solid";
        border-radius =              mkLiteral "8px";
        # border-color =               mkLiteral "@border-colour";
        # background-color =           mkLiteral "@background-colour";
        # text-color =                 mkLiteral "@foreground-colour";
      };
    };
  };
}
