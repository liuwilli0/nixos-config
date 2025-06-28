{pkgs, ...}: {
  imports = [
    ./brave.nix
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
    pwvucontrol

    # noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    # noto-fonts-color-emoji
    # nerd-fonts.iosevka
    gnome-themes-extra

    resources
    vlc
    bitwarden-desktop
    vesktop
    godot
    superTux
    superTuxKart
    prismlauncher
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  home.username = "liuwilli";
  home.homeDirectory = "/home/liuwilli";

  nixpkgs.config.allowUnfree = true;

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/chrome" = "brave-browser.desktop";
      "application/x-extension-htm" = "brave-browser.desktop";
      "application/x-extension-html" = "brave-browser.desktop";
      "application/x-extension-shtml" = "brave-browser.desktop";
      "application/xhtml+xml" = "brave-browser.desktop";
      "application/x-extension-xhtml" = "brave-browser.desktop";
      "application/x-extension-xht" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";

      "x-scheme-handler/discord" = "vesktop.desktop";
    };
  };

  services = {
    udiskie = {
      enable = true;
      # https://github.com/nix-community/home-manager/issues/632
      settings.program_options.file_manager = "${pkgs.foot}/bin/foot ${pkgs.yazi}/bin/yazi";
    };

    swww.enable = true;
    mako.enable = true;
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "liuwilli";
      userEmail = "liuwilli@protonmail.com";
      extraConfig.safe.directory = "/etc/nixos";
    };

    foot = {
      enable = true;
      # settings.main.font = "Iosevka Nerd Font:size=14";
    };

    yazi = {
      enable = true;
      settings.mgr.show_hidden = true;
    };
  };

  home.stateVersion = "25.11";
}
