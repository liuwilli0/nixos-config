{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    enable = true;

    config = {
      modifier = "Mod4";
      terminal = "foot";
      menu = "fuzzel";

      input."9094:17198:Raydium_Corporation_Raydium_Touch_System".map_to_output = "eDP-1";

      bars = [
        {
          position = "top";
          fonts = {
            names = ["Iosevka Nerd Font"];
            size = 11.0;
          };
        }
      ];

      fonts = {
        names = ["Iosevka Nerd Font"];
        size = 11.0;
      };

      modes = {};

      focus.followMouse = "no";
      # Workaround for https://github.com/nix-community/home-manager/issues/695
      workspaceOutputAssign = [
        {
          workspace = "10";
        }
      ];

      keybindings = let
        left = config.wayland.windowManager.sway.config.left;
        down = config.wayland.windowManager.sway.config.down;
        up = config.wayland.windowManager.sway.config.up;
        right = config.wayland.windowManager.sway.config.right;
        mod = config.wayland.windowManager.sway.config.modifier;
        term = config.wayland.windowManager.sway.config.terminal;
        menu = config.wayland.windowManager.sway.config.menu;
      in {
        "${mod}+${left}" = "focus left";
        "${mod}+${down}" = "focus down";
        "${mod}+${up}" = "focus up";
        "${mod}+${right}" = "focus right";

        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${right}" = "move right";

        "${mod}+Control+${left}" = "resize shrink width 10px";
        "${mod}+Control+${down}" = "resize grow height 10px";
        "${mod}+Control+${up}" = "resize shrink height 10px";
        "${mod}+Control+${right}" = "resize grow width 10px";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        "${mod}+Control+r" = "reload";
        "${mod}+Control+q" = "exec swaymsg exit";

        "${mod}+w" = "kill";

        "${mod}+m" = "fullscreen";

        "${mod}+b" = "splith";
        "${mod}+v" = "splitv";

        # Workaround for https://github.com/swaywm/sway/issues/4346
        "${mod}+d" = "exec \"swaymsg -t get_outputs | ${pkgs.jq}/bin/jq '[.[] | select(.active == true)] | .[(map(.focused) | index(true) + 1) % length].name' | xargs swaymsg move workspace to\"";

        "${mod}+s" = "layout stacking";
        "${mod}+t" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        "${mod}+space" = "floating toggle";
        "${mod}+Shift+space" = "focus mode_toggle";

        "${mod}+a" = "focus parent";

        "${mod}+x" = "move scratchpad";
        "${mod}+Shift+x" = "scratchpad show";

        "${mod}+Return" = "exec ${term}";
        "${mod}+r" = "exec ${menu}";

        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 1%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 1%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "XF86MonBrightnessUp" = "exec brightnessctl s 1%+";
        "XF86MonBrightnessDown" = "exec brightnessctl s 1%-";
      };
    };
  };
}
