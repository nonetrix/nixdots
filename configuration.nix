{
  config,
  pkgs,
  ...
}: let
  global = import ./global-var.nix;
in {
  home-manager.users.noah.home.stateVersion = "23.05";
  system.stateVersion = "25.05";

  imports = [
    ./hardware-configuration.nix
    ./terminal/zsh.nix
    ./terminal/neofetch/neofetch.nix
    ./terminal/nvim.nix
    ./terminal/unconfigured.nix
    ./terminal/newsboat.nix
    ./terminal/bat.nix
    ./graphical/kitty.nix
    ./graphical/tk-themes/gtk.nix
    ./graphical/tk-themes/qt.nix
    ./graphical/hyprland.nix
    ./graphical/waybar.nix
    ./graphical/fuzzel.nix
    ./graphical/fonts.nix
    ./graphical/virt-manager.nix
    ./graphical/unconfigured.nix
    ./graphical/steam.nix
    ./graphical/wpaperd.nix
    ./amd-gpu.nix
    ./misc/udev.nix
    ./misc/ntp.nix
    ./misc/shell-scripts/edit.nix
    ./misc/shell-scripts/extract.nix
    ./misc/shell-scripts/satty-shot.nix
    ./misc/shell-scripts/sha256-from-url.nix
    ./misc/shell-scripts/llm-actions.nix
    ./misc/default-programs.nix
    ./misc/kernel.nix
    ./services/ollama.nix
    ./services/pipewire.nix
    ./services/greetd.nix
    ./services/polkit.nix
    ./services/docker.nix
    ./services/xdg-portal.nix
    #./services/flatpak.nix
    ./services/bluetooth.nix
    ./services/keyring.nix
    ./services/sshd.nix
    ./services/mako.nix
    ./language-support/keyboard/mozc.nix
  ];

  # TODO: Figure out how the fuck to switch to Grub, systemd-boot is ass. Also, I might be using BIOS? God I fucking hate BIOS and UEFI boot shit kill me now
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Does Nixpkgs even test builds? Shit constantly breaking
  #nix.settings.system-features = [ "benchmark" "big-parallel" "kvm" "nixos-test" "gccarch-znver2" ];

  #nixpkgs.hostPlatform = {
  #  gcc.arch = "znver2";
  #  gcc.tune = "znver2";
  #  system = "x86_64-linux";
  #};

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = false; # Fixes not being able to connect from my phone, maybe not ideal
  };

  time.timeZone = "America/Chicago";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
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
  };

  users.users.${global.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "user";
    extraGroups = ["networkmanager" "wheel" "video" "audio"];
  };

  # Allows closed source software
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };

    # Collect garbage
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 4d";
    };
  };
}
