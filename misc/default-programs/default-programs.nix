# This file is just for refrence, you can safely ignore this file as it has no effect on the system

{ config, pkgs, ... }:
let
  global = import ../../global-var.nix;
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
            "video/" = ["vlc.desktop"];
            "audio/" = ["vlc.desktop"];
        };
    };
    
  };
}