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
        xwallpaper
        xorg.xkill
        killall
        xdg-user-dirs
    ];
}