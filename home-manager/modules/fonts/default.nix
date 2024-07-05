{ config, lib, pkgs, ... }: {
  options.modules.fonts.enable = lib.mkEnableOption "fonts";
  config = lib.mkIf config.modules.fonts.enable {
    fonts.fontconfig.enable = true;

    home.packages = [
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk-sans
      (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; })
    ];
  };
}
