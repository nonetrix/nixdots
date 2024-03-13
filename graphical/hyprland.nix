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
      # Uses package from flake pulling the newest Git version
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      enable = true;

      plugins = [
        # This allows for workspaces to be split with multiple monitors, often breaks with Hyprland updates
        inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      ];

      extraConfig = ''
        $mod = SUPER

        # Workspaces, also uses split-monitor-workspaces instead of normal Hyprland way
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

        # Media keys
        binde =, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%+
        binde =, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 1%-
        bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

        bind =, XF86AudioPlay, exec, playerctl play-pause
        bind =, XF86AudioNext, exec, playerctl next
        bind =, XF86AudioPrev, exec, playerctl previous

        # Screenshots
        bind = CTRL, Print, exec, satty-shot
        bind =, Print, exec, hyprshot -m output

        # Color picker
        bind = $mod, p, exec, wl-copy $(hyprpicker)

        # WM interaction
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

        bind = $mod, t, togglefloating

        bindm = $mod, mouse:272, movewindow
        bindm = $mod, mouse:273, resizewindow

        bind = $mod, c, killactive
        bind = $mod, q, exit

        # Programs
        bind = $mod, B, exec, firefox
        # Wezterm broken for now :(
        bind = $mod, Return, exec, wezterm

        bind = $mod, Space, exec, fuzzel
        bind = $mod, E, exec, BEMOJI_PICKER_CMD='fuzzel -p 🔍  -d' bemoji

        bind = $mod, a, exec, alacritty -e ollama run mixtral
        bind = $mod SHIFT, a, exec, llm-actions

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

        # I have failed you Hyprchan
        misc {
          disable_hyprland_logo = true
        }

        windowrulev2 = noanim, class:^(com.gabm.satty)$
        layerrule = ignorealpha, waybar
        layerrule = ignorealpha, launcher

        # Monitors
        monitor=DP-1, 1920x1200, 1920x0, 1 # Right shitty OEM dell monitor
        monitor=DP-2, 1920x1080@165, 0x0, 1, vrr, 1 # Left gayming monitor

        # Autostart
        exec-once = wpaperd
        exec-once = wl-clip-persist --clipboard both
        exec-once = waybar
        exec-once = fcitx5
        exec-once = nm-applet
      '';
    };
  };
}
