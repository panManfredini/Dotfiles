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
    root_markers = { "Project.toml" }
})

vim.lsp.enable("jetls")
