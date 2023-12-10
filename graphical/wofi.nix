{ config, pkgs, ... }:
{
    #TODO: make this look nice
    environment.systemPackages = with pkgs; [
        wofi
        wofi-emoji
        wtype
    ];
}
