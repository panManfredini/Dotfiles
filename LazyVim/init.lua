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

----------------- keymaps ------------------
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
vim.keymap.set({"n","i"}, "<C-PageDown>", "<Cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set({"n","i"}, "<C-PageUp>", "<Cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Normal mode: Ctrl + arrows navigate windows
vim.keymap.set('n', '<M-Left>',  '<C-w><Left>',  { desc = 'Move to left window' })
vim.keymap.set('n', '<M-Right>', '<C-w><Right>', { desc = 'Move to right window' })
vim.keymap.set('n', '<M-Up>',    '<C-w><Up>',    { desc = 'Move to upper window' })
vim.keymap.set('n', '<M-Down>',  '<C-w><Down>',  { desc = 'Move to lower window' })

-- Insert mode: use <C-o> so <C-w> keeps its native delete-word behavior
vim.keymap.set('i', '<M-Left>',  '<C-o><C-w><Left>',  { desc = 'Move to left window from insert' })
vim.keymap.set('i', '<M-Right>', '<C-o><C-w><Right>', { desc = 'Move to right window from insert' })
vim.keymap.set('i', '<M-Up>',    '<C-o><C-w><Up>',    { desc = 'Move to upper window from insert' })
vim.keymap.set('i', '<M-Down>',  '<C-o><C-w><Down>',  { desc = 'Move to lower window from insert' })
