# TODO: This file is incomplete
{
  config,
  pkgs,
  libs,
  ...
}: let
  # Import the global variables file
  global = import ../../global-var.nix;
in {
  nixpkgs.config.packageOverrides = pkgs: {
    catppuccin-kvantum = pkgs.catppuccin-kvantum.override {
      accent = "Pink";
      variant = "Mocha";
    };
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    qt5ct
    qt6ct
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  home-manager.users.${global.username} = {pkgs, ...}: {
    home.file = {
      ".config/Kvantum/Catppuccin-Mocha-Pink".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Mocha-Pink";
      ".config/Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=Catppuccin-Mocha-Pink
      '';

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
