{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        pcmanfm
        zip
        unzip
        pavucontrol
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
        devour
        spotify
        discord
    ];
}
