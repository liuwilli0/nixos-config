{pkgs, ...}: {
  imports = [
    ./hardware.nix
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
    networkmanager.enable = true;
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

    logind.lidSwitch = "ignore";
  };

  users.users.liuwilli = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
  };

  system.stateVersion = "25.05";
}
