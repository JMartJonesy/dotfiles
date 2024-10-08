{ config, pkgs, nixpkgs, inputs, ... }:

{
  # Notification Daemon
  services.mako = {
    enable = true;

    defaultTimeout = 5000;
  };
}
