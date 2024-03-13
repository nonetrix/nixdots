{...}: let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}: {
    # TODO: Put more time into Neovim and make better configs
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

      plugins = with pkgs.vimPlugins; [
        catppuccin-nvim
        vim-polyglot
        indent-blankline-nvim
        vim-commentary
        nvim-web-devicons
        lualine-nvim
        vim-illuminate
        vim-css-color
        nvim-tree-lua
        zoxide-vim
        dashboard-nvim
        which-key-nvim
        gitsigns-nvim
        twilight-nvim
        delimitMate
        todo-comments-nvim
        hop-nvim
        nvim-surround
        nvim-cmp
        cmp-nvim-lsp
        nvim-lspconfig
        trouble-nvim
        telescope-nvim
        telescope-project-nvim
        dressing-nvim
        nvim-treesitter
      ];
    };
  };
}
