{
  config,
  pkgs,
  lib,
  nur,
  ...
}: let
  # Import the global variables file
  global = import ../global-var.nix;
in {
  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = {
    pkgs,
    libs,
    #nur,
    ...
  }: {
    #imports = lib.attrValues nur-no-pkgs.repos.moredhel.hmModules.rawModules;
    programs.firefox = {
      enable = true;
      #profiles.default.extensions =
      #with pkgs.nur.repos.rycee.firefox-addons; [
      #ublock-origin
      #"10ten-ja-reader"
      #fastforward
      #return-youtube-dislikes
      #search-by-image
      #sponsorblock
      #stylus
      #violentmonkey
      #];
    };
  };
}
