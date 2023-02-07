# This file is just for refrence, you can safely ignore this file as it has no effect on the system

{ config, pkgs, ... }:
let
  global = import ../../global-var.nix;
in {
  imports = [
    <home-manager/nixos>
  ];

  home-manager.users.${global.username} = { pkgs, ...}: {
    programs.neovim = {
        enable = true;
        extraConfig = 
        ''
            syntax on
            set relativenumber
            set autoindent
            set tabstop=4
            set ignorecase
        '';
        plugins = [
            pkgs.vimPlugins.catppuccin-nvim
            pkgs.vimPlugins.vim-polyglot
            pkgs.vimPlugins.indentLine
            pkgs.vimPlugins.vim-commentary
            pkgs.vimPlugins.lightline-vim
            #pkgs.vimPlugins.vim-illuminate # Doesn't seem to work?
            pkgs.vimPlugins.vim-css-color
        ];
    };
  };
}