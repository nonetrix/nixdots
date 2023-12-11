{
  config,
  pkgs,
  lib,
  ...
}: let
  # Import the global variables file
  global = import ../global-var.nix;
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in {
  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = {
    pkgs,
    libs,
    ...
  }: {
    # imports = lib.attrValues nur-no-pkgs.repos.moredhel.hmModules.rawModules;
    programs.firefox = {
      enable = true;
      # extensions =
      # with pkgs.nur.repos.rycee.firefox-addons; [
      #   ublock-origin
      #   # "10ten-ja-reader"
      #   fastforward
      #   return-youtube-dislikes
      #   search-by-image
      #   sponsorblock
      #   stylus
      #   darkreader
      #   violentmonkey
      #   firefox-translations
      # ];
    };
  };
}
