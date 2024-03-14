# TODO: This file is incomplete
{
  config,
  pkgs,
  ...
}: let
  # Import the global variables file
  global = import ../../global-var.nix;
in {
  nixpkgs.config.packageOverrides = pkgs: {
    # Selections the variant for installation
    catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
      accent = "Sapphire";
      variant = "Mocha";
    };
  };

  # TODO: See if there is way to not install qt5/6ct and just do it manually
  environment.systemPackages = with pkgs; [
    # Needed for SVG based themes?
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    # Control panel for QT themes, I don't think I need this but I couldn't find good alternative
    qt5ct
    qt6ct
    # Default Breeze theme
    libsForQt5.breeze-qt5
    # Nice icons
    papirus-icon-theme
  ];

  # Sets the program that sets the QT theme
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  home-manager.users.${global.username} = {pkgs, ...}: {
    home.file = {
      # Puts theme in right place
      ".config/Kvantum/Catppuccin-Mocha-Sapphire".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Mocha-Sapphire";

      # Selects the theme in Kvantum
      ".config/Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=Catppuccin-Mocha-Sapphire
      '';

      # Selects the theme in qt5/6ct, again, I feel like I don't need this really
      ".config/qt6ct/qt6ct.conf".text = ''
        [Appearance]
        icon_theme=Papirus-Dark
        style=kvantum
      '';

      ".config/qt5ct/qt5ct.conf".text = ''
        [Appearance]
        icon_theme=Papirus-Dark
        style=kvantum
      '';
    };
  };
}
