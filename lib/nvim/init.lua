-- Help with regard to migrating to lua config:
-- https://www.notonlycode.org/neovim-lua-config/

-- Set mapleader to ","
vim.g.mapleader = ','

-- source the old vimrc
vim.cmd [[source ~/.vimrc]]

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

require("config.lazy")

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Map H to toggle cursorline
vim.api.nvim_set_keymap('n', 'H', ':set cursorline!<CR>', { noremap = true, silent = true })

-- Function to change background based on macOS Appearance
local function change_background()
  -- Check if macOS is using dark mode
  local handle = io.popen("defaults read -g AppleInterfaceStyle")
  local result = handle:read("*a")
  handle:close()

  -- Trim trailing whitespace (since 'defaults' command output may have newlines)
  result = result:gsub("%s+", "")

  -- Set background based on the system appearance
  if result == "Dark" then
    vim.o.background = 'dark'
  else
    vim.o.background = 'light'
  end

  -- Try refreshing the statusline (e.g., if you're using airline)
  pcall(function()
    vim.cmd('AirlineRefresh')
  end)
end
-- Initialize the colorscheme based on current macOS Appearance setting
change_background()

-- Set cursorline
vim.o.cursorline = true

-- Wrapped lines go down/up to next row, rather than next line in file.
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Vertical split
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>v<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>\\|', '<C-w>v<C-w>l', { noremap = true, silent = true })

-- Horizontal split
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>s<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>-', '<C-w>s<C-w>l', { noremap = true, silent = true })

-- Resize window to fullsize or otherwise
vim.api.nvim_set_keymap('n', '<leader>+', '<C-w>_<C-w>|', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', { noremap = true, silent = true })

-- Map <Space> to / (search)
vim.keymap.set('n', '<Space>', '/', { noremap = true })
-- Map <C-Space> to ? (backwards search)
vim.keymap.set('n', '<C-Space>', '?', { noremap = true })

-- Smart way to move between windows
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true, silent = true })

-- Define a command `Bclose` that deletes a buffer without closing the window
vim.api.nvim_create_user_command("Bclose", function()
    local current_buf = vim.api.nvim_get_current_buf()
    local alternate_buf = vim.fn.bufnr("#")

    -- Switch to the alternate buffer if it exists; otherwise, go to the next buffer
    if vim.fn.buflisted(alternate_buf) == 1 then
        vim.cmd("buffer #")
    else
        vim.cmd("bnext")
    end

    -- If still in the same buffer, open a new empty buffer
    if vim.api.nvim_get_current_buf() == current_buf then
        vim.cmd("new")
    end

    -- Finally, delete the original buffer if it's still listed
    if vim.fn.buflisted(current_buf) == 1 then
        vim.cmd("bdelete! " .. current_buf)
    end
end, {})
-- Close the current buffer
vim.keymap.set('n', '<leader>bd', ':Bclose<CR>', { noremap = true, silent = true })

-- Close all buffers
vim.keymap.set('n', '<leader>ba', ':1,1000 bd!<CR>', { noremap = true, silent = true })

-- Useful mappings for managing tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tm', ':tabmove ', { noremap = true, silent = true })

-- Opens a new tab with the current buffer's path
-- Super useful when editing files in the same directory
vim.keymap.set('n', '<leader>te', ':tabedit ' .. vim.fn.expand('%:p:h') .. '/', { noremap = true, silent = true })

-- Switch CWD to the directory of the open buffer
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })

-- Specify the behavior when switching between buffers
vim.o.switchbuf = 'useopen,usetab,newtab'
vim.o.stal = 2

-- Return to last edit position when opening files (You want this!)
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local last_pos = vim.fn.line("'\"")
        if last_pos > 0 and last_pos <= vim.fn.line("$") then
            vim.cmd("normal! g`\"")
        end
    end,
})
-- Remember info about open buffers on close
vim.opt.viminfo:append("%")

-- When you press gv, vimgrep after the selected text
vim.keymap.set('v', 'gv', ':call VisualSelection("gv")<CR>', { noremap = true, silent = true })

-- -- Disable CTRL-Q for Blockwise Visual
-- vim.api.nvim_set_keymap('n', '<C-Q>', '', { noremap = true, silent = true })
