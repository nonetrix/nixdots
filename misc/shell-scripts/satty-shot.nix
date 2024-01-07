{ pkgs, ... }:

let
  satty-shot = pkgs.writeShellScriptBin "satty-shot" ''
    grim -g "$(slurp -o -r -c '#ff0000ff')" - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png
  '';

in {
  environment.systemPackages = [ satty-shot ];
}

