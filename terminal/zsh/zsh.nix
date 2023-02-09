{ config, pkgs, ... }:
let
  # Import the global variables file
  global = import ../../global-var.nix;
in {
  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    thefuck
  ];

  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = { pkgs, ...}: {

    # Starship configuration
    programs.starship = {
      enable = true;
    };

    # Zoxide configuration
    programs.zoxide = {
      enable = true;
    };

    # Zsh configuration
    programs.zsh = {
      enable = true;
      initExtraFirst = ''
        neofetch
        eval $(thefuck --alias)
      ''; 
      enableSyntaxHighlighting = true;
      enableAutosuggestions = true;
      zplug = {
        enable = true;
        plugins = [
          { name = "catppuccin/zsh-syntax-highlighting"; }
          { name = "jeffreytse/zsh-vi-mode"; }
        ];
      };
    };
  };
}