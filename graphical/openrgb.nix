{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    openrgb
  ];
}
