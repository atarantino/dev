-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Clipboard configuration for both SSH and local use
local function is_ssh()
  return os.getenv("SSH_TTY") ~= nil or os.getenv("SSH_CONNECTION") ~= nil
end

if is_ssh() then
  -- Use OSC52 for copying to clipboard when in SSH session
  -- Pasting uses terminal's normal paste mechanism (Ctrl+Shift+V or middle-click)
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = function()
        return vim.split(vim.fn.getreg(""), "\n")
      end,
      ["*"] = function()
        return vim.split(vim.fn.getreg(""), "\n")
      end,
    },
  }
else
  -- Use system clipboard when local
  vim.opt.clipboard = "unnamedplus"
end
