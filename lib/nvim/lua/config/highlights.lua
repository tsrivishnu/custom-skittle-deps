vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  desc = 'Apply custom highlight overrides',
  callback = function()
    -- Don't hightlight the background of parameters
    vim.api.nvim_set_hl(0, '@lsp.type.parameter', { bg = 'none' })
    vim.api.nvim_set_hl(0, '@variable.parameter', { bg = 'none' })

    -- Add more fixes here in the future
    -- e.g., vim.api.nvim_set_hl(0, 'Comment', { italic = true })
  end,
})
