{
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;

    image = pkgs.fetchurl {
      url = "https://i.imgur.com/bG8ole4.jpeg";
      hash = "sha256-oK5LnV6JNcset5MAqo5wXGV1SQ91xKc39jPdwDdWorU=";
    };
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.iosevka;
        name = "Iosevka Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes.popups = 14;
    };
  };
}
