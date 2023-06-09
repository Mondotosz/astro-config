return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "rust",
        "javascript",
        "typescript",
        "php",
        "json",
        "yaml",
        "toml",
        "vue",
        "python",
        "markdown",
        "latex",
        "html",
        "dockerfile",
        "css",
        "jsonc",
        "bash",
        "regex",
        "markdown_inline",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
