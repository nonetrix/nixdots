{
  config,
  pkgs,
  ...
}: {
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
    hyprshot
    mangohud
    # Firefox, America: :/
    # Firefox, Japan: HOLY SHIT :OOOOO
    floorp
    heroic
  ];
}
