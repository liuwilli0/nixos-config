_: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        spacing = 12;

        modules-left = ["hyprland/workspaces"];
        modules-right = ["pulseaudio" "backlight" "battery" "bluetooth" "network" "tray" "clock"];

        # https://github.com/Alexays/Waybar/issues/3092
        # wireplumber = {
        #   format = "{icon} {volume}%";
        #   format-muted = "󰝟 {volume}%";
        #   format-icons = [ "󰕿" "󰖀" "󰕾" ];
        # };

        # "wireplumber#microphone" = {
        #   format = "󰍬 {volume}%";
        #   format-muted = "󰍭 {volume}%";
        # };
        pulseaudio = {
          format = "{icon} {volume}% {format_source}";
          format-muted = "󰝟 {volume}% {format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 {volume}%";
          format-icons = ["󰕿" "󰖀" "󰕾"];
        };

        backlight.format = " {percent}%";
        # format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];

        battery = {
          format = "󰂑 ?";
          format-charging = " {icon} {capacity}%";
          format-discharging = "{icon} {capacity}%";
          format-plugged = " {icon} {capacity}%";
          format-not_charging = "!{icon} {capacity}%";
          format-full = "{icon} {capacity}% Full";
          format-time = "{H} h {M} min";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };

        bluetooth = {
          format = "󰂯 ?";
          format-disabled = "󰂲 Disabled";
          format-off = "󰂲";
          format-on = "󰂯";
          format-connected = "󰂯 {device_alias}: {status}";
          format-connected-battery = "󰂯 {device_alias}: {status}, {device_battery_percentage}%";
        };

        network = {
	  format = "󰤨  ?";
          format-wifi = "{icon} {signalStrength}% {essid}";
	  format-ethernet = "  {ipaddr}/{cidr}";
	  format-disconnected = "󰤭 ";
	  format-linked = "󰤩 ";
	  format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
	};

        clock = {
          interval = 1;
          format = "{:%a %m/%d %r}";
	  tooltip-format = "{calendar}";
        };
      }
    ];

    style = ''
      * {
        font-family: 'Iosevka Nerd Font';
      }
    '';
  };
}
