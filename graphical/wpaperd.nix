{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}: {
    # Source: https://twitter.com/ValeforZero/status/1738398453766721944
    home.file."Pictures/Wallpapers/wallpaper1.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/95/33/9533adb9d62b65b34c592ffe9d687bca.jpg";
        sha256 = "0x8yamz5vp7zj96cwb5fz00ln91n3xkdz2r8hvzx5bszwy14gsy1";
      };
    };

    # Pipkin Pippa

    # Source: https://twitter.com/Nemurikomeru/status/1609439286268661760
    home.file."Pictures/Wallpapers/wallpaper2.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/a4/08/a408cf27ce72a35725b08435bb03c95d.jpg";
        sha256 = "ed34015f83bf8de99a7925d00ad9ae24076b9cf9e2e6f176756db145f566129a";
      };
    };

    # Source: https://twitter.com/Shrugzilla/status/1660978942084362240
    home.file."Pictures/Wallpapers/wallpaper3.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/ec/f7/ecf7126c52fa3a6bc5554c90e7524a6d.jpg";
        sha256 = "f67834951d77026bbc0fbe20153a3be87caf9ddd2ac59982cd5e3f4ebaef2409";
      };
    };

    # Source: https://twitter.com/notdogface750rp/status/1577253806277947392
    home.file."Pictures/Wallpapers/wallpaper4.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/b6/29/b629d07b5539211fab7e7e7032742e25.jpg";
        sha256 = "b7d27a94bb5d53b512de6e584d49ee51ef33efbd06a529ea557b91310edd8855";
      };
    };

    # Source: https://twitter.com/hassaku401/status/1608408180073304067
    home.file."Pictures/Wallpapers/wallpaper5.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/e9/ee/e9ee5b76c537894b48665bb0adb23dde.jpg";
        sha256 = "55c54dcbc898680cf1ea8bea4d816f8073bd3d8071ed9f64bea3b2a80b69fba3";
      };
    };

    # Coni Confetti

    # Source: https://www.pixiv.net/artworks/109224861
    home.file."Pictures/Wallpapers/wallpaper6.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/40/f8/40f8318448023ee02319efa6da56a638.jpg";
        sha256 = "daf8432c85d95fd6421ef406f9c6320c69265bbb32b7c69e01b615340a3cdcc7";
      };
    };

    # Hatsune Miku

    # Source: https://www.pixiv.net/en/artworks/76922689
    home.file."Pictures/Wallpapers/wallpaper7.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/e0/30/e030445ab80ff93540d5517df943a18d.jpg";
        sha256 = "ee8f317fb3bb84f4b526bbe14ea3e2663bdee0cf5c5d3410a1ff793971714acf";
      };
    };

    # Source: https://twitter.com/S2_Datsha/status/1528628623326191616
    home.file."Pictures/Wallpapers/wallpaper8.jpg" = {
      source = builtins.fetchurl {
        url = "https://img3.gelbooru.com/images/72/45/7245ee1fe3ac8b10b37132723f3a645d.jpg";
        sha256 = "803ccb783486f0403015b9570d5c706f2c324598d79752b52e32318f743c76ea";
      };
    };

    home.file.".config/wpaperd/wallpaper.toml".text = ''
      [default]
      path = "/home/${global.username}/Pictures/Wallpapers/"
      duration = "30m"
      sorting = "random"
    '';
  };
}
