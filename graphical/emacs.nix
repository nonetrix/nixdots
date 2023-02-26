# This file is just for refrence, you can safely ignore this file as it has no effect on the system

{ config, pkgs, ... }:
let
  global = import ../global-var.nix;
in {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${global.username} = { pkgs, ...}: {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
      extraPackages = epkgs: [ 
        epkgs.catppuccin-theme 
        epkgs.evil
        epkgs.magit
        epkgs.beacon
        epkgs.treemacs
        epkgs.treemacs-evil
        epkgs.nix-mode
        epkgs.doom-modeline
        epkgs.linum-relative
        epkgs.vterm
      ];
      extraConfig = ''
        (load-theme 'catppuccin t)
        (require 'evil)
        (evil-mode 1)
        (beacon-mode 1)
        (require 'doom-modeline)
        (doom-modeline-mode 1)
        (scroll-bar-mode -1)
        (global-set-key (kbd "<f2>") 'treemacs)

        (add-hook 'prog-mode-hook
          (lambda ()
            (require 'linum-relative)
            (setq linum-relative-backend 'display-line-numbers-mode)
            (linum-relative-mode)
            (setq display-line-numbers-type 'relative)))
      '';
    };
  };
}
