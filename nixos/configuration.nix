{ config, lib, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "liuwilli-t480s";
  networking.networkmanager.enable = true; 

  time.timeZone = "America/New_York";

  hardware.graphics.enable = true;
  
  sound.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;

    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.bluetooth.enable = true;

  services.openssh.enable = true;

  users.users.liuwilli = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  system.stateVersion = "24.05";
}
