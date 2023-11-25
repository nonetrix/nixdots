{ config, pkgs, ... }:
{
  services.pipewire = {
      enable = true;
      # Enable Pipewire audio support
      alsa.enable = true;
      # Enable 32Bit Alsa libs, this is needed for many Steam games
      alsa.support32Bit = true;
      pulse.enable = true;
    };
}
