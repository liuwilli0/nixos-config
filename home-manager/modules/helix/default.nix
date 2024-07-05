{ config, lib, pkgs, ... }: {
  options.modules.helix.enable = lib.mkEnableOption "helix";
  config = lib.mkIf config.modules.helix.enable {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings.theme = "gruvbox";
    };
  };
}
