{ config, pkgs, nixpkgs, inputs, ... }:

{
  # App Launcher
  programs.wofi = {
    enable = true;
  };
}
