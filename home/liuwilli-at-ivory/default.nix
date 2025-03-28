{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../mixed/stylix.nix
    ./chromium.nix
    ./firefox.nix
    ./hyprland.nix
    ./rofi.nix
    ./waybar.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    libnotify
    wl-clipboard
    brightnessctl

    # noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    # noto-fonts-color-emoji
    # nerd-fonts.iosevka
    gnome-themes-extra

    # ciscoPacketTracer8
    vlc
    superTux
    superTuxKart
    prismlauncher
    vesktop
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  home.username = "liuwilli";
  home.homeDirectory = "/home/liuwilli";

  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    configPackages = [pkgs.hyprland];
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [fcitx5-chinese-addons];
  };

  # fonts.fontconfig = {
  #   enable = true;
  #   defaultFonts = {
  #     monospace = ["Iosevka Nerd Font"];
  #     emoji = ["Noto Color Emoji"];
  #     sansSerif = ["Noto Sans"];
  #     serif = ["Noto Serif"];
  #   };
  # };

  # dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  # gtk = {
  #   enable = true;

  #   theme.name = "Adwaita-dark";
  #   iconTheme.name = "Adwaita-dark";
  #   cursorTheme.name = "Adwaita-dark";
  #   font.name = "Noto Sans";

  #   gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  #   gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  # };

  services = {
    udiskie = {
      enable = true;
      settings.program_options.file_manager = "${pkgs.foot}/bin/foot ${pkgs.yazi}/bin/yazi";
    };

    cliphist.enable = true;
    dunst.enable = true;
    swww.enable = true;
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "liuwilli";
      userEmail = "liuwilli@protonmail.com";
      extraConfig.safe.directory = "/etc/nixos";
    };

    # helix = {
    #   enable = true;
    #   defaultEditor = true;
    #   settings.theme = "gruvbox";
    # };

    neovim = {
      enable = true;
      defaultEditor = true;
    };

    foot = {
      enable = true;
      # settings.main.font = "Iosevka Nerd Font:size=14";
    };

    yazi.enable = true;
  };

  home.stateVersion = "25.05";
}
