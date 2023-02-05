{ config, pkgs, ... }:
let
  global = import ./global-var.nix;
in {
  services = {
    # XOrg configuration
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      windowManager.i3 = {
        enable = true;
      };
    };
  };
}