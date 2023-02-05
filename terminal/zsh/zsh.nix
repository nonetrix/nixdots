{ config, pkgs, ... }:
let
  # Import the global variables file
  global = import ../../global-var.nix;
in {
  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = { pkgs, ...}: {
    # Version this file was written in
    home.stateVersion = "22.11";
    programs.zsh = {
      enable = true;
      initExtraFirst = "neofetch"; 
      enableSyntaxHighlighting = true;
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
        ];
      };
    };
  };
}


#  home-manager.users.${username} = { pkgs, ...}: {
#   home.stateVersion = "22.11";

#   programs.zsh = {
#     enable = true;
#     initExtraFirst = "neofetch"; 
#     enableSyntaxHighlighting = true;
#     zplug = {
#         enable = true;
#         plugins = [
#           { name = "zsh-users/zsh-autosuggestions"; }
#         ];
#     };
#   };
# };