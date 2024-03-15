{pkgs, ...}: let
  global = import ../global-var.nix;
in {
  programs.zsh.enable = true;

  environment = {
    systemPackages = with pkgs; [
      thefuck
    ];

    variables = {
      MOZ_ENABLE_WAYLAND = "1";
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
    };
  };

  home-manager.users.${global.username} = {...}: {
    # TODO: change tab menu when selecting files
    programs = {
      # Nice shell prompt
      starship = {
        enable = true;
      };

      # Allows for you to quickly change directories
      zoxide = {
        enable = true;
      };

      zsh = {
        enable = true;

        # Ignores duplicates in history
        history.ignoreDups = true;

        # Aliases
        shellAliases = {
          "ls" = "lsd ";
          "cat" = "bat -pp ";
          "grep" = "rg ";
          ".." = "cd ..";
          "tp" = "trash put";
          "radar" = "curl https://sirocco.accuweather.com/nx_mosaic_640x480_public/sir/inmasiral_.gif | imv -";
          "forecast" = "curl wttr.in";
          "umatrix" = "unimatrix";
          "gsrun" = "gamescope -W 1920 -H 1080 -r 165";
        };

        initExtraFirst = ''
          neofetch
          export PATH="$HOME/.local/bin:$PATH"
          eval $(thefuck --alias)
          # TODO: See if there is better way to set this? Seems not
          zstyle ':completion:*' menu select
        '';

        syntaxHighlighting.enable = true;
        autosuggestion.enable = true;
        zplug = {
          enable = true;
          plugins = [
            {name = "catppuccin/zsh-syntax-highlighting";}
            {name = "jeffreytse/zsh-vi-mode";}
            {name = "chisui/zsh-nix-shell";}
            {name = "nix-community/nix-zsh-completions";}
          ];
        };
      };
    };
  };
}
