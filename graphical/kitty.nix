{...}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {...}: {
    programs.kitty = {
      enable = true;
      font.name = "JetBrainsMono Nerd Font";
      theme = "Catppuccin-Mocha";
      extraConfig = ''
        background_opacity 0.9
      '';
    };
  };
}
