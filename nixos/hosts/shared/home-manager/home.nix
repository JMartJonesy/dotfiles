{ config, pkgs, nixpkgs, inputs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
    ./cli.nix
    ./kickstart.nixvim/nixvim.nix
    ./waybar.nix
    ./hypr/hypr.nix
    ./wlogout.nix
    ./mako.nix
    ./wofi.nix
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

  # Theming
  colorscheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

  # TODO: Figure out how to move this here from configuration.nix
  # Allow unfree packages
  #nixpkgs.config.allowUnfree = true;

  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with pkgs; [
    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    hack-font
    material-design-icons

    # CLI
    libnotify # Dependency of Mako
    grim # Screenshot Utility
    slurp # Screenshot Helper
    #ripgrep
    unzip
    wget
    brightnessctl
    killall
    wl-clipboard
    wev
    wlr-randr
    tldr
    nh
    #nix-output-monitor
    #nvd
    gh
    fastfetch

    # Apps
    bambu-studio
    vlc
    vdhcoapp # Firefox Video DownloadHelper Extension add-on support RUN `vdhcoapp install` to setup

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

    # GUI
    #nw-displays # Configures displayes  NOTE: This util save to ~/.config/nwg-displays/config
    guvcview # Configure camera settings

    #AGS (https://github.com/Aylur/dotfiles/tree/main?tab=readme-ov-file)
#    bun
#    dart-sass
#    fd
#    swww
#    matugen
#    fzf
#    wf-recorder
#    wayshot
#    swappy
#    asusctl
#    supergfxctl

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
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

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.ags = {
    enable = true;
    # null or path, leave as null if you don't wnat hm to manage the config
    #configDir = ./home-manager/ags;
    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  # Have 1password manage your ssh keys
#  _: let
#       onePassPath = "~/.1password/agent.sock";
#     in {
#       programs.ssh = {
#         enable = true;
#         extraConfig = ''
#           Host *
#             IdentityAgent ${onePassPath}
#           '';
#       };
#     };
}
