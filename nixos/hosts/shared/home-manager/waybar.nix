{ ... }:

{
  # Status Bar
  programs.waybar = {
    enable = true;

    style = ''
      * {
        border: none;
        border-radius: 0;
        min-height: 0;
        font-family: Material Design Icons, JetBrainsMono Nerd Font;
        font-size: 13px;
      }

      window#waybar {
        background-color: #181825;
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial; /* Remove GTK theme values (waybar #1351) */
        min-width: 0; /* Fix weird spacing in materia (waybar #450) */
        box-shadow: inset 0 -3px transparent; /* Use box-shadow instead of border so the text isn't offset */
        padding: 6px 18px;
        margin: 6px 3px;
        border-radius: 4px;
        background-color: #1e1e2e;
        color: #cdd6f4;
      }

      #workspaces button.active {
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #workspaces button:hover {
       box-shadow: inherit;
       text-shadow: inherit;
       color: #1e1e2e;
       background-color: #cdd6f4;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      #temperature.cpu,
      #cpu,
      #memory,
      #disk,
      #battery,
      #wireplumber,
      #network,
      #clock,
      #tray {
        border-radius: 4px;
        margin: 6px 3px;
        padding: 6px 12px;
        background-color: #cba6f7;
        color: #181825;
      }

      #custom-logo {
        padding-right: 7px;
        padding-left: 7px;
        margin-left: 5px;
        font-size: 15px;
        border-radius: 8px 0px 0px 8px;
        color: #1793d1;
      }

      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #181825;
        }
      }

      #battery.warning,
      #battery.critical,
      #battery.urgent {
        background-color: #ff0048;
        color: #181825;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #battery.charging {
        background-color: #a6e3a1;
      }

      #clock {
        font-family: JetBrainsMono Nerd Font;
        background-color: #cba6f7;
      }


      tooltip {
        border-radius: 8px;
        padding: 15px;
        background-color: #131822;
      }

      tooltip label {
        padding: 5px;
        background-color: #131822;
      }
    '';

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        height = 34;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "temperature#cpu"
          "cpu"
          "memory"
          "disk"
          "wireplumber"
          "network"
          "battery"
        ];
        "wlr/taskbar" = {
          format = "{icon}";
          on-click = "activate";
          on-click-right = "fullscreen";
          icon-theme = "WhiteSur";
          icon-size = 25;
          tooltip-format = "{title}";
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            default = "";
            active = "󱓻";
            urgent = "󱓻";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
          };
          "persistent-workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
          };
        };
        clock = {
          tooltip-format = "<tt>{calendar}</tt>";
          format-alt = "  {:%a, %d %b %Y}";
          format = "  {:%I:%M %p}";
        };
        tray = {
          spacing = 10;
        };
        "temperature#cpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon6/temp1_input";
          format = "{temperatureC}°C";
        };
        cpu = {
          interval = 5;
          format = "󰻠 {usage}%";
          max-length = 10;
        };
        memory = {
          interval = 5;
          format = "󰍛 {}%";
          max-length = 10;
        };
        disk = {
          interval = 30;
          format = "󰆓 {percentage_used}%";
          max-length = 10;
        };
        wireplumber = {
          format = "{icon}";
          format-bluetooth = "󰂰";
          nospacing = 1;
          tooltip-format = "Volume : {volume}%";
          format-muted = "󰝟";
          format-icons = {
            headphone = "";
            default = ["󰖀" "󰕾"];
          };
          scroll-step = 1;
        };
        network = {
          format-wifi = "{icon}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-ethernet = "󰀂";
          format-alt = "󱛇";
          format-disconnected = "󰖪";
          tooltip-format-wifi = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";
          interval = 5;
          nospacing = 1;
        };
        battery = {
          format = "{capacity}% {icon}";
          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          format-full = "Charged ";
          interval = 5;
          states = {
            warning = 20;
            critical = 10;
          };
        };
      };
    };
  };
}
