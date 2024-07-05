{ config, lib, pkgs, ... }: {
  options.modules.foot.enable = lib.mkEnableOption "foot";
  config = lib.mkIf config.modules.foot.enable {
    programs.foot = {
      enable = true;
      settings.main.font = "Iosevka Nerd Font:size=14";
    };
  };
}
