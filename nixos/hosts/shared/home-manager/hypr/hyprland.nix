{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # See https://hyprland.org/plugins/
    plugins = [
      #pkgs.hyprlandPlugins.<PLUGIN_HERE>
    ];

    settings = {
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki

#      debug = {
#        enable_stdout_logs = true;
#      };

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = ",preferred,auto,1.333333";

      # Ensure Wayland doesn't try to scale GTK apps
      xwayland = {
        force_zero_scaling = true;
      };

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      env = [
        #"GDK_SCALE,2" # Scale GTK apps since they don't scale nicely using Wayland
      ];

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input = {
        kb_layout = "us";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = "yes";
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {

        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;

        layout = "dwindle";

        # Stops the focus from moving left to right when no screen is above the current screen
        no_focus_fallback = true;
      };

      decoration = {

        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };

        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
      };

      animations = {
        enabled = "yes";

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      gestures = {
        workspace_swipe = "on";
      };

      misc = {
        force_default_wallpaper = -1; # Set to 0 to disable the anime mascot wallpapers
      };

      windowrulev2 = [
        "float, class:floating"
        "float, class:dialog"
        "size 25% 25%, class:dialog"
      ];

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      #device:epic-mouse-v1 {
      #    sensitivity = -0.5
      #}

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      # Shutdown when the lid is closed
      #bindl = [
      #  ", switch:on:Lid Switch, exec, systemctl poweroff"
      #];

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      "$mainMod" = "SUPER";

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      # My bindings
      # Launch Apps
      bind = [
        "$mainMod, SPACE, exec, wofi --allow-images --show drun --height=35% --width=25%"
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, B, exec, firefox"
        "$mainMod, E, exec, dolphin"
        "$mainMod, N, exec, obsidian"
        "$mainMod, P, exec, bambu-studio"
        ", xf86PowerOff, exec, wlogout"

        # Media Keys
        #", xf86audioplaypause, exec,"
        ", xf86audiomute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        #'', Print, exec, kitty --class dialog -e "$HOME/bin/screenshot"''
        ", Print, exec, kitty --class dialog -e j-screenshot"

        "$mainMod, Q, killactive,"
        "$mainMod, V, togglefloating,"
        "$mainMod, D, pseudo," # dwindle
        "$mainMod, T, togglesplit," # dwindle
        "$mainMod, F, fullscreen, 1"
        "$mainMod SHIFT, F, fullscreen"
        "$mainMod SHIFT, M, exit,"

        # Move focus with mainMod + hjkl
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        # Move window with mainMod + SHIFT + hjkl
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, J, movewindow, d"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, L, movewindow, r"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        #"$mainMod, S, togglespecialworkspace, magic"
        #"$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

      ];

      binde = [
        # Media Keys
        ", xf86audioraisevolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", xf86audiolowervolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", xf86monbrightnessup, exec, brightnessctl set 5%+"
        ", xf86monbrightnessdown, exec, brightnessctl set 5%-"

        # Resize window with mainMod + ALT + hjkl
        "$mainMod ALT, H, resizeactive, -10 0"
        "$mainMod ALT, J, resizeactive, 0 10"
        "$mainMod ALT, K, resizeactive, 0 -10"
        "$mainMod ALT, L, resizeactive, 10 0"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      source = [
        # Sets up monitors using config from nwg-displays
        #"~/.config/hypr/monitors.conf"
      ];

      exec-once = [
        "waybar &"
        "mako &"
      ];
    };
  };
}
