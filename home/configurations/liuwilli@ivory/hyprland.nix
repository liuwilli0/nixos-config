{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = with pkgs; [
      hyprlandPlugins.hy3
    ];

    settings = {
      general.layout = "hy3";

      debug.disable_logs = false;

      device = {
        name = "raydium-corporation-raydium-touch-system";
        output = "eDP-1";
      };

      exec-once = [
        "waybar"
      ];

      "$mod" = "SUPER";
      "$term" = "foot";
      "$menu" = "rofi -show";

      "$left" = "h";
      "$down" = "j";
      "$up" = "k";
      "$right" = "l";

      bind = [
        "$mod, $left, hy3:movefocus, l"
        "$mod, $down, hy3:movefocus, d"
        "$mod, $up, hy3:movefocus, u"
        "$mod, $right, hy3:movefocus, r"

        "$mod+SHIFT, $left, hy3:movewindow, l"
        "$mod+SHIFT, $down, hy3:movewindow, d"
        "$mod+SHIFT, $up, hy3:movewindow, u"
        "$mod+SHIFT, $right, hy3:movewindow, r"

        "$mod+CONTROL, $left, resizeactive, -10 0"
        "$mod+CONTROL, $down, resizeactive, 0 10"
        "$mod+CONTROL, $up, resizeactive, 0 -10"
        "$mod+CONTROL, $right, resizeactive, 10 0"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod+SHIFT, 1, hy3:movetoworkspace, 1"
        "$mod+SHIFT, 2, hy3:movetoworkspace, 2"
        "$mod+SHIFT, 3, hy3:movetoworkspace, 3"
        "$mod+SHIFT, 4, hy3:movetoworkspace, 4"
        "$mod+SHIFT, 5, hy3:movetoworkspace, 5"
        "$mod+SHIFT, 6, hy3:movetoworkspace, 6"
        "$mod+SHIFT, 7, hy3:movetoworkspace, 7"
        "$mod+SHIFT, 8, hy3:movetoworkspace, 8"
        "$mod+SHIFT, 9, hy3:movetoworkspace, 9"
        "$mod+SHIFT, 0, hy3:movetoworkspace, 10"

        "$mod+CONTROL, R, exec, hyprctl reload"
        # "$mod+CONTROL, R, forcerendererreload"
        "$mod+CONTROL, Q, exit"

        "$mod, D, movecurrentworkspacetomonitor, +1"

        "$mod, T, hy3:changegroup, toggletab"
        "$mod, E, hy3:changegroup, opposite"
        "$mod, V, hy3:makegroup, v"
        "$mod, B, hy3:makegroup, h"

        "$mod, W, hy3:killactive"
        "$mod, M, fullscreen"

        "$mod, Space, togglefloating"
        "$mod+SHIFT, Space, hy3:togglefocuslayer"

        # https://github.com/outfoxxed/hy3/issues/53
        # "$mod, X, hy3:movetoworkspace, special"
        # "$mod+SHIFT, X,  togglespecialworkspace"

        "$mod, A, hy3:changefocus, raise"
        "$mod, Z, hy3:changefocus, lower"

        "$mod, Return, exec, $term"
        "$mod, R, exec, $menu"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 1%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 1%-"
        "SHIFT, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SOURCE@ 1%+"
        "SHIFT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SOURCE@ 1%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"

        ", XF86MonBrightnessUp, exec, brightnessctl s 1%+"
        ", XF86MonBrightnessDown, exec, brightnessctl s 1%-"
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["~/Downloads/yellow-triangle.png"];
      wallpaper = [",~/Downloads/yellow-triangle.png"];
    };
  };
}
