{ pkgs, home-manager, nixvim, ... }:

{
  imports = [
    ./services.nix
    ./greeter.nix
    ./stylix.nix
    ./unfree.nix
    ./programs.nix
    home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Dual-boot with Windows needs this otherwise Windows time is wrong
  time.hardwareClockInLocalTime = true;
  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Define your hostname.
  networking.hostName = "nixos";
  # Enable networking
  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Needed for hyprlock
  security.rtkit.enable = true;
  security.pam.services.hyprlock = {};

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jmartjonesy = {
    isNormalUser = true;
    description = "JMartJonesy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
    # Have to do this or it whines about programs.zsh not being enabled
    # even though it is configured in my home.nix
    ignoreShellProgramCheck = true;
  };

  # Some apps can't use Hyprland wayland so they use gtk?????
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ 
        # Enables screensharing optimized for hyprland
        pkgs.xdg-desktop-portal-hyprland
        # Enables file-picker since hyprland doesn't provide one
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = "*";
        };
      };
    };
  };

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # Hint GTK aps to use Wayland
    GDK_BACKEND = "wayland";
    # Hint Qt apps to use Wayland
    QT_QPA_PLATFORM = "wayland";
  };

  home-manager = {
    extraSpecialArgs = { 
      # Pass along the nixvim nixos module
      inherit nixvim;
    };
    useGlobalPkgs = true;
    #useUserPackages = true;
    users = {
      "jmartjonesy" = import ./home-manager/home.nix;
    };
    backupFileExtension = "hm-backup";
  };

  system = {
    autoUpgrade = {
      enable = true;
      # Don't forget to set system.autoUpgrade.flake param in your host configuration.nix file
      flags = [
        "--update-input"
        "nixpkgs"
        "--commit-lock-file"
      ];
      allowReboot = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
