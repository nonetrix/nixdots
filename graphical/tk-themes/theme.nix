{ config, pkgs, ... }:
{
    nixpkgs.config.joypixels.acceptLicense = true;

    environment.systemPackages = with pkgs; [
      libsForQt5.breeze-qt5
      papirus-icon-theme
    ];
}