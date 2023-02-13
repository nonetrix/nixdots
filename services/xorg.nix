{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xorg.xkill
    xwallpaper
    unclutter
  ];

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