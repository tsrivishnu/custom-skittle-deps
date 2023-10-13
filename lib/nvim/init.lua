-- Help with regard to migrating to lua config:
-- https://www.notonlycode.org/neovim-lua-config/

-- This is safety net when migration from init.vim to init.lua. Take
-- time and move them out later
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Disable new regex to make Vim faster with Ruby file
" See: https://github.com/neovim/neovim/issues/4930#issuecomment-230477987
" and https://www.reddit.com/r/vim/comments/8ggdqn/undocumented_tips_make_your_vim_1020x_times_faster/
" set re=1
]])

-- Auto configure packer by installing it ondemand
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'github/copilot.vim'
  use 'hashivim/vim-terraform'
  use 'neovim/nvim-lspconfig'
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Configure terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- Configure volar (vue language server)
require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

vim.cmd [[source ~/.vimrc]]
