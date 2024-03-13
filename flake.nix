# flake.nix
{
  inputs = {
    # TODO: Try to move to stable version someday if packages not being packaged are not issue in future
    # Main package repo unstable verrsion
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Allows for changing user configs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # The main Wayland compositor
    # Remove the commit ID once the following issues are resolved
    # 1. https://github.com/wez/wezterm/issues/5103
    # 2. https://github.com/Duckonaut/split-monitor-workspaces/pull/54
    hyprland.url = "github:hyprwm/Hyprland/af0c8e299bbbf1726cecfde683137cfd4a6b8642";

    # This allows for workspaces to be split with multiple monitors, often breaks with Hyprland updates
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };

    # Extra packages not in Nixpkgs
    nur.url = "github:nix-community/NUR";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          # Allows for home manager to be used
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
            };
          }
        ];
      };
    };
  };
}
