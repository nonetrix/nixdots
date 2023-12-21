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
      urls = [
        {
          url = "https://www.allsides.com/news/rss";
        }
        {
          url = "https://lukesmith.xyz/index.xml";
        }
        {
          url = "https://www.phoronix.com/rss.php";
        }
      ];
    };
  };
}
