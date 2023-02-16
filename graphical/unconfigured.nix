{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        vscodium
        pcmanfm
        zip
        unzip
        pavucontrol
        firefox
        ungoogled-chromium
        flameshot
        anki-bin
        freetube
        zathura
        imv
        mpv
        yt-dlp
        ffmpeg
        xdotool
        xsel
        steam
        prismlauncher
        xorg.xinit
        krita
    ];
}