#  ________         __                                 __         
# |  |  |  |.-----.|  |.----.-----.--------.-----.    |  |_.-----.
# |  |  |  ||  -__||  ||  __|  _  |        |  -__|    |   _|  _  |
# |________||_____||__||____|_____|__|__|__|_____|    |____|_____|
#                                                               
#                          ___ __ __                              
# .--------.--.--.       .'  _|__|  |.-----.-----.                
# |        |  |  |     __|   _|  |  ||  -__|__ --|                
# |__|__|__|___  |    |__|__| |__|__||_____|_____|                
#          |_____|                                                

{ config, pkgs, ... }:
let
  # Import the global variables file
  global = import ./global-var.nix;
in {
  imports =
    [
      # Import home manager https://github.com/nix-community/home-manager
      <home-manager/nixos>
      ./hardware-configuration.nix
      ./terminal/zsh/zsh.nix
      ./terminal/starship/starship.nix
      ./graphical/alacritty/alacritty.nix
      ./graphical/gtk/gtk.nix
      ./graphical/i3/i3.nix
      ./graphical/picom/picom.nix
      ./graphical/qt/qt.nix
      ./misc/hosts/hosts.nix
      ./services/pipewire/pipewire.nix
      ./services/xorg/xorg.nix
    ];

  # Enable boot loader and set boot mount point
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "America/Chicago";

  # Set default locale
  i18n.defaultLocale = "en_US.UTF-8";

  # Set extra locale settings
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };  

  # Create user with the name specified in the global-var file with Zsh shell, additional groups and no packages
  users.users.${global.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    packages = with pkgs; [];
  };

  # Allow installing packages that are not free
  nixpkgs.config.allowUnfree = true;

  # List of system packages to be installed
  environment.systemPackages = with pkgs; [
     wget
     fzf
     git
     bottom
     firefox
     flameshot
     neofetch
     tree
     alsa-utils
     playerctl
     pavucontrol
     dconf
     xwallpaper
     xorg.xkill
     killall
     xdg-user-dirs
     qt5ct
     libsForQt5.breeze-qt5
     libsForQt5.dolphin
     papirus-icon-theme
     vscodium
  ];

  # The version this configuration was made in
  system.stateVersion = "22.11"; 
}
