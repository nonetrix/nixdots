{ config, pkgs, ... }:
let
  global = import ../global-var.nix;
in {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  users.users.${global.username}.extraGroups = [ "docker" ];
}