{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    zip
    unzip
    skim
    tree
    btop
    nvtop-amd
    gamemode
    wget
    git
    alsa-utils
    playerctl
    dconf
    cava
    killall
    xdg-user-dirs
    usbutils
    pfetch
    neofetch
    unimatrix
    bat
    lsd
    ripgrep
    prismlauncher
    distrobox
    vulkan-tools
    #realesrgan-ncnn-vulkan
    ani-cli
    udisks
    trashy
    alejandra
    wl-clipboard
    wl-clip-persist
    bc
    ncdu
    tor
    i2p
    steam-run
    yazi
    ueberzugpp
    hexyl
    yt-dlp
    ffmpeg
    git-lfs
  ];
}
