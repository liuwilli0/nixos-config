{config, ...}: {
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      custom = "${config.xdg.configHome}/oh-my-zsh";
      theme = "bira-mod";
    };
  };

  home.shell.enableZshIntegration = true;

  xdg.configFile."oh-my-zsh/themes/bira-mod.zsh-theme".text = ''
    local return_code="%(?..%{$fg[red]%}%? ←%{$reset_color%})"
    local user_host="%B%(!.%{$fg[red]%}.%{$fg[green]%})%n@%m%{$reset_color%}"
    local user_symbol='%(!.#.$)'
    local current_dir="%B%{$fg[blue]%}%~%{$reset_color%}"

    # https://github.com/kamadorueda/alejandra/issues/417
    local git_branch=${"'"}''${$(git_prompt_info):+ $(git_prompt_info)}'

    # https://github.com/NixOS/nix/issues/6677
    # https://discourse.nixos.org/t/custom-prompts-or-shell-depth-indicator-for-nix-shell-nix-develop/29942/5
    local shell_level
    if [[ -z $ORIG_SHLVL ]] || [ $(ps -o tty= -p$$) != $(ps -o tty= -p$PPID) ]; then
        export ORIG_SHLVL=$SHLVL
    fi;
    if [[ $SHLVL -gt $ORIG_SHLVL ]]; then
        shell_level="($(($SHLVL - $ORIG_SHLVL)))"
    fi;

    PROMPT="┌─(''${user_host})-[''${current_dir}]''${git_branch} ''${shell_level}
    └─%B''${user_symbol}%b "
    RPROMPT="%B''${return_code}%b"

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}<"
    ZSH_THEME_GIT_PROMPT_SUFFIX=">%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}•%{$fg[yellow]%}"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"
  '';
}
