{ config, pkgs, ... }:
{
    nixpkgs.config.joypixels.acceptLicense = true;

    fonts.fonts = with pkgs; [
        noto-fonts
        noto-fonts-extra
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        # Note this font is propritery, however it's just a font ¯\_(ツ)_/¯
        joypixels
    ];
}