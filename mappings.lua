-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-Enter>"] = { "<cmd>:call append(line('.'), '')<CR>", desc = "New line below" },
    ["<C>z"] = { "<cmd> echo 'test'<cr>" },
  },
  v = {
    -- use the v key to switch between visual modes
    ["v"] = {
      function()
        local m = vim.api.nvim_get_mode().mode
        if m == "v" then
          vim.api.nvim_feedkeys("V", "n", true)
        elseif m == "V" then
          vim.api.nvim_feedkeys("\22", "n", true)
        else
          vim.api.nvim_feedkeys("v", "n", true)
        end
      end,
      desc = "Switch to visual line mode",
    },
  },
}
