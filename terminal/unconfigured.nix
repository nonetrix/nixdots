{ config, pkgs, ... }:
{
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
        prismlauncher
        steam
        distrobox
        vulkan-tools
        realesrgan-ncnn-vulkan
        ani-cli
        udisks
    ];
}
