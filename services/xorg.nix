{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  home-manager.users.${global.username} = {pkgs, ...}: {
    home.file.".icons/default".source = "${pkgs.catppuccin-cursors.mochaDark}/share/icons/Catppuccin-Mocha-Dark-Cursors";
  };
}
