return {
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux" -- or "wezterm", "kitty", "neovim", etc.
      vim.g.slime_default_config = {
        --socket_name = vim.api.nvim_eval('get(split($TMUX, ","), 0)'),
        socket_name = "default",
        target_pane = ":",
      }
      --     vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
      --vim.g.slime_dont_ask_default = 1
    end,
  },
}
