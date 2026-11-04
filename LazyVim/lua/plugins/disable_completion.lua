return {
  { "saghen/blink.cmp", 
  	opts = {
		completion = {
		        menu = {
		          auto_show = true, -- disable automatic popup, manual trigger still works
		        },
			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = false },
		}
  	} 
  },
  { "hrsh7th/nvim-cmp", enabled = false },
}
