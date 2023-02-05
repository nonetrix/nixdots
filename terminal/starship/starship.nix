{ config, pkgs, ... }:
let
  # Import the global variables file
  global = import ../../global-var.nix;
in {
  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  home-manager.users.${global.username} = { pkgs, ...}: {
    # Version this file was written in
    home.stateVersion = "22.11";
    
    # Starship configuration
    programs.starship = {
      enable = true;
    };
  };
}