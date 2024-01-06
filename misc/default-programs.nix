{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
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
        "text/html" = ["Vivaldi.desktop"];
        "x-scheme-handler/https" = ["Vivaldi.desktop"];
        "x-scheme-handler/http" = ["Vivaldi.desktop"];
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
        "inode/directory" = ["nemo.desktop"];
        "text/plain" = ["nvim.desktop"];
      };
    };
  };
}
