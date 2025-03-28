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

        backlight = {
          format = " {percent}%";
          # format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
        };

        battery = {
          format = "󰂑 ?";
          format-charging = " {icon} {capacity}%";
          format-discharging = "{icon} {capacity}%";
          format-plugged = " {icon} {capacity}%";
          format-not_charging = "!{icon} {capacity}%";
          format-full = "{icon} {capacity}% Full";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip-format = "{timeTo}\n{power}W power draw";
        };

        bluetooth = {
          format = "󰂯 ?";
          format-disabled = "󰂲 Disabled";
          format-off = "󰂲";
          format-on = "󰂯";
          format-connected = "󰂯 {device_alias}: {status}";
          format-connected-battery = "󰂯 {device_alias}: {status}, {device_battery_percentage}%";
          format-no-controller = "󰂯 !";
          tooltip-format = "󰂯 ?";
          tooltip-format-disabled = "Controller is disabled";
          tooltip-format-off = "Controller is off";
          tooltip-format-on = "No devices connected";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-connected-battery = "{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_address} {device_alias}";
          tooltip-format-enumerate-connected-battery = "{device_address} {device_alias}, {device_battery_percentage}%";
          tooltip-format-no-controller = "No controller found";
        };

        network = {
          format = "󰤨  ?";
          format-ethernet = " ";
          format-wifi = "{icon} {signalStrength}% {essid}";
          format-linked = "󰤩 ";
          format-disconnected = "󰤭 ";
          format-disabled = "󰤭 Disabled";
          format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
          tooltip-format = "󰤨  ?";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format-wifi = "{ifname}: {ipaddr}/{cidr}\n{frequency}MHz";
          tooltip-format-disconnected = "Disconnected";
          tooltip-format-disabled = "Interface is disabled";
        };

        clock = {
          interval = 1;
          format = "{:%a %m/%d %r}";
          tooltip-format = "{calendar}";
        };
      }
    ];

    # style = ''
    #   * {
    #     font-family: 'Iosevka Nerd Font';
    #   }
    # '';
  };
}
