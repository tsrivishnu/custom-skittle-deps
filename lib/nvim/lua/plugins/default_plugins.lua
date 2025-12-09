return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'typescript',
        'tsx',
        'javascript',
        'json',
        'lua',
        'vim',
        'vimdoc',
        'bash',
        'html',
        'css',
        'markdown',
      },
      -- This will install parsers as you open new file types
      auto_install = true,

      highlight = {
        enable = true,
      },
    })
    end,
  },
  { 'github/copilot.vim' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-endwise' },
  { 'airblade/vim-gitgutter' },
  -- { 'amiel/vim-tmux-navigator' },
  { 'rking/ag.vim' },
  { 'fatih/vim-go' },
  { 'jtratner/vim-flavored-markdown' },
  { 'mustache/vim-mustache-handlebars' },
  { 'tpope/vim-rails' },
  { 'tpope/vim-ragtag' },
  { 'pangloss/vim-javascript' },
  { 'vim-ruby/vim-ruby' },
  { 'hynek/vim-python-pep8-indent' },
  { 'danro/rename.vim' },
  { 'vim-scripts/copypath.vim' },
  { 'tpope/vim-unimpaired' },
  { 'jiangmiao/auto-pairs' },
  { 'vim-scripts/Align' },
  { 'nelstrom/vim-visual-star-search' },
  { 'cyphactor/vim-open-alternate' },
  { 'dkprice/vim-easygrep' },
  { 'vim-scripts/visualrepeat' },
  { 'mileszs/ack.vim' },
  { 'jamessan/vim-gnupg' },
  {
    'hashivim/vim-terraform',
    config = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 1
    end
  },
  {
    'junegunn/fzf',
    run = function() vim.fn['fzf#install']() end,
    config = function()
      vim.g.fzf_history_dir = '~/.local/share/fzf-history'
      vim.g.fzf_layout = { down = '40%' }
      vim.env.FZF_DEFAULT_COMMAND = 'ag -g ""'
    end
  },
  -- The FZF.vim plugin, which provides the advanced commands
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
  },
  {
    'tracyone/fzf-funky',
    dependencies = {
        'junegunn/fzf',
        'junegunn/fzf.vim'
    },
    -- Load the plugin when the FzfFunky command is used
    -- or when the specified keymaps are pressed
    cmd = 'FzfFunky',
    keys = {
      -- Use a more explicit format for robustness
      {
        '<leader>fu',
        '<Cmd>FzfFunky<CR>',
        mode = 'n', -- Ensure the keymap is in Normal mode
        desc = 'FzfFunky: List functions',
      },
      {
        '<leader>fU',
        function()
          vim.cmd('FzfFunky ' .. vim.fn.expand('<cword>'))
        end,
        mode = 'n',
        desc = 'FzfFunky: List functions under cursor',
      },
    },
    config = function()
      vim.g.fzf_funky_ctags_command = '/usr/local/bin/ctags -f - --fields=neK --kinds-typescript=f,m --kinds-javascript=f,m --kinds-python=f,m'
    end
  },


  { 'vim-airline/vim-airline-themes' },
  {
    'vim-airline/vim-airline',
    lazy = false,
    config = function()
      vim.g.airline_theme="solarized" -- from vim-airline-themes
      vim.g.airline_left_sep = ''
      vim.g.airline_left_alt_sep = ''
      vim.g.airline_right_sep = ''
      vim.g.airline_right_alt_sep = ''
    end
  },

  {
    'posva/vim-vue',
    config = function()
      vim.g.vue_pre_processors = 'detect_on_enter'
    end
  },

  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
      variant = 'winter',
      on_highlights = function (colors, color)
        local darken = color.darken
        local lighten = color.lighten
        local blend = color.blend
        local shade = color.shade
        local tint = color.tint

        ---@type solarized.highlights
        local groups = {
          Visual = { fg = colors.base2, bg = colors.yellow, standout = false },
          Function = { fg = colors.yellow },
          IncSearch = { fg = colors.orange, bg = colors.mix_orange },
          Search = { fg = colors.base2, bg = colors.yellow },
          NormalFloat = { bg = darken(colors.base03, 25) }
        }

        return groups
      end
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'light'
      -- merge the opts with the default options
      -- add "variant=summer"
      require('solarized').setup(opts)
      vim.cmd.colorscheme 'solarized'
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
     lazy = false,
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    -- if this doesn't work, try calling the setup function manually as below
    --          :lua vim.fn["mkdp#util#install"]()
  }
}
