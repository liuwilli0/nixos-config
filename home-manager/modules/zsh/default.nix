{ config, lib, pkgs, ... }: {
  options.modules.zsh.enable = lib.mkEnableOption "zsh";
  config = lib.mkIf config.modules.zsh.enable {
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        custom = "$HOME/.config/oh-my-zsh";
        theme = "bira-mod";
      };
    };

    xdg.configFile."oh-my-zsh/themes/bira-mod.zsh-theme".source = ./bira-mod.zsh-theme;
  };
}
