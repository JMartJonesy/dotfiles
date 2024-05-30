{ config, inputs, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    ripgrep
    unzip
    home-manager
    wget
    firefox
    brightnessctl
    killall
    wl-clipboard
    wev
    # Apps
    bambu-studio
    obsidian
    vlc
    # Languages/Language Tools
    cmake
    gcc
    cargo
    rustc
    go
    gnumake
    zulu # Java
    # Hyprland
    waybar # Status Bar
    mako # Notification Daemon
    libnotify # Dependency of Mako
    grim # Screenshot Utility
    slurp # Screenshot Helper
    hyprpaper # Wallpaper Manager
    hyprlock # Lock Screen
    hypridle # Idle Handler
    hyprpicker # Color Picker
    kitty # Hyprlands's Default Terminal
    wofi # App Launcher
    wlogout # Logout Menu
    material-design-icons # Font pack
  ];
}
