_: {
  programs.waybar = {
    enable = true;
    settings = [{
      "margin" = "5";
      "spacing" = 0;

      "modules-left" = [ "hyprland/workspaces" ];
      "modules-right" = [ "pulseaudio" "backlight" "bluetooth" "battery" "tray" "clock" ];

      # https://github.com/Alexays/Waybar/issues/3092
      # "wireplumber" = {
      #   "format" = "{icon} {volume}%";
      #   "format-muted" = "󰝟 {volume}%";
      #   "format-icons" = [ "󰕿" "󰖀" "󰕾" ];
      # };

      # "wireplumber#microphone" = {
      #   "format" = "󰍬 {volume}%";
      #   "format-muted" = "󰍭 {volume}%";
      # };
      "pulseaudio" = {
        "format" = "{icon} {volume}% {format_source}";
        "format-muted" = "󰝟 {volume}% {format_source}";
        "format-source" = "󰍬 {volume}%";
        "format-source-muted" = "󰍭 {volume}%";
        "format-icons" = [ "󰕿" "󰖀" "󰕾" ];
      };

      "backlight" = {
        "format" = "{icon} {percent}%";
        "format-icons" = [ "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
      };

      "bluetooth" = {
        "format" = "󰂯 ?";
        "format-disabled" = "󰂲 Disabled";
        "format-off" = "󰂲";
        "format-on" = "󰂯";
        "format-connected" = "󰂯 {device_alias}: {status}";
        "format-connected-battery" = "󰂯 {device_alias}: {status}, {device_battery_percentage}%";
      };

      "battery" = {
        "format" = "󰂑 ?";
        "format-charging" = " {icon} {capacity}%";
        "format-discharging" = "{icon} {capacity}%";
        "format-plugged" = " {icon} {capacity}%";
        "format-not_charging" = "!{icon} {capacity}%";
        "format-full" = "{icon} {capacity}% Full";
        "format-time" = "{H} h {M} min";
        "format-icons" = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      };

      "clock" = {
        "interval" = 1;
        "format" = "{:%a %m/%d %r}";
      };
    }];

    style = ''
      @define-color bg #504945;
      @define-color fg #d4be98;
      @define-color orange #d8a657;
      @define-color green #a9b665;
      @define-color blue #458588;
      @define-color purple #d3869b;
      
      * {
        font-family: 'Iosevka Nerd Font';
        font-size: 14px;
        border-radius: 0px;
        margin: 0;
        padding: 0;
      }
      
      window#waybar {
        background-color: transparent;
      }

      #workspaces,
      /* #wireplumber, */
      #pulseaudio,
      #backlight,
      #bluetooth,
      #battery,
      #tray,
      #clock {
        padding: 0 10px;
      }

      #workspaces {
        padding-left: 0;
      }
      
      #workspaces button {
        color: @fg;
        font-weight: bolder;
        font-style: normal;
        border-radius: 20px;
      }
      
      #workspaces button.active {
        background-color: @bg;
        border-radius: 20px;
      }

      /* #wireplumber */
      #pulseaudio {
        color: @purple;
      }

      #backlight {
        color: @orange;
      }

      #bluetooth {
        color: @blue;
      }

      #battery {
        color: @green;
      }
      
      #clock {
        font-weight: bolder;
        padding-right: 0;
        color: @fg;
      }
    '';
  };
}
