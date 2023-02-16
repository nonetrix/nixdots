# TODO: This file is incomplete

{ config, pkgs, libs, ... }:
let 
  # Import the global variables file
  global = import ../../global-var.nix;

in {
  environment.systemPackages = with pkgs; [ 
    libsForQt5.qtstyleplugin-kvantum
    qt5ct 
  ];

  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  home-manager.users.${global.username} = { pkgs, ...}: {
    home.file = {
      ".config/Kvantum/".source = ./catppuccin-qt;

      ".config/qt5ct/qt5ct.conf".text = ''
        [Appearance]
        icon_theme=Papirus-Dark
        style=kvantum
      '';
    };
  };
}