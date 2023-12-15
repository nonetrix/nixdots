# This file is just for refrence, you can safely ignore this file as it has no effect on the system
{
  config,
  pkgs,
  ...
}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}: {
    programs.neovim = {
      enable = true;
      extraConfig = ''
        syntax on
        set number! relativenumber!
        set autoindent
        set tabstop=4
        set ignorecase
        set ttyfast
        set termguicolors
      '';

      extraLuaConfig = ''
            vim.opt.list = true
            vim.opt.listchars:append "space:⋅"
            vim.opt.listchars:append "eol:↴"

            require('lualine').setup {
              options = {
                  theme = "catppuccin"
                  -- ... the rest of your lualine config
              }
          }

          require'nvim-tree'.setup {
            view = {
              side = 'left',
              width = 40
            }
          }

          require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },

            transparent_background = false,
            show_end_of_buffer = false, -- show the '~' characters after the end of buffers
            term_colors = false,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                indent_blankline = {
                  enabled = true,
                  colored_indent_levels = true,
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        })

          -- setup must be called before loading
          vim.cmd.colorscheme "catppuccin"
      '';

      plugins = [
        pkgs.vimPlugins.catppuccin-nvim
        pkgs.vimPlugins.vim-polyglot
        pkgs.vimPlugins.indent-blankline-nvim
        pkgs.vimPlugins.vim-commentary
        pkgs.vimPlugins.nvim-web-devicons
        pkgs.vimPlugins.lualine-nvim
        pkgs.vimPlugins.vim-illuminate
        pkgs.vimPlugins.vim-css-color
        pkgs.vimPlugins.nvim-tree-lua
        pkgs.vimPlugins.zoxide-vim
        pkgs.vimPlugins.dashboard-nvim
        pkgs.vimPlugins.which-key-nvim
        pkgs.vimPlugins.gitsigns-nvim
        pkgs.vimPlugins.twilight-nvim
        pkgs.vimPlugins.delimitMate
        pkgs.vimPlugins.todo-comments-nvim
        pkgs.vimPlugins.hop-nvim
        pkgs.vimPlugins.nvim-surround
        pkgs.vimPlugins.nvim-cmp
        pkgs.vimPlugins.cmp-nvim-lsp
        pkgs.vimPlugins.nvim-lspconfig
        pkgs.vimPlugins.trouble-nvim
        pkgs.vimPlugins.telescope-nvim
        pkgs.vimPlugins.telescope-project-nvim
        pkgs.vimPlugins.dressing-nvim
        pkgs.vimPlugins.nvim-treesitter
      ];
    };
  };
}
