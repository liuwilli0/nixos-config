{ config, lib, pkgs, ... }: {
  options.modules.firefox.enable = lib.mkEnableOption "firefox";
  config = lib.mkIf config.modules.firefox.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
