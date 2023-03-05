{ config, pkgs, ... }:
let
  global = import ../global-var.nix;
in {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${global.username} = { pkgs, ...}: {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        vscodevim.vim
        tamasfe.even-better-toml
        jnoortheen.nix-ide
        matklad.rust-analyzer
      ];

      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
      };
    };
  };
}
