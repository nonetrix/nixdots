{
  config,
  pkgs,
  ...
}: let
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

  home-manager.users.${global.username} = {pkgs, ...}: {
    programs = {
      starship = {
        enable = true;
      };

      zoxide = {
        enable = true;
      };

      zsh = {
        enable = true;

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
          fastfetch
          export PATH="$HOME/.local/bin:$PATH"
          eval $(thefuck --alias)

        '';

        syntaxHighlighting.enable = true;
        enableAutosuggestions = true;
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
