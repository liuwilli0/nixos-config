{ config, lib, pkgs, ... }: {
  options.modules.fuzzel.enable = lib.mkEnableOption "fuzzel";
  config = lib.mkIf config.modules.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main.font = "Iosevka Nerd Font:size=16";
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
          next-with-wrao = "Tab";
          prev-with-wrap = "Shift+Tab";
        };
      };
    };
  };
}
