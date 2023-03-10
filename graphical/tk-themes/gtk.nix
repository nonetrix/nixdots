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
    
    # GTK configuration
    gtk = {
      enable = true;

      # Icon theme configuration
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

    # Cursor themes
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
      package = pkgs.catppuccin-cursors.mochaDark;
    };

      # Theme configuration
      theme = {
        name = "Catppuccin-Mocha-Standard-Pink-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = ["pink"];
          variant = "mocha";
        };
      };
    };
  };
}
