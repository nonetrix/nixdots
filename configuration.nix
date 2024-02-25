{
  config,
  pkgs,
  ...
}: let
  global = import ./global-var.nix;
in {
  home-manager.users.noah.home.stateVersion = "23.05";
  system.stateVersion = "24.05";

  imports = [
    ./hardware-configuration.nix
    ./terminal/zsh.nix
    ./terminal/nvim.nix
    ./terminal/unconfigured.nix
    ./terminal/newsboat.nix
    ./graphical/alacritty.nix
    ./graphical/wezterm.nix
    ./graphical/tk-themes/gtk.nix
    ./graphical/tk-themes/qt.nix
    ./graphical/tk-themes/themes.nix
    ./graphical/hyprland.nix
    ./graphical/waybar.nix
    ./graphical/fuzzel.nix
    ./graphical/fonts.nix
    ./graphical/virt-manager.nix
    ./graphical/unconfigured.nix
    ./graphical/mako.nix
    ./graphical/steam.nix
    ./graphical/wpaperd.nix
    ./amd-gpu.nix
    ./misc/udev.nix
    ./misc/ntp.nix
    ./misc/shell-scripts/edit.nix
    ./misc/shell-scripts/extract.nix
    ./misc/shell-scripts/satty-shot.nix
    ./misc/shell-scripts/sha256-from-url.nix
    ./misc/default-programs.nix
    ./services/pipewire.nix
    ./services/xorg.nix
    ./services/polkit.nix
    ./services/docker.nix
    ./services/xdg-portal.nix
    ./services/flatpak.nix
    ./services/usb-automount.nix
    ./services/bluetooth.nix
    ./services/keyring.nix
    ./lanuage-support/keyboard/mozc.nix
    ./programming-lang/rust.nix
    ./programming-lang/python.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = ["vt.default_red=30,243,166,249,137,245,148,186,88,243,166,249,137,245,148,166" "vt.default_grn=30,139,227,226,180,194,226,194,91,139,227,226,180,194,226,173" "vt.default_blu=46,168,161,175,250,231,213,222,112,168,161,175,250,231,213,200"];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

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

  users.users.${global.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "user";
    extraGroups = ["networkmanager" "wheel" "video" "audio"];
    packages = with pkgs; [];
  };

  networking.firewall.enable = false;

  nixpkgs.config.allowUnfree = true;

  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
