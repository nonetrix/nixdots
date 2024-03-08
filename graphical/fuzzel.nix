{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  environment.systemPackages = with pkgs; [
    fuzzel
    bemoji
  ];

  home-manager.users.${global.username} = {pkgs, ...}: {
    home.file.".config/fuzzel/fuzzel.ini".text = ''
      dpi-aware=no
      icon-theme=Papirus-Dark
      width=40
      font=JetBrainsMono Nerd Font:size=20
      line-height=20
      fields=name,generic,comment,categories,filename,keywords
      terminal=wezterm -e
      prompt="❯   "
      layer=overlay
      [colors]
      background=1e1e2ee6
      text=cdd6f4ff
      selection-text=181825ff
      selection=f5c2e7ff
      border=f5c2e7ff

      [border]
      radius=8

      [dmenu]
      exit-immediately-if-empty=yes
    '';
  };
}
