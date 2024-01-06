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
          url = "https://www.allsides.com/news/rss";
        }
        {
          url = "https://lukesmith.xyz/index.xml";
        }
        {
          url = "https://www.phoronix.com/rss.php";
        }
        {
          url = "https://www.dexerto.com/feed";
        }
        {
          url = "https://nichegamer.com/feed/";
        }
      ];
    };
  };
}
