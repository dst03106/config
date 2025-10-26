require('configs.plugin_list')
require('configs.options')
require('configs.keymaps')
-- gd로 정의로 안 가는 것 알아봐야 함 (lua_ls)

vim.lsp.enable({'lua_ls', 'gopls'})
