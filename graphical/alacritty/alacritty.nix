{ config, pkgs, ... }:
let
  # Import the global variables file
  global = import ../../global-var.nix;
in {
  imports = [
    # Import home manager https://github.com/nix-community/home-manager
    <home-manager/nixos>
  ];

  # Configuration for the user specified in the global-var file
  home-manager.users.${global.username} = { pkgs, ...}: {
    
    # Alacritty configuration
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };

          bold = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold";
          };

          italic = {
            family = "JetBrainsMono Nerd Font";
            style = "Italic";
          };

          bold_italic = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold Italic";
          };
        };

        # Catppuccin color scheme
        colors = {
          primary = {
             background = "#1E1E2E";
             foreground = "#CDD6F4";
             dim_foreground = "#CDD6F4";
             bright_foreground = "#CDD6F4";
          };

          cursor = {
            text = "#1E1E2E";
            cursor = "#F5E0DC";
          };

          vi_mode_cursor = {
            text = "#1E1E2E";
            cursor = "#B4BEFE";
          };

          search = {
            matches = {
              foreground = "#1E1E2E";
              background = "#A6ADC8";
            };

            focused_match = {
              foreground = "#1E1E2E";
              background = "#A6E3A1";
            };

            footer_bar = {
              foreground = "#1E1E2E";
              background = "#A6ADC8";
            };
          };

          hints = {
            start = {
              foreground = "#1E1E2E";
              background = "#F9E2AF";
            };

            end = {
              foreground = "#1E1E2E";
              background = "#A6ADC8";
            };
          };

          selection = {
            text = "#1E1E2E";
            background = "#F5E0DC";
          };

          normal = {
            black = "#45475A";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#BAC2DE";
          };

          bright = {
            black = "#585B70";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#A6ADC8";
          };

          dim = {
            black = "#45475A";
            red = "#F38BA8";
            green = "#A6E3A1";
            yellow = "#F9E2AF";
            blue = "#89B4FA";
            magenta = "#F5C2E7";
            cyan = "#94E2D5";
            white = "#BAC2DE";
          };
        };
      };
    };
  };
}