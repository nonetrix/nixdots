{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      python311
    ];
}
