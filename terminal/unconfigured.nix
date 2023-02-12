{ config, pkgs, ... }:
{
    nixpkgs.config.joypixels.acceptLicense = true;

    environment.systemPackages = with pkgs; [
        fzf
        tree
        wget
        git
        bottom
        neofetch
        alsa-utils
        playerctl
        dconf
        cava
        killall
        xdg-user-dirs
        usbutils
        bat
        lsd
        ripgrep
        polymc
        steam
    ];
}