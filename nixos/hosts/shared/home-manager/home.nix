{ config, pkgs, nixpkgs, inputs, ... }:

{
  imports = [
    ./cli.nix
    ./waybar.nix
    ./hypr/hypr.nix
    ./wlogout.nix
    ./mako.nix
    ./wofi.nix
    ./kickstart.nixvim/nixvim.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "jmartjonesy";
  home.homeDirectory = "/home/jmartjonesy";

  # This value determines the Home Manager release that your configuration is compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };

  # Allow unfree packages like obsidian
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with pkgs; [
    material-design-icons

    # CLI
    libnotify # Dependency of Mako notification manager
    grim # Screenshot Utility
    slurp # Screenshot Helper
    #ripgrep
    unzip
    wget
    brightnessctl
    killall
    wl-clipboard
    wev # Wayland event viewer, useful for debugging events
    wlr-randr # Wayland compositor manager (Use to change resolution,refresh rate, etc.)
    nh
    #nix-output-monitor
    #nvd
    gh
    fastfetch # Show linux stats
    cht-sh # CLI cheat.sh

    # Languages/Language Tools
    android-tools
    cargo
    cmake
    gcc
    go
    gnumake
    lua
    rustc
    zulu # Java

    # Apps
    bambu-studio
    vlc
    vdhcoapp # Firefox Video DownloadHelper Extension add-on support RUN `vdhcoapp install` to setup
    obsidian
    guvcview # Configure camera settings
    displaycal

    # You can also create simple shell scripts directly inside your configuration.
    (writeShellScriptBin "j-screenshot" ''
        while [[ -z "$FILENAME" ]]
        do
          read -p "File name: " FILENAME
        done

        hyprctl dispatch movetoworkspacesilent 10,activewindow
        grim -g "$(slurp)" "$HOME/Pictures/screenshots/$FILENAME.png"
    '')
  ];

  programs.firefox = {
    enable = true;
  };

  home.file = {
    "Pictures/screenshots/.keep" = {
      enable = true;
      text = ""; # Empty file so that directory is created
    };
    "Pictures/wallpapers/.keep" = {
      enable = true;
      text = ""; # Empty file so that directory is created
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jmartjonesy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

}
