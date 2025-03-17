{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
    ./hyprland.nix
    ./rofi.nix
    ./waybar.nix
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
    superTux
    superTuxKart
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  home.shell.enableZshIntegration = true;

  nixpkgs.config.allowUnfree = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      configPackages = [pkgs.hyprland];
    };

    configFile."oh-my-zsh/themes/bira-mod.zsh-theme".text = ''
      local return_code="%(?..%{$fg[red]%}%? ←%{$reset_color%})"
      local user_host="%B%(!.%{$fg[red]%}.%{$fg[green]%})%n@%m%{$reset_color%}"
      local user_symbol='%(!.#.$)'
      local current_dir="%B%{$fg[blue]%}%~%{$reset_color%}"
      
      local git_branch='$(git_prompt_info)'
      
      PROMPT="┌─(''${user_host})-[''${current_dir}] ''${git_branch}
      └─%B''${user_symbol}%b "
      RPROMPT="%B''${return_code}%b"
      
      ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}<"
      ZSH_THEME_GIT_PROMPT_SUFFIX=">%{$reset_color%}"
      ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}•%{$fg[yellow]%}"
      ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"
    '';
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [fcitx5-chinese-addons];
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["Iosevka Nerd Font"];
      emoji = ["Noto Color Emoji"];
      sansSerif = ["Noto Sans"];
      serif = ["Noto Serif"];
    };
  };

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
      settings.main.font = "Iosevka Nerd Font:size=14";
    };

    chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
      extensions = [{ id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }];
    };
  };

  home = {
    username = "liuwilli";
    homeDirectory = "/home/liuwilli";
  };

  home.stateVersion = "25.05";
}
