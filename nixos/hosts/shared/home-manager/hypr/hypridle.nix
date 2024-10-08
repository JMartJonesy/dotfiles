{ config, pkgs, lib, inputs, ... }:

{
  # Idle Handler
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        # avoid starting multiple hyprlock instances.
        "lock_cmd" = let hyprlock = lib.getExe config.programs.hyprlock.package;
        in "pidof ${hyprlock} || ${hyprlock}";
      };

      listener = [
        {
          timeout = 240; # 4min.
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r"; # monitor backlight restore.
        }
        # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
        { 
          timeout = 300; # 5min.
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
        }
        {
          timeout = 360; # 6min
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session"; # lock screen when timeout has passed
        }
        {
          timeout = 420; # 7min
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
        }
      ];
    };
  };
}
