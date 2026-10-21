-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--vim.lsp.enable("julials")

vim.lsp.config("jetls", {
  cmd = {
    "jetls",
    "--threads=1",
    "--",
    "serve",
  },
  filetypes = { "julia" },
  root_markers = { "Project.toml" },
})

vim.lsp.enable("jetls")

vim.opt.mouse = ""

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0, silent = true })
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})

vim.keymap.set("n", "<leader>h", function()
  local current = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not current)
end, { desc = "Toggle inlay hints" })

vim.keymap.set({ "n", "i", "v" }, "<M-s>", function()
  if vim.bo.buftype == "" and vim.bo.modifiable then
    vim.cmd("silent! write")
  end
end, { desc = "Save file" })

-- Open signature help (works in normal and insert mode)
vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Cycle overloads with a key that isn't swallowed by the tty
-- (this only takes effect while the signature-help float is focused)
vim.keymap.set("n", "<C-n>", "<Plug>(nvim.lsp.ctrl-s)", { desc = "Next signature" })

-- cycle trough buffers
vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })
