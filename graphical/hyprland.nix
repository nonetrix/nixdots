# home.nix
{
  config,
  pkgs,
  inputs,
  ...
}: let
  # Import the global variables file
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}: {
    wayland.windowManager.hyprland = {
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      enable = true;

      plugins = [
        inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      ];

      extraConfig = ''
        $mod = SUPER

        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        ${builtins.concatStringsSep "\n" (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in ''
              bind = $mod, ${ws}, split-workspace, ${toString (x + 1)}
              bind = $mod SHIFT, ${ws}, split-movetoworkspace, ${toString (x + 1)}
            ''
          )
          10)}

        binde =, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%+
        binde =, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%-
        bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

        bind = $mod, h, movefocus, l
        bind = $mod, l, movefocus, r
        bind = $mod, k, movefocus, u
        bind = $mod, j, movefocus, d

        bind = $mod SHIFT, h, movewindow, l
        bind = $mod SHIFT, l, movewindow, r
        bind = $mod SHIFT, k, movewindow, u
        bind = $mod SHIFT, j, movewindow, d


        binde = $mod CTRL, l, resizeactive, 10 0
        binde = $mod CTRL, h, resizeactive, -10 0
        binde = $mod CTRL, k, resizeactive, 0 -10
        binde = $mod CTRL, j, resizeactive, 0 10

        bind = $mod, B, exec, floorp
        bind = $mod, Return, exec, alacritty

        bind = $mod, Space, exec, wofi --show drun
        bind = $mod, E, exec, wofi-emoji

        bindm = $mod, mouse:272, movewindow
        bindm = $mod, mouse:273, resizewindow

        bind = $mod, t, togglefloating

        bind = $mod, c, killactive
        bind = $mod, q, exit

        decoration {
          rounding = 8

          blur {
            enabled = true
            size = 5
            passes = 3

            vibrancy = 0.1696
          }
        }

        general {
          gaps_in = 5
          gaps_out = 10
          col.active_border = rgba(a6e3a1ff)

          cursor_inactive_timeout = 4
        }


        input {
          follow_mouse = 1
          mouse_refocus = false
        }

        windowrulev2 = stayfocused, title:^()$,class:^(steam)$
        windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$

        monitor=DP-1, 1920x1080@165, 0x0, 1, vrr, 1
        monitor=DP-3, 1920x1200, 1920x0, 1

        exec-once = swww init
        #exec-once = mako
      '';
    };
  };
}
