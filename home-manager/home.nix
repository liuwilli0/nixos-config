{ config, lib, pkgs, ... }: {
  imports = [ ./modules ];
  
  home.username = "liuwilli";
  home.homeDirectory = "/home/liuwilli";

  modules = {
    firefox.enable = true;
    foot.enable = true;
    fonts.enable = true;
    fuzzel.enable = true;
    git.enable = true;
    sway.enable = true;
    helix.enable = true;
    zsh.enable = true;
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
