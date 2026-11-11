return {
  {
    "saghen/blink.cmp",
    opts = {

      keymap = {
        ["<S-Tab>"] = { "show", "show_documentation" },
      },

      completion = {
        menu = { auto_show = false },

        ghost_text = { enabled = false },

        documentation = { auto_show = false },
      },
    },
  },
  { "hrsh7th/nvim-cmp", enabled = false },
}
