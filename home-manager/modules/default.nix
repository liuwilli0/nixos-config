{ config, lib, pkgs, ... }: {
  imports = [
    ./firefox
    ./foot
    ./fonts
    ./fuzzel
    ./git
    ./helix
    ./sway
    ./zsh
  ];

  home.stateVersion = "24.05";
}
