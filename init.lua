-- [[ Setting options ]]
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`
require("config.options")

-- [[ Keymaps ]]
--  See `:help vim.keymap.set()`
require("config.keymaps")

-- [[ Autocommands ]]
--  See `:help lua-guide-autocommands`
require("config.autocmds")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup(
  -- plugins
  {
    -- require 'kickstart.plugins.debug',
    -- require 'kickstart.plugins.indent_line',
    { import = "plugins" },
  },
  -- opts
  {
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
      enabled = true,
      notify = false,
    },
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "tohml",
          "tutor",
        },
      },
    },
  }
)

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
