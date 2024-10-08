{ config, pkgs, nixpkgs, inputs, ... }:

let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  session = "${pkgs.hyprland}/bin/Hyprland";
  username = "jmartjonesy";
in
{
  services.greetd = {
    enable = true;

    settings = {
      # auto-login
      #initial_session = {
      #  command = "${session}";
      #  user = "${username}";
      #};

      # Disable this if you are going to use auto-login above
      restart = true;

      default_session = {
        command = "${tuigreet} --greeting 'NixOS MuddaFucka!' --asterisks --time --cmd ${session}";
        user = "greeter";
      };
    };
  };
}
