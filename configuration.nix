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
{
  config,
  pkgs,
  ...
}: let
  # Import the global variables file
  global = import ./global-var.nix;
in {
  # The version this configuration was made in
  home-manager.users.noah.home.stateVersion = "23.05";
  system.stateVersion = "24.05";

  imports = [
    ./hardware-configuration.nix
    ./terminal/zsh.nix
    ./terminal/nvim.nix
    ./terminal/unconfigured.nix
    ./graphical/alacritty.nix
    ./graphical/tk-themes/gtk.nix
    ./graphical/tk-themes/qt.nix
    ./graphical/tk-themes/themes.nix
    ./graphical/hyprland.nix
    ./graphical/wofi.nix
    ./graphical/fonts.nix
    ./graphical/codium.nix
    ./graphical/virt-manager.nix
    ./graphical/openrgb.nix
    ./graphical/unconfigured.nix
    ./graphical/firefox.nix
    ./graphical/mako.nix
    ./amd-gpu.nix
    #./misc/hosts.nix
    ./misc/udev.nix
    ./misc/ntp.nix
    ./misc/default-programs.nix
    ./services/pipewire.nix
    ./services/xorg.nix
    ./services/polkit.nix
    ./services/docker.nix
    ./services/xdg-portal.nix
    ./services/flatpak.nix
    ./services/usb-automount.nix
    ./services/waydroid.nix
    ./lanuage-support/keyboard/mozc.nix
    ./programming-lang/rust.nix
    ./programming-lang/python.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable boot loader and set boot mount point
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/EFI";

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
    extraGroups = ["networkmanager" "wheel" "video" "audio"];
    packages = with pkgs; [];
  };

  # Allow installing packages that are not free
  nixpkgs.config.allowUnfree = true;

  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
