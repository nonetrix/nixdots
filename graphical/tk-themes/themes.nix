{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
      libsForQt5.breeze-qt5
      papirus-icon-theme
    ];
}