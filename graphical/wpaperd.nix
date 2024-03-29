{...}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {...}: {
    # Source: https://twitter.com/ValeforZero/status/1738398453766721944
    home.file = {
      "Pictures/Wallpapers/wallpaper1.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/95/33/9533adb9d62b65b34c592ffe9d687bca.jpg";
          sha256 = "0x8yamz5vp7zj96cwb5fz00ln91n3xkdz2r8hvzx5bszwy14gsy1";
        };
      };

      # Pipkin Pippa

      # Source: https://twitter.com/Nemurikomeru/status/1609439286268661760
      "Pictures/Wallpapers/wallpaper2.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/a4/08/a408cf27ce72a35725b08435bb03c95d.jpg";
          sha256 = "ed34015f83bf8de99a7925d00ad9ae24076b9cf9e2e6f176756db145f566129a";
        };
      };

      # Source: https://twitter.com/Shrugzilla/status/1660978942084362240
      "Pictures/Wallpapers/wallpaper3.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/ec/f7/ecf7126c52fa3a6bc5554c90e7524a6d.jpg";
          sha256 = "f67834951d77026bbc0fbe20153a3be87caf9ddd2ac59982cd5e3f4ebaef2409";
        };
      };

      # Source: https://twitter.com/notdogface750rp/status/1577253806277947392
      "Pictures/Wallpapers/wallpaper4.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/b6/29/b629d07b5539211fab7e7e7032742e25.jpg";
          sha256 = "b7d27a94bb5d53b512de6e584d49ee51ef33efbd06a529ea557b91310edd8855";
        };
      };

      # Source: https://twitter.com/hassaku401/status/1608408180073304067
      "Pictures/Wallpapers/wallpaper5.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/e9/ee/e9ee5b76c537894b48665bb0adb23dde.jpg";
          sha256 = "55c54dcbc898680cf1ea8bea4d816f8073bd3d8071ed9f64bea3b2a80b69fba3";
        };
      };

      # Coni Confetti

      # Source: https://www.pixiv.net/artworks/109224861
      "Pictures/Wallpapers/wallpaper6.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/40/f8/40f8318448023ee02319efa6da56a638.jpg";
          sha256 = "daf8432c85d95fd6421ef406f9c6320c69265bbb32b7c69e01b615340a3cdcc7";
        };
      };

      # Hatsune Miku

      # Source: https://www.pixiv.net/en/artworks/76922689
      "Pictures/Wallpapers/wallpaper7.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/e0/30/e030445ab80ff93540d5517df943a18d.jpg";
          sha256 = "ee8f317fb3bb84f4b526bbe14ea3e2663bdee0cf5c5d3410a1ff793971714acf";
        };
      };

      # Source: https://twitter.com/S2_Datsha/status/1528628623326191616
      "Pictures/Wallpapers/wallpaper8.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/72/45/7245ee1fe3ac8b10b37132723f3a645d.jpg";
          sha256 = "803ccb783486f0403015b9570d5c706f2c324598d79752b52e32318f743c76ea";
        };
      };

      # Hyprland

      # Source: https://hyprland.org/news/contestWinners/
      "Pictures/Wallpapers/wallpaper9.png" = {
        source = builtins.fetchurl {
          url = "https://hyprland.org/imgs/blog/contestWinners/Kath.png";
          sha256 = "97bb1fed9b9e1b71fd8e814aec1bab71ddf5fbc6ffbd6a09c2d70b0881f8132e";
        };
      };

      # Source: https://hyprland.org/news/contestWinners/
      "Pictures/Wallpapers/wallpaper10.png" = {
        source = builtins.fetchurl {
          url = "https://hyprland.org/imgs/blog/contestWinners/corndog.png";
          sha256 = "31480b656e068192c72d852f3a678a9a1236ecc25e4fa225e1d637e390ca82e5";
        };
      };

      # Source: https://hyprland.org/news/contestWinners/
      "Pictures/Wallpapers/wallpaper11.png" = {
        source = builtins.fetchurl {
          url = "https://hyprland.org/imgs/blog/contestWinners/Meptl.png";
          sha256 = "b4a9c59e5266f87f1a95b885fa6ff97d220249d2da63e5bd58b1cc79e05e7e6c";
        };
      };

      # Source: https://hyprland.org/news/contestWinners/
      "Pictures/Wallpapers/wallpaper12.png" = {
        source = builtins.fetchurl {
          url = "https://hyprland.org/imgs/blog/contestWinners/srev.png";
          sha256 = "8cd6046db700e6d20b7915da00163115d1e205119e1e136a695ab8bfcb0616b1";
        };
      };

      # Source: https://hyprland.org/news/contestWinners/
      "Pictures/Wallpapers/wallpaper13.png" = {
        source = builtins.fetchurl {
          url = "https://hyprland.org/imgs/blog/contestWinners/VDawg.png";
          sha256 = "5cdcbb447ecee6359610eab57ff6b7e4f0ca19f5db4c64a6e5b62f2f5a3a3d8f";
        };
      };

      # Kiki
      # Cry about it Niccolò Vé

      # Source: https://krita.org/en/about/mascot/
      # Source: https://web.archive.org/web/20240315033826/https://krita.org/en/about/mascot/

      "Pictures/Wallpapers/wallpaper14.png" = {
        source = builtins.fetchurl {
          url = "cdn.kde.org/krita/marketing/kiki/electrichearts_20201224A_kiki_c1.png";
          sha256 = "054lvm1cm40ygw78xqd4abqkf75r3i68qxhnm81kakc5fbgzpfsw";
        };
      };

      "Pictures/Wallpapers/wallpaper15.png" = {
        source = builtins.fetchurl {
          url = "https://cdn.kde.org/krita/marketing/kiki/mascot_20150812_kiki_scott_cover_f.png";
          sha256 = "0x0bfnzxd63w2g35q7rckx52g45mvjw8xkrzsxwrr4rqnwfanrqb";
        };
      };

      "Pictures/Wallpapers/wallpaper16.png" = {
        source = builtins.fetchurl {
          url = "https://cdn.kde.org/krita/marketing/kiki/electrichearts_20200221A_kiki_b.png";
          sha256 = "1ivy6pxkrbx7anagkwmxmqvmqlqmpm25y9ydz2zi5r9kdv2xinad";
        };
      };

      "Pictures/Wallpapers/wallpaper17.png" = {
        source = builtins.fetchurl {
          url = "https://cdn.kde.org/krita/marketing/kiki/electrichearts_20171205_kiki_c.png";
          sha256 = "0ppxlvyr62fpg9jvhxk74xgg25i6xa3pbc79dzacj04f9pxnbfgh";
        };
      };

      "Pictures/Wallpapers/wallpaper18.png" = {
        source = builtins.fetchurl {
          url = "https://cdn.kde.org/krita/marketing/kiki/electrichearts_20160517_20160820_kiki_02.png";
          sha256 = "1ywid05jshriv6d4jwg9w0c18smx87nixwy1v4lvkykga4q2v7bb";
        };
      };

      # Astolfo

      # Source: https://gelbooru.com/index.php?page=post&s=view&id=7824618&tags=astolfo_%28fate%29+rating%3Ageneral
      "Pictures/Wallpapers/wallpaper19.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/96/41/964105d020a4a7b6c0599cfbaeb6ccb4.jpg";
          sha256 = "8f36facb2ea3e4efe8aca4e7b00f8a133d1367e5cefc1a5b71624dae7c3860d0";
        };
      };

      # Source: https://gelbooru.com/index.php?page=post&s=view&id=7854963&tags=astolfo_%28fate%29+rating%3Ageneral
      "Pictures/Wallpapers/wallpaper20.jpg" = {
        source = builtins.fetchurl {
          url = "https://img3.gelbooru.com/images/9f/0c/9f0c0c1990da1501417754cd10322597.jpg";
          sha256 = "474bd3393d945133764bce46d7f9fc6aeb0574bde5408beb06248645031e01a8";
        };
      };

      ".config/wpaperd/wallpaper.toml".text = ''
        [default]
        path = "/home/${global.username}/Pictures/Wallpapers/"
        duration = "30m"
        sorting = "random"
      '';
    };
  };
}
