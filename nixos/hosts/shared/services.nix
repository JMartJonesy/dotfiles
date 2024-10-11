{ ... }:

{
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Keymappings
  services.kanata = {
    enable = true;
    keyboards = {
      "xps".config = ''
        (defsrc
          caps
        )

        ;; tap caps-lock to esc, hold caps-lock for ctrl
        (defalias
          escctrl (tap-hold 200 200 esc lctrl)
        )

        (deflayer base
          @escctrl
        )
      '';
    };
  };

  # Service for AGS
  #services.upower = {
  #  enable = true;
  #};
  #services.gvfs = {
  #  enable = true;
  #};

}
