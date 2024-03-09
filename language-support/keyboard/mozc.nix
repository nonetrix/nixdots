{
  config,
  pkgs,
  lib,
  ...
}: {
  i18n.inputMethod = {
    # Allows for Japanese, Chinese, and Korean input
    enabled = "fcitx5";

    fcitx5 = {
      # Makes it use Wayland APIs instead of XOrg ones
      waylandFrontend = true;

      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk # Adds GTK support
        libsForQt5.fcitx5-qt # Adds QT support
      ];
    };
  };
}
