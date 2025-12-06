return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  keys = {
    { "<leader>ee", "<cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>Neotree reveal<CR>", desc = "Toggle file explorer on current file" },
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    -- options go here
  }
}
