# home.nix
{
  config,
  pkgs,
  inputs,
  ...
}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}: {
    home.file.".icons/default".source = "${pkgs.catppuccin-cursors.mochaDark}/share/icons/Catppuccin-Mocha-Dark-Cursors";

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

        bind =, XF86AudioPlay, exec, playerctl play-pause
        bind =, XF86AudioNext, exec, playerctl next
        bind =, XF86AudioPrev, exec, playerctl previous

        bind = CTRL, Print, exec, satty-shot
        bind =, Print, exec, hyprshot -m output

        bind = $mod, p, exec, wl-copy $(hyprpicker)

        bind = $mod, h, movefocus, l
        bind = $mod, l, movefocus, r
        bind = $mod, k, movefocus, u
        bind = $mod, j, movefocus, d

        bind = $mod SHIFT, h, movewindow, l
        bind = $mod SHIFT, l, movewindow, r
        bind = $mod SHIFT, k, movewindow, u
        bind = $mod SHIFT, j, movewindow, d

        bind = $mod, s, togglesplit

        binde = $mod CTRL, l, resizeactive, 10 0
        binde = $mod CTRL, h, resizeactive, -10 0
        binde = $mod CTRL, k, resizeactive, 0 -10
        binde = $mod CTRL, j, resizeactive, 0 10

        bind = $mod, B, exec, firefox
        bind = $mod, Return, exec, wezterm

        bind = $mod, Space, exec, fuzzel
        bind = $mod, E, exec, BEMOJI_PICKER_CMD='fuzzel -p 🔍  -d' bemoji

        bindm = $mod, mouse:272, movewindow
        bindm = $mod, mouse:273, resizewindow

        bind = $mod, t, togglefloating

        bind = $mod, c, killactive
        bind = $mod, q, exit

        decoration {
          rounding = 8

          blurls = waybar
          blurls = launcher

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
          border_size = 2
          col.active_border = rgba(f5c2e7ff)
          col.inactive_border = rgba(1e1e2eff)
        }

        input {
          follow_mouse = 1
          mouse_refocus = false
          accel_profile = flat
              }

        # I have failed you
        misc {
          disable_hyprland_logo = true
        }


        windowrulev2 = noanim, class:^(com.gabm.satty)$
        layerrule = ignorealpha, waybar
        layerrule = ignorealpha, launcher

        monitor=DP-1, 1920x1200, 1920x0, 1
        monitor=DP-2, 1920x1080@165, 0x0, 1, vrr, 1

        exec-once = wpaperd
        exec-once = wl-clip-persist --clipboard both
        exec-once = waybar
        exec-once = fcitx5
        exec-once = nm-applet
      '';
    };
  };
}
