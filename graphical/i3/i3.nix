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
    # Version this file was written in
    home.stateVersion = "22.11";
    
    xsession.windowManager.i3 = {
      enable = true;
      # i3 Configuration
      config = {
      # Bar Configuration
      bars = [
        {
          position = "top";
          # Bar colors
          colors = {
            background = "#1e1e2e";
            statusline = "#cdd6f4";
            focusedWorkspace = {
              border = "#b4befe";
              background = "#f5c2e7";
              text = "#1e1e2e";
            };
            activeWorkspace = {
              border = "#b4befe";
              background = "#5f676a";
              text = "#cdd6f4";
            };
            inactiveWorkspace = {
              border = "#6c7086";
              background = "#302d41";
              text = "#cdd6f4";
            };
            urgentWorkspace = {
              border = "#eba0ac";
              background = "#fab387";
              text = "#1e1e2e";
            };
          };
        }
      ];

      startup = [
        {
          command = "flameshot";
          always = true;
          notification = false;
        }
        {
          command = "xwallpaper --zoom ~/Pictures/Wallpapers/$(ls ~/Pictures/Wallpapers | shuf -n 1)";
          always = true;
          notification = false;
        }
        {
          command = "xdg-user-dirs-update";
          always = true;
          notification = false;
        }
      ];

        keybindings = {
          # Bindings to start various programs
          "${global.mod}+Return" = "exec alacritty";
          "${global.mod}+b" = "exec firefox";
          "Print" = "exec flameshot gui";

          # Window movement keys
          "${global.mod}+h" = "focus left";
          "${global.mod}+j" = "focus down";
          "${global.mod}+k" = "focus up";
          "${global.mod}+l" = "focus right";

          "${global.mod}+Shift+h" = "move left";
          "${global.mod}+Shift+j" = "move down";
          "${global.mod}+Shift+k" = "move up";
          "${global.mod}+Shift+l" = "move right";

          # Task managment
          "${global.mod}+c" = "kill";

          # Workspace movment keys
          "${global.mod}+1" = "workspace number 1";
          "${global.mod}+2" = "workspace number 2";
          "${global.mod}+3" = "workspace number 3";
          "${global.mod}+4" = "workspace number 4";
          "${global.mod}+5" = "workspace number 5";
          "${global.mod}+6" = "workspace number 6";
          "${global.mod}+7" = "workspace number 7";
          "${global.mod}+8" = "workspace number 8";
          "${global.mod}+9" = "workspace number 9";
          "${global.mod}+0" = "workspace number 10";

          "${global.mod}+Shift+1" =
            "move container to workspace number 1";
          "${global.mod}+Shift+2" =
            "move container to workspace number 2";
          "${global.mod}+Shift+3" =
            "move container to workspace number 3";
          "${global.mod}+Shift+4" =
            "move container to workspace number 4";
          "${global.mod}+Shift+5" =
            "move container to workspace number 5";
          "${global.mod}+Shift+6" =
            "move container to workspace number 6";
          "${global.mod}+Shift+7" =
            "move container to workspace number 7";
          "${global.mod}+Shift+8" =
            "move container to workspace number 8";
          "${global.mod}+Shift+9" =
            "move container to workspace number 9";
          "${global.mod}+Shift+0" =
            "move container to workspace number 10";

            # Media keys
            XF86AudioPause         = "exec playerctl play-pause";
            XF86AudioNext          = "exec playerctl next";
            XF86AudioPrev          = "exec playerctl previous";
            XF86AudioLowerVolume   = "exec amixer -c 1 set Master 1%-";
            XF86AudioRaiseVolume   = "exec amixer -c 1 set Master 1%+";
            XF86AudioMute          = "exec amixer -c 1 set Master 0%";
        };
      };
    };
  };
}