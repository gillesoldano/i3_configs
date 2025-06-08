return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
      local util = require "lspconfig/util"
			lspconfig.lua_ls.setup({capabilities = capabilities})
			lspconfig.ts_ls.setup({capabilities = capabilities})
      lspconfig.gopls.setup({
        capabilities = capabilities,
        filetypes = { "go", "gomod", "gowork", "gotmpl"},
        root_dir = util.root_pattern("go.work", "go.mod", "gotmpl"),
        settings = {
          gopls = {
            completeUninported = true,
            analyses = {
              unusedparams = true,
            }
          },
        },
      })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		end,
	},
}
