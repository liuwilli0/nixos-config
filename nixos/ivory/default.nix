{pkgs, ...}: {
  imports = [
    ./hardware.nix
    ./nvf.nix
  ];

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    nextdns
  ];

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

    wg-quick.interfaces.proton0.configFile = "/etc/wireguard/proton0.conf";
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

    blueman.enable = true;

    nextdns = {
      enable = true;
      arguments = ["-profile" "ad35a8" "-cache-size" "10MB"];
    };

    udisks2.enable = true;
    logind.lidSwitch = "ignore";
  };

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
  };

  users.users.liuwilli = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  system.stateVersion = "25.11";
}
