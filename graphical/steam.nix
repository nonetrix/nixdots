{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  # Old Source engine game, be sure to run older Source games with LD_PRELOAD="/usr/lib32/libtcmalloc_minimal.so:$LD_PRELOAD" %command%
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({extraLibraries ? pkgs': [], ...}: {
        extraLibraries = pkgs':
          (extraLibraries pkgs')
          ++ [
            pkgs'.gperftools
          ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    steam
  ];
}
