return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostics disable: missing-fields
  keys = {
	  { "<C-p>", "<cmd>FzfLua global<cr>", "FzfLua global search" },
	  { "<C-g>", "<cmd>FzfLua grep<cr>", "FzfLua grep search" },
  },
  ---@diagnostics enable: missing-fields
}
