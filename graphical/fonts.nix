{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-extra
      noto-fonts-cjk-sans # Chinese, Japanese, Korean fonts
      noto-fonts-cjk-serif
      (nerdfonts.override {fonts = ["JetBrainsMono"];}) # Nerdfonts adds nice symbols
      noto-fonts-emoji
    ];

    # Should help some aplications find fonts
    fontDir.enable = true;
    fontconfig.hinting.style = "medium";
    fontconfig.subpixel.rgba = "rgb";
  };
}
