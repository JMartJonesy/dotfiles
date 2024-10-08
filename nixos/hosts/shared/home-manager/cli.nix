{ config, pkgs, ... }:

{
  home.shellAliases = {
    vim = "nvim";
    cd = "z";
    sudoedit = "sudo -E -s nvim";
    # vim-fundamentals course nvim config
    vf = "NVIM_APPNAME='vim-fundamentals' nvim";
  };

  programs.zsh = {
    enable = true;

    #initExtra = ''
    #'';
  };

  programs.starship = {
    enable = true;

    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
    };

    theme = "Tokyo Night";

    settings = {
      enable_audio_bell = false;
    };
  };

  programs.fd = {
    enable = true;
  };

  programs.fzf = {
    enable = true;

    enableZshIntegration = true;

    defaultCommand = "fd --hidden";
    # NOTE: This doesn't seem to work
    fileWidgetCommand = "fd --hidden";
    changeDirWidgetCommand = "fd --type=d --hidden";

    colors = {
      fg = "#${config.colorScheme.palette.base08}";
      "fg+" = "#${config.colorScheme.palette.base08}";
      bg = "#${config.colorScheme.palette.base01}";
      "bg+" = "#${config.colorScheme.palette.base01}";
      hl = "#${config.colorScheme.palette.base0E}";
      "hl+" = "#${config.colorScheme.palette.base0E}";
      info = "#${config.colorScheme.palette.base0A}";
      prompt = "#${config.colorScheme.palette.base0D}";
      pointer = "#${config.colorScheme.palette.base08}";
      marker = "#${config.colorScheme.palette.base08}";
      spinner = "#${config.colorScheme.palette.base08}";
      header = "#${config.colorScheme.palette.base08}";
    };
  };

  programs.bat = {
    enable = true;

    config = {
      theme = "tokyonight";
    };

    themes = {
      tokyonight = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "v3.0.1";
          sha256 = "sha256-QKqCsPxUyTur/zOUZdiT1cOMSotmTsnOl/3Sn2/NlUI=";
        };
        file = "extras/sublime/tokyonight_night.tmTheme";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;

    userEmail = "jem4687@rit.edu";
    userName = "JMartJonesy";

    delta = {
      enable = true;
      options = {
        side-by-side = true;
        navigate = true;
      };
    };
  };

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
  };
}
