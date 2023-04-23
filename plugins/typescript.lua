local utils = require "astrocommunity.utils"

return {
  {
    "jose-elias-alvarez/typescript.nvim",
    init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver") end,
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = true,
    event = "BufRead package.json",
  },
}
