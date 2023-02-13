{ config, pkgs, ... }:
let
  # Import the global variables file
  global = import ../global-var.nix;
in {
  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = { pkgs, ...}: {
    
    # Picom configuration
    services.picom = {
      enable = true;
      vSync = true;
      shadow = true;
      fade = true; 
      # Use the OpenGL backend
      backend = "glx";
    };
  };
}