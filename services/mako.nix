{
  config,
  pkgs,
  ...
}: {
  home-manager.users.noah = {
    # Catppuccin Mocha
    services.mako = {
      enable = true;
      defaultTimeout = 4000;
      backgroundColor = "#1e1e2e";
      textColor = "#cdd6f4";
      progressColor = "over #313244";
      borderColor = "#f5c2e7";
      margin = "20";
      anchor = "bottom-right";
    };
  };
}
