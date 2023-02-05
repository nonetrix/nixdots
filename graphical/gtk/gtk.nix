{ config, pkgs, ... }:
let 
  # Import the global variables file
  global = import ../../global-var.nix;

in {
  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = { pkgs, ...}: {
    # Version this file was written in
    home.stateVersion = "22.11";
    
    # GTK configuration
    gtk = {
      enable = true;

      # Icon theme configuration
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    
      # Theme configuration
      theme = {
        name = "Catppuccin-Pink-Dark";
        package = pkgs.catppuccin-gtk;
      };
    };
  };
}
