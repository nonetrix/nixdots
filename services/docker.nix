{...}: let
  global = import ../global-var.nix;
in {
  # Allows for containers
  virtualisation.docker = {
    enable = true;
  };
  # TODO: Maybe move this
  users.users.${global.username}.extraGroups = ["docker"];
}
