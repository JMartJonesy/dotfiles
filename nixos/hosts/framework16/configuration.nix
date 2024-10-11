# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./drives.nix
      inputs.nixos-hardware.nixosModules.framework-16-7040-amd
      ../shared/defaults.nix
      ../shared/unfree-apps.nix
      inputs.lanzaboote.nixosModules.lanzaboote
    ];

    services.fwupd.enable = true; # Firmware updater

    environment.systemPackages = [
      pkgs.sbctl # To debug/troubleshoot Secure Boot
      pkgs.chromium # To configure framework keyboard through VIA web-tool
    ];

    boot.loader.systemd-boot.enable = lib.mkForce false;

    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
}

