{ ... }:

{
  # Lock Screen
  programs.hyprlock = {
    enable = true;

    settings = {
      background = {
        path = "$HOME/Pictures/wallpapers/lockscreen_wallpaper.png"; # only png supported for now
      };

      input-field = {
        outline_thickness = 3;
        dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
        outer_color = "rgb(151515)";
        inner_color = "rgb(FFFFFF)";
        font_color = "rgb(10, 10, 10)";
        fade_on_empty = true;
        fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
        hide_input = false;
        rounding = -1; # -1 means complete rounding (circle/oval)
        check_color = "rgb(204, 136, 34)";
        fail_color = "rgb(204, 34, 34)"; # if authentication failed, changes outer_color and fail message color
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
        fail_transition = 300; # transition time in ms between normal outer_color and fail_color
        capslock_color = -1;
        numlock_color = -1;
        bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
        invert_numlock = false; # change color if numlock is off
        swap_font_color = false; # see below
        position = "0, -260";
        halign = "center";
        valign = "center";
      };

      label = {
        text = ''cmd[update:1000] echo "$TIME"'';
        color = "rgb(FFFFFF)";
        font_size = 75;
        position = "-40, 0";
        halign = "right";
        valign = "bottom";
      };

      image = {
        path = "$HOME/Pictures/wallpapers/lockscreen_image.png";
        size = 560;
        rounding = -1; # negative values mean circle
        border_size = 4;
        border_color = "rgb(221, 221, 221)";
        rotate = 0; # degrees, counter-clockwise
        reload_time = -1; # seconds between reloading, 0 to reload with SIGUSR2
        #reload_cmd =  # command to get new path. if empty, old path will be used. don't run "follow" commands like tail -F
        position = "0, 200";
        halign = "center";
        valign = "center";
      };
    };
  };
}
