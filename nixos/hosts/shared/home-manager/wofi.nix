{ config, pkgs, nixpkgs, inputs, ... }:

{
  # App Launcher
  programs.wofi = {
    enable = true;

    style = ''
      window {
        margin: 0px;
        border: 1px solid #${config.colorScheme.palette.base07};
        border-radius: 5px;
        background-color: #${config.colorScheme.palette.base03};
      }

      #input {
        margin: 5px;
        border: none;
        color: #${config.colorScheme.palette.base04};
        background-color: #${config.colorScheme.palette.base00};
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: #${config.colorScheme.palette.base01};
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: #${config.colorScheme.palette.base02};
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: #${config.colorScheme.palette.base06};
      }

      #entry:selected {
        background-color: #${config.colorScheme.palette.base0D};
      }

      #text:selected {
        color: #${config.colorScheme.palette.base01};
      }
    '';
  };
}
