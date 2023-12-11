{
  config,
  pkgs,
  ...
}: let
  # Import the global variables file
  global = import ../../global-var.nix;
in {
  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = {pkgs, ...}: {
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
        name = "Catppuccin-Mocha-Standard-Green-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = ["green"];
          variant = "mocha";
        };
      };
    };
  };
}
