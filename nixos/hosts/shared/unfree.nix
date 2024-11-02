{ lib, ... }:

{
  # Add all unfree here
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password"
    "1password-cli"
    "1password-gui"
    "obsidian"
  ];
}
