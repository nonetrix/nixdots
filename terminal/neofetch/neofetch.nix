{pkgs, ...}: let
  global = import ../../global-var.nix;
in {
  home-manager.users.${global.username} = {...}: {
    #home.file.".config/neofetch/fetch.png".source = ./fetch.png;

    home.file.".config/neofetch/config.conf".text = ''
      print_info () {
      prin "┌──────────────────────────────────────────────────────┐"
      info title

      info "󰍹" model
      info "󱄅" distro
      info "" kernel
      info "󰄉" uptime
      info "" packages
      info "" shell
      info "󰨇" resolution
      info "󰧨" de
      info "󰧨" wm
      info "󰃣" theme
      info "󱗿" icons
      info "" term
      info "" term_font
      info "" cpu
      info "󰾲" gpu
      info "󰍛" memory
      prin "└──────────────────────────────────────────────────────┘"
  }

  image_backend="iterm2"
  image_source="${./fetch.png}"
  image_size="450"
  '';
  };
}
