{ config, lib, pkgs, ... }: {
  options.modules.git.enable = lib.mkEnableOption "git";
  config = lib.mkIf config.modules.git.enable {
    programs.git = {
      enable = true;
      userName = "liuwilli";
      userEmail = "liuwilli@protonmail.com";
      extraConfig = {
        safe.directory = "/etc/nixos";
      };
    };
  };
}
