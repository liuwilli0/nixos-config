{pkgs, ...}: {
  imports = [
    ../../mixed/stylix.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    nextdns
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      efiSupport = true;
    };
  };

  networking = {
    hostName = "ivory";
    nameservers = ["127.0.0.1" "::1"];

    dhcpcd.enable = false;
    networkmanager = {
      enable = true;
      dns = "none";
    };

    wg-quick.interfaces."proton0".configFile = "/etc/wireguard/proton0.conf";
  };

  time.timeZone = "America/New_York";

  hardware = {
    enableAllFirmware = true;
    graphics.enable = true;
    bluetooth.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      audio.enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
      wireplumber.enable = true;
    };

    # greetd = {
    #   enable = true;
    #   settings.default_session.command = let
    #     configFile = pkgs.writeText "greetd-hyprland-config" ''
    #       exec-once = ${pkgs.greetd.regreet}/bin/regreet; ${pkgs.hyprland}/bin/hyprctl dispatch exit
    #       misc {
    #           disable_hyprland_logo = true
    #           disable_splash_rendering = true
    #           disable_hyprland_qtutils_check = true
    #       }
    #     '';
    #   in "${pkgs.hyprland}/bin/Hyprland --config ${configFile}";
    # };

    nextdns = {
      enable = true;
      arguments = ["-profile" "ad35a8" "-cache-size" "10MB"];
    };

    # dnscrypt-proxy2 = {
    #   enable = true;
    #   settings = {
    #     ipv6_servers = true;
    #     require_dnssec = true;
    #     sources.public-resolvers = {
    #       urls = [
    #         "https://download.dnscrypt.info/dnscrypt-resolvers/v3/public-resolvers.md"
    #         "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
    #       ];
    #       cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
    #       minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
    #     };
    #   };
    # };

    udisks2.enable = true;
    logind.lidSwitch = "ignore";
  };

  programs = {
    zsh.enable = true;
    regreet.enable = true;
    hyprland = {
      enable = true;
      # withUWSM = true;
    };
  };

  users.users.liuwilli = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  system.stateVersion = "25.05";
}
