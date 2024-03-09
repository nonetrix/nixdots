{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}: {
    programs.newsboat = {
      enable = true;
      urls = [
        {
          # Tries to show news from both political extremes
          url = "https://www.allsides.com/news/rss";
        }
        {
          # Lukesmith blog, will he ever return?
          url = "https://lukesmith.xyz/index.xml";
        }
        {
          # Linux news
          url = "https://www.phoronix.com/rss.php";
        }
        {
          # Gaming news ig
          url = "https://www.dexerto.com/feed";
        }
        {
          # Anime related news
          url = "https://nichegamer.com/feed/";
        }
      ];
    };
  };
}
