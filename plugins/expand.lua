return {
  "terryma/vim-expand-region",
  keys = {
    { "+", "<Plug>(expand_region_expand)", mode = { "n", "v" } },
    { "_", "<Plug>(expand_region_shrink)", mode = { "n", "v" } },
  },
}
