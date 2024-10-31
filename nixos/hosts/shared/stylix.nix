{ pkgs, inputs, ... }:

{
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;

    # See https://github.com/tinted-theming/schemes for themes
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";

    image = pkgs.fetchurl {
      url = "https://images7.alphacoders.com/135/1358878.png";
      sha256 = "b1d04462a55d93ed1ac93d0e701ee803f2a0385c6ff126878546f3ae6f2e1be0";
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };
  };
}
