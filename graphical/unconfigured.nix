{ config, pkgs, ... }:
{
    nixpkgs.config.joypixels.acceptLicense = true;

    environment.systemPackages = with pkgs; [
        vscodium
        pcmanfm
        #qt5ct
        pavucontrol
        librewolf
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