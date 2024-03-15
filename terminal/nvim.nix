{...}:
let
  global = import ../global-var.nix;
in {
  home-manager.users.${global.username} = {pkgs, ...}:
  {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraConfig = ''
        syntax on
        set number relativenumber
        set autoindent
        set tabstop=4
        set ignorecase
        set ttyfast
        set termguicolors
        set expandtab
        set cmdheight=0
      '';

      extraLuaConfig = ''
        vim.cmd.colorscheme "catppuccin"

        require('nvim-tree').setup {
          tab = { sync = { open = true, close = true, ignore = {} } },
        }

        require('lualine').setup {
          options = {
            theme = "catppuccin",
            disabled_filetypes = {
              statusline = {"NvimTree"},
            },
          },
        }

        require'colorizer'.setup {
          filetypes = {
            '*',
          },
        }

        require("nvim-autopairs").setup {}
        require("ibl").setup {}

        local function open_nvim_tree()
          -- open the tree
          require("nvim-tree.api").tree.open()
        end

        vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })
        vim.api.nvim_create_autocmd("TabEnter", { callback = open_nvim_tree })

        
        if vim.g.neovide then
          vim.o.guifont = "JetBrainsMono Nerd Font:h12" 
          vim.g.neovide_transparency = 0.9
        end
      '';

      plugins = with pkgs.vimPlugins; [
        catppuccin-nvim
        nvim-tree-lua
        nvim-web-devicons
        barbar-nvim
        lualine-nvim
        nvim-colorizer-lua
        nvim-autopairs
        indent-blankline-nvim
        nvim-treesitter.withAllGrammars
      ];
    };
  };
}
