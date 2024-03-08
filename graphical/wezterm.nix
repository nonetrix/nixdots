{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}: {
    programs.wezterm.enable = true;

    home.file.".config/wezterm/wezterm.lua".text = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.launch_menu = {
        {
          label = 'AI container',
          args = {'distrobox', 'enter', 'ai'},
        },
        {
          args = {'btop'},
        },
        {
          label = 'GPU usage',
          args = {'nvtop'}
        },
      },

      wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
        position = "bottom",
        max_width = 32,
        dividers = "slant_right", -- or "slant_left", "arrows", "rounded", false
        indicator = {
          leader = {
            enabled = true,
            off = " ",
            on = " ",
          },
          mode = {
            enabled = true,
            names = {
              resize_mode = "RESIZE",
              copy_mode = "VISUAL",
              search_mode = "SEARCH",
            },
          },
        },
        tabs = {
          numerals = "arabic", -- or "roman"
          pane_count = "superscript", -- or "subscript", false
          brackets = {
            active = { "", ":" },
            inactive = { "", ":" },
          },
        },
        clock = { -- note that this overrides the whole set_right_status
          enabled = true,
          format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
        },
      })

      config.font = wezterm.font 'JetBrainsMono Nerd Font'
      config.use_fancy_tab_bar = false
      config.window_background_opacity = 0.9
      config.color_scheme = "Catppuccin Mocha"
      config.window_close_confirmation = 'NeverPrompt'

      return config
    '';
  };
}
