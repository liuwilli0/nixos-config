{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
    # ./fuzzel.nix
    ./hyprland.nix
    ./rofi.nix
    # ./sway.nix
    ./waybar.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "liuwilli";
    homeDirectory = "/home/liuwilli";

    packages = with pkgs; [
      brightnessctl
      libnotify

      noto-fonts
      noto-fonts-cjk-sans
      (nerdfonts.override {fonts = ["Iosevka"];})
      gnome-themes-extra

      superTux
      superTuxKart
    ];
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      configPackages = [pkgs.hyprland];
    };

    configFile."oh-my-zsh/themes/bira-mod.zsh-theme".source = ./bira-mod.zsh-theme;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-chinese-addons
      fcitx5-nord
    ];
  };

  fonts.fontconfig.enable = true;

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  gtk = {
    enable = true;

    theme.name = "Adwaita-dark";
    iconTheme.name = "Adwaita-dark";
    cursorTheme.name = "Adwaita-dark";
    font.name = "Noto Sans";

    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  services.dunst.enable = true;

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        custom = "${config.xdg.configHome}/oh-my-zsh";
        theme = "bira-mod";
      };
    };

    git = {
      enable = true;
      userName = "liuwilli";
      userEmail = "liuwilli@protonmail.com";
      extraConfig.safe.directory = "/etc/nixos";
    };

    helix = {
      enable = true;
      defaultEditor = true;
      settings.theme = "gruvbox";
    };

    foot = {
      enable = true;
      settings.main.font = "Iosevka Nerd Font:size=14";
    };
  };

  home.stateVersion = "24.05";
}
