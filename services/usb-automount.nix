{ config, pkgs, ... }: {
  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
  };
}