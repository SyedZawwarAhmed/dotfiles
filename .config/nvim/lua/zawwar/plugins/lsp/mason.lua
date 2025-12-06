return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "emmet_ls",
        "prismals",
        "pyright",
        "eslint",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function(_, opts)
          -- Set PATH to prioritize Homebrew's Python (3.14) over system Python (3.9.6)
          -- This ensures Mason can find Python 3.10+ required for tools like pylint
          local current_path = os.getenv("PATH") or ""
          vim.env.PATH = "/opt/homebrew/bin:" .. current_path
          
          require("mason").setup(opts)
        end,
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        -- "isort", -- python formatter
        "black", -- python formatter
        "pylint", -- python linter
        "eslint_d",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
