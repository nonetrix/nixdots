{ config, pkgs, ... }:
{
    nixpkgs.config.joypixels.acceptLicense = true;

    environment.systemPackages = with pkgs; [
        vscodium
        libsForQt5.dolphin
        qt5ct
        pavucontrol
        firefox
        flameshot
    ];
}