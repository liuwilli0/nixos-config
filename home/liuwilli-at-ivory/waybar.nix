{
  programs.waybar = {
    enable = true;

    settings = [
      {
        spacing = 8;
        height = 28;

        modules-left = ["wireplumber" "backlight" "battery" "cpu" "memory" "temperature"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["bluetooth" "network" "tray" "clock"];

        cpu = {
          format = "  {usage}% {load}";
          # icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

        memory = {
          interval = 10;
          format = "  {percentage}%";
          tooltip-format = "{percentage}%, {used:0.1f}/{total:0.1f}GiB memory used\n{swapPercentage}%, {swapUsed:0.1f}/{swapTotal:0.1f}GiB swap used";
        };

        temperature = {
          format = "{icon} {temperatureC}°C";
          tooltip-format = "{temperatureC}°C\n{temperatureF}°F";
          format-icons = ["" "" "" "" ""];
        };

        clock = {
          interval = 1;
          format = "{:%a %m/%d %r}";
          tooltip-format = "{calendar}";
        };

        # https://github.com/Alexays/Waybar/issues/3092
        # https://github.com/Alexays/Waybar/pull/3638
        "wireplumber#sink" = {
          a = "a";
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = ["󰕿" "󰖀" "󰕾"];
          on-click = "pwvucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };

        "wireplumber#source" = {
          node-type = "Audio/Source";
          format = "󰍬 {volume}%";
          format-muted = "󰍭 {volume}%";
          on-click = "pwvucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };
        # pulseaudio = {
        #   format = "{icon} {volume}% {format_source}";
        #   format-muted = "󰝟 {volume}% {format_source}";
        #   format-source = "󰍬 {volume}%";
        #   format-source-muted = "󰍭 {volume}%";
        #   format-icons = ["󰕿" "󰖀" "󰕾"];
        # };

        backlight = {
          format = " {percent}%";
          # format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
        };

        battery = {
          interval = 10;
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
          format-connected = "󰂯 {device_alias}";
          format-connected-battery = "󰂯 {device_battery_percentage}% {device_alias}";
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
          max-length = 16;
        };

        network = {
          format = "󰤨  ?";
          format-ethernet = " ";
          format-wifi = "{icon} {signalStrength}% {essid}";
          format-linked = "󰤩 ";
          format-disconnected = "󰤭 ";
          format-disabled = "󰤭  Disabled";
          format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
          tooltip-format = "󰤨  ?";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format-wifi = "{ifname}: {ipaddr}/{cidr}\n{frequency}MHz";
          tooltip-format-disconnected = "Disconnected";
          tooltip-format-disabled = "Interface is disabled";
          max-length = 16;
        };

        # https://github.com/Alexays/Waybar/issues/768
        tray = {
          show-passive-items = true;
          spacing = 8;
        };
      }
    ];

    # style = ''
    #   * {
    #     font-family: 'Iosevka Nerd Font';
    #   }
    # '';
    style = ''
      * {
        min-height: 0;
        font-weight: bold;
      }

      window#waybar>box {
        padding: 0 4px;
      }

      #workspaces button {
        padding: 0 2px;
        border-radius: 0;
      }
    '';
  };
}
