vim.pack.add({
	{ name = 'gitsigns',      src = 'https://github.com/lewis6991/gitsigns.nvim'},

	{ name = 'plenary',       src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ name = 'codecompanion', src = 'https://github.com/olimorris/codecompanion.nvim' },

	{ name = 'oil',           src = 'https://github.com/stevearc/oil.nvim' },

	{ name = 'rose-pine',     src = 'https://github.com/rose-pine/neovim' },

	{ name = 'mason',         src = 'https://github.com/mason-org/mason.nvim' },

	{ name = 'lspconfig',     src = 'https://github.com/neovim/nvim-lspconfig' },

	{ name = 'mini.pick',     src = 'https://github.com/nvim-mini/mini.pick' },
})
require('gitsigns').setup({})
require('codecompanion').setup({
	adapters = {
		acp = {
			gemini_cli = function()
				return require('codecompanion.adapters').extend('gemini_cli', {
					defaults = {
						auth_method = 'gemini-api-key',
					},
					env = {
						GEMINI_API_KEY = os.getenv 'GEMINI_API_KEY',
					},
				})
			end,
		}
	},
	strategies = {
		chat = {
			adapter = 'gemini_cli',
		},
		cmd = {
			adapter = 'gemini_cli',
		}
	},
	opts = {
		log_level = 'TRACE',
	}
})
require('rose-pine').setup({})
require('mason').setup({})
require('mini.pick').setup({})
require('oil').setup {
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
	view_options = {
		show_hidden = true,
	},
	columns = {
		'permissions',
		'icon',
	},
	float = {
		max_width = 0.7,
		max_height = 0.6,
		border = 'rounded',
	},
}
vim.cmd('colorscheme rose-pine')
