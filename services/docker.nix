{ config, pkgs, ... }:
let
  global = import ../global-var.nix;
in {
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
  users.users.${global.username}.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    nvidia-docker
  ];
}