vim.pack.add({
	{ name = 'oil', src = 'https://github.com/stevearc/oil.nvim'},
	{ name = 'rose-pine', src = 'https://github.com/rose-pine/neovim'},
	{ name = 'mason', src = 'https://github.com/mason-org/mason.nvim'},
	{ name = 'lspconfig', src = 'https://github.com/neovim/nvim-lspconfig' },
	{ name = 'mini.pick', src = 'https://github.com/nvim-mini/mini.pick' },
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
