return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- Color schemes
  { import = "astrocommunity.colorscheme.tokyonight" },

  -- Autocompletion
  { import = "astrocommunity.completion.copilot-lua-cmp" },

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

  -- Utility
  { import = "astrocommunity.utility.noice-nvim" },
}
