return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Color schemes
  { import = "astrocommunity.colorscheme.tokyonight" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin",
    opts = {
      flavour = "macchiato",
      integrations = {
        noice = true,
        ts_rainbow2 = true,
        markdown = true,
        cmp = true,
      },
    },
  },

  -- Autocompletion
  { import = "astrocommunity.completion.copilot-lua" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local snip_status_ok, luasnip = pcall(require, "luasnip")

      if not snip_status_ok then return end

      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      if not opts.mapping then opts.mapping = {} end

      -- Sets cpm as the default option for tab
      opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif copilot.is_visible() then
          copilot.accept()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })

      opts.mapping["<C-x>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.next() end
      end)

      opts.mapping["<C-z>"] = cmp.mapping(function()
        if copilot.is_visible() then copilot.prev() end
      end)

      return opts
    end,
  },

  -- QOL
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- Packs
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.lua" },

  -- Scrolling
  { import = "astrocommunity.scrolling.nvim-scrollbar" },

  -- Projects
  { import = "astrocommunity.project.neoconf-nvim" },
  { import = "astrocommunity.project.project-nvim" },
  {
    "project.nvim",
    keys = {
      { "<leader>fp", "<cmd>:Telescope projects<cr>", desc = "Find projects" },
    },
  },

  -- Terminal
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },

  -- Utility
  { import = "astrocommunity.utility.noice-nvim" },
}
