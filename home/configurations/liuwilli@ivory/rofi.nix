{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;

    package = pkgs.rofi-wayland;

    font = "Iosevka Nerd Font 14";
    # terminal = lib.getExe pkgs.foot;
    extraConfig = {
      modes = "drun,run";
      show-icons = true;
      disable-history = true;
    };
    # https://github.com/hiimsergey/rofi-gruvbox-material
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        bg0 = mkLiteral "#282828";
        bg1 = mkLiteral "#32302f";
        grey0 = mkLiteral "#7c6f64";
        fg0 = mkLiteral "#d4be98";

        blue = mkLiteral "#7daea3";
        red = mkLiteral "#ea6962";
        orange = mkLiteral "#e78a4e";
        green = mkLiteral "#a9b665";
        bgStatusline3 = mkLiteral "#504945";

        background-color = mkLiteral "@bg0";
      };

      "window" = {
        height = 600;
        width = 600;

        border = 1;
        border-radius = 10;
        border-color = mkLiteral "@bgStatusline3";
      };

      "mainbox" = {
        spacing = 0;
        children = map mkLiteral ["inputbar" "message" "listview"];
      };

      "inputbar" = {
        color = mkLiteral "@fg0";
        padding = 14;
        background-color = "@bg0";
      };

      "message" = {
        padding = 10;
        background-color = "@grey0";
      };

      "listview" = {
        padding = 8;
        border-radius = mkLiteral "0 0 10 10";
        border = mkLiteral "2 2 2 2";
        border-color = mkLiteral "@bg0";
        background-color = mkLiteral "@bg0";
        dynamic = false;
      };

      "textbox" = {
        text-color = "@fg0";
        background-color = "inherit";
      };

      "error-message" = {
        border = mkLiteral "20 20 20 20";
      };

      "entry, prompt, case-indicator" = {
        text-color = mkLiteral "inherit";
      };

      "prompt" = {
        margin = mkLiteral "0 10 0 0";
      };

      "element" = {
        padding = 5;
        vertical-align = mkLiteral "0.5";
        border-radius = 10;
        background-color = mkLiteral "@bg1";
      };

      "element.selected.normal" = {
        background-color = mkLiteral "@grey0";
      };

      "element.alternate.normal" = {
        background-color = mkLiteral "inherit";
      };

      "element.normal.active, element.alternate.active" = {
        background-color = mkLiteral "@orange";
      };

      "element.selected.active" = {
        background-color = mkLiteral "@green";
      };

      "element.normal.urgent, element.alternate.urgent" = {
        background-color = mkLiteral "@red";
      };

      "element.selected.urgent" = {
        background-color = mkLiteral "@blue";
      };

      "element-text, element-icon" = {
        size = 40;
        margin = mkLiteral "0 10 0 0";
        vertical-align = mkLiteral "0.5";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "@fg0";
      };

      "element-text.active, element-text.urgent" = {
        text-color = mkLiteral "@bg0";
      };
    };
  };
}
