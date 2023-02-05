{ config, pkgs, ... }:
{
  # Host file configuration
  networking.extraHosts = let
    # Download AdBlocker hosts file at https://github.com/StevenBlack/hosts with adware + malware + gambling
    hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling/hosts;
    hostsFile = builtins.fetchurl hostsPath;
  in builtins.readFile "${hostsFile}";
}