{ ... }:

{
  # PUT PROGRAMS HERE THAT RE NOT CONFIGURABLE BY HOME-MANAGER

  # Allow unfree packages like obsidian
  nixpkgs.config.allowUnfree = true;

  # Needed to use OG kickstart.nvim
  #programs.nix-ld = {
  #  enable = true;
  #  package = pkgs.nix-ld-rs;
  #};

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "jmartjonesy" ];
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
