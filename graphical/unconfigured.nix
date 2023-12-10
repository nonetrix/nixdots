{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        cinnamon.nemo
        pavucontrol
        ungoogled-chromium
        anki-bin
        freetube
        zathura
        imv
        mpv
        libsForQt5.ark
        yt-dlp
        ffmpeg
        steam
        prismlauncher
        swww
        wofi
        obs-studio
        krita
        spotify
        kdenlive
        blender
        libreoffice
        livecaptions
        gamescope
    ];
}
