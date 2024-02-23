{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  # Not sure why this works and seems hacky, might be missing something?
  systemd.user.services.plasma-dolphin = {
    unitConfig = {
      Description = "Dolphin file manager";
      PartOf = ["graphical-session.target"];
    };
    path = ["/run/current-system/sw"];
    environment = {
      # don't add this if you are not wayland
      QT_QPA_PLATFORM = "wayland";
    };
    serviceConfig = {
      Type = "dbus";
      BusName = "org.freedesktop.FileManager1";
      ExecStart = "${pkgs.dolphin}/bin/dolphin";
    };
  };

  # Dear god why
  environment.systemPackages = with pkgs; [
    xdg-terminal-exec
  ];

  home-manager.users.${global.username} = {pkgs, ...}: {
    home.file.".config/xdg-terminals.list".text = ''
      Alacritty.desktop
    '';

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = ["org.pwmt.zathura.desktop"];
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-terminal-emulator" = ["Alacritty.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/webm" = ["mpv.desktop"];
        "video/avi" = ["mpv.desktop"];
        "video/flv" = ["mpv.desktop"];
        "video/mov" = ["mpv.desktop"];
        "video/m4v" = ["mpv.desktop"];
        "audio/mp3" = ["mpv.desktop"];
        "audio/opus" = ["mpv.desktop"];
        "audio/ogg" = ["mpv.desktop"];
        "audio/wav" = ["mpv.desktop"];
        "audio/m4a" = ["mpv.desktop"];
        "image/png" = ["imv.desktop"];
        "image/jpg" = ["imv.desktop"];
        "image/jpeg" = ["imv.desktop"];
        "image/webp" = ["imv.desktop"];
        "image/avif" = ["imv.desktop"];
        "image/svg" = ["imv.desktop"];
        "image/gif" = ["imv.desktop"];
        "inode/directory" = ["org.kde.dolphin.desktop"];
        "text/plain" = ["nvim.desktop"];
        "application/zip" = ["org.kde.ark.desktop"];
        "application/x-7z-compressed" = ["org.kde.ark.desktop"];
        "application/x-tar" = ["org.kde.ark.desktop"];
        "application/vnd.rar" = ["org.kde.ark.desktop"];
        "application/x-bzip2" = ["org.kde.ark.desktop"];
        "application/x-bzip" = ["org.kde.ark.desktop"];
      };
    };
  };
}
