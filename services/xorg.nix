{ config, pkgs, ... }:
let 
  # Import the global variables file
  global = import ../global-var.nix;

in {
  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    xorg.xkill
    xwallpaper
    unclutter
  ];

  services = {
    # XOrg configuration
    xserver = {
      displayManager.lightdm.greeters.gtk = {
        enable = true;
        theme = {
          name = "Catppuccin-Pink-Dark";
          package = pkgs.catppuccin-gtk;
        };
      };
      enable = true;
      layout = "us";
      xkbVariant = "";
      windowManager.i3 = {
        enable = true;
      };
    };
  };
  home-manager.users.${global.username} = { pkgs, ...}: {
    home.file.".icons/default".source = "${pkgs.catppuccin-cursors.mochaPink}/share/icons/Catppuccin-Mocha-Pink-Cursors";
  };
}