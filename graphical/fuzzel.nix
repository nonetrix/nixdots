{pkgs, ...}: let
  global = import ../global-var.nix;
in {
  environment.systemPackages = with pkgs; [
    fuzzel
    bemoji # Emoji menu
  ];

  home-manager.users.${global.username} = {...}: {
    # Catppuccin Mocha Pink theme
    home.file.".config/fuzzel/fuzzel.ini".text = ''
      dpi-aware=no
      icon-theme=Papirus-Dark
      width=40
      font=JetBrainsMono Nerd Font:size=20
      line-height=20
      fields=name,generic,comment,categories,filename,keywords
      terminal=kitty -e
      prompt="❯   "
      layer=overlay
      [colors]
      background=1e1e2ee6
      text=cdd6f4ff
      selection-text=181825ff
      selection=74c7ecff
      border=74c7ecff

      [border]
      radius=8

      [dmenu]
      exit-immediately-if-empty=yes
    '';
  };
}
