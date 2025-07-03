{ config, pkgs, ... }:

{
  # Set Neovim as default editor
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Create vi and vim aliases
  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # Language servers
      lua-language-server      # Lua LSP
      nil                      # Nix LSP
      rust-analyzer           # Rust LSP
      clang-tools             # C/C++ LSP (clangd)
      pyright                 # Python LSP
      jdt-language-server     # Java LSP
      fsautocomplete          # F# LSP
      gopls                   # Go LSP
      
      # Formatters
      stylua                  # Lua formatter
      nixpkgs-fmt            # Nix formatter
      rustfmt                # Rust formatter
      black                  # Python formatter
      google-java-format     # Java formatter
      go                  # Go formatter
      
      # Other tools
      ripgrep                # Fast grep (needed for Telescope)
      fd                     # Fast find (needed for Telescope)
      git                    # Git integration
    ];

    plugins = with pkgs.vimPlugins; [
      # Colorscheme
      {
        plugin = tokyonight-nvim;
        type = "lua";
        config = ''
          -- Tokyo Night theme configuration
          require("tokyonight").setup({
            -- use the night style
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = false, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            styles = {
              -- Style to be applied to different syntax groups
              -- Value is any valid attr-list value for `:help nvim_set_hl`
              comments = { italic = true },
              keywords = { italic = true },
              functions = {},
              variables = {},
              -- Background styles. Can be "dark", "transparent" or "normal"
              sidebars = "dark", -- style for sidebars, see below
              floats = "dark", -- style for floating windows
            },
            sidebars = { "qf", "help", "NvimTree" }, -- Set a darker background on sidebar-like windows
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            on_colors = function(colors) end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            on_highlights = function(highlights, colors) end,
          })

          -- Set the colorscheme
          vim.cmd.colorscheme("tokyonight-storm")
        '';
      }

      # Essential plugins
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          -- Telescope: Fuzzy finder for files, buffers, grep, etc.
          -- Super powerful search tool - find files, search in files, browse git commits
          require('telescope').setup({
            defaults = {
              file_ignore_patterns = { "node_modules", ".git/" },
            }
          })
          
          -- Key mappings for Telescope
          vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
          vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live grep' })
          vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find buffers' })
          vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help tags' })
        '';
      }

      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          -- Treesitter: Better syntax highlighting and code understanding
          -- Provides amazing syntax highlighting and helps other plugins understand code structure
          require('nvim-treesitter.configs').setup({
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
          })
        '';
      }

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          -- LSP Configuration: Language server protocol for smart code features
          -- Provides autocomplete, go-to-definition, error checking, etc.
          local lspconfig = require('lspconfig')
          
          -- Lua
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = { globals = {'vim'} },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              }
            }
          })
          
          -- Nix
          lspconfig.nil_ls.setup({})
          
          -- Rust
          lspconfig.rust_analyzer.setup({})
          
          -- C/C++
          lspconfig.clangd.setup({})
          
          -- Python
          lspconfig.pyright.setup({})
          
          -- Java
          lspconfig.jdtls.setup({})
          
          -- F#
          lspconfig.fsautocomplete.setup({})
          
          -- Go
          lspconfig.gopls.setup({})
          
          -- Global LSP keymaps
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
        '';
      }

      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          -- Autocompletion: Smart autocomplete as you type
          -- Shows suggestions for functions, variables, etc. while typing
          local cmp = require('cmp')
          
          cmp.setup({
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ['<Tab>'] = cmp.mapping.select_next_item(),
              ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'buffer' },
              { name = 'path' },
            })
          })
        '';
      }

      # Completion sources
      cmp-nvim-lsp
      cmp-buffer
      cmp-path

      {
        plugin = which-key-nvim;
        type = "lua";
        config = ''
          -- Which-key: Shows available keybindings
          -- When you press a key like <leader>, shows what other keys you can press
          require('which-key').setup({})
        '';
      }

      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          -- File explorer: Browse files in a sidebar
          -- Like VS Code's file explorer but for Neovim
          require('nvim-tree').setup({
            view = { width = 30 },
            filters = { dotfiles = false },
          })
          
          vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
        '';
      }

      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          -- Statusline: Pretty status bar at bottom
          -- Shows current mode, file info, git branch, etc.
          require('lualine').setup({
            options = { theme = 'auto' },
            sections = {
              lualine_a = {'mode'},
              lualine_b = {'branch', 'diff', 'diagnostics'},
              lualine_c = {'filename'},
              lualine_x = {'encoding', 'fileformat', 'filetype'},
              lualine_y = {'progress'},
              lualine_z = {'location'}
            }
          })
        '';
      }

      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''
          -- Git integration: Shows git changes in the gutter
          -- See which lines you've added/modified/deleted since last commit
          require('gitsigns').setup({
            signs = {
              add = {text = '+'},
              change = {text = '~'},
              delete = {text = '_'},
              topdelete = {text = '‾'},
              changedelete = {text = '~'},
            }
          })
        '';
      }

      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''
          -- Indent guides: Shows vertical lines for indentation
          -- Helps you see code structure, especially in deeply nested code
          require('ibl').setup({
            indent = { char = "│" },
            scope = { enabled = false },
          })
        '';
      }

      {
        plugin = comment-nvim;
        type = "lua";
        config = ''
          -- Smart commenting: Easy comment/uncomment with gcc
          -- Press 'gcc' to comment/uncomment a line, 'gc' in visual mode for blocks
          require('Comment').setup()
        '';
      }

      {
        plugin = auto-pairs;
        config = ''
          " Auto-pairs: Automatically close brackets, quotes, etc.
          " When you type '(', it automatically adds ')' and puts cursor between them
        '';
      }

      # Dependencies
      plenary-nvim       # Required by Telescope and other plugins
      nvim-web-devicons  # Pretty icons for file types
      nui-nvim           # UI components library
    ];

    # Basic Neovim configuration
    extraLuaConfig = ''
      -- Basic settings
      vim.opt.number = true           -- Show line numbers
      vim.opt.relativenumber = true   -- Show relative line numbers
      vim.opt.autoindent = true       -- Auto indent new lines
      vim.opt.smartindent = true      -- Smart indentation
      vim.opt.expandtab = true        -- Use spaces instead of tabs
      vim.opt.tabstop = 2             -- Tab width
      vim.opt.shiftwidth = 2          -- Indent width
      vim.opt.softtabstop = 2         -- Soft tab stop
      vim.opt.wrap = false            -- Don't wrap lines
      vim.opt.scrolloff = 8           -- Keep 8 lines visible when scrolling
      vim.opt.sidescrolloff = 8       -- Keep 8 columns visible when scrolling
      vim.opt.hlsearch = true         -- Highlight search results
      vim.opt.incsearch = true        -- Incremental search
      vim.opt.ignorecase = true       -- Ignore case in search
      vim.opt.smartcase = true        -- Smart case in search
      vim.opt.clipboard = "unnamedplus" -- Use system clipboard
      vim.opt.mouse = "a"             -- Enable mouse support
      vim.opt.termguicolors = true    -- True color support
      vim.opt.signcolumn = "yes"      -- Always show sign column
      vim.opt.updatetime = 250        -- Faster completion
      vim.opt.timeoutlen = 300        -- Faster key sequences
      
      -- Set leader key to space
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "
      
      -- Basic keymaps
      vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
      vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
      vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save' })
      vim.keymap.set('n', '<leader>x', '<cmd>x<CR>', { desc = 'Save and quit' })
      
      -- Window navigation
      vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
      vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })
      vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
      vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
      
      -- Better indenting in visual mode
      vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })
      vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })
      
      -- Move lines up and down
      vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
      vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })
    '';

    extraConfig = ''
      " Additional Vim configuration can go here if needed
      " Most configuration is done in Lua above
    '';
  };
}
