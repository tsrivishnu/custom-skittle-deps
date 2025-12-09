return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    config = function()
      -- ## 1. Define global diagnostic keymaps
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

      -- ## 3. Configure Mason
      require('mason').setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          'vtsls',
          'html',
          'eslint',
          'jsonls',
          'cssls',
          'html',
        },
        automatic_installation = true,
      })
    end,
  },
}
