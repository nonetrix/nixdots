{
  config,
  pkgs,
  ...
}: let
  # Import the global variables file
  global = import ../global-var.nix;
in {
  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = {pkgs, ...}: {
    programs.newsboat = {
      enable = true;
      programs.newsboat.urls = [
        "https://www.allsides.com/news/rss"
        "https://lukesmith.xyz/index.xml"
        "https://www.phoronix.com/rss.php"
      ];
    };
  };
}
