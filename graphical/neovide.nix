{pkgs, ...}: let
  global = import ../global-var.nix;
in {
  environment.systemPackages = with pkgs; [
    neovide
  ];

  home-manager.users.${global.username} = {...}: {
    home.file.".config/neovide/config.toml".text = ''
      [font]
      normal = ["JetBrainsMono Nerd Font"]
      size = 18
    '';
  };
}
