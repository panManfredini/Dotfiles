return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<c-\>]],
    hide_numbers = false, -- hide the number column in toggleterm buffers
    direction = "vertical",
    size = function(term)
      return vim.o.columns * 0.3
    end,
    start_in_insert = true,
  },
}
