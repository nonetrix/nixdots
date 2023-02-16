# This file is just for refrence, you can safely ignore this file as it has no effect on the system

{ config, pkgs, ... }:
let
  global = import ../global-var.nix;
in {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${global.username} = { pkgs, ...}: {
    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "application/pdf" = ["org.pwmt.zathura.desktop"];
            "text/html" = ["firefox.desktop"];
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
            "image/webp" = ["imv.desktop"];
            "image/avif" = ["imv.desktop"];
            "image/svg" = ["imv.desktop"];
        };
    };
  };
}