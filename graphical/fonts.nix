{ config, pkgs, ... }:
{
    fonts.fonts = with pkgs; [
        noto-fonts
        noto-fonts-extra
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        noto-fonts-emoji
    ];

    fonts.fontDir.enable = true;
}
