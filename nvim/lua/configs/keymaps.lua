local L = function(key)
  return '<leader>' .. key
end
local C = function(cmd)
  return '<Cmd>' .. cmd .. '<CR>'
end
local map = function(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('n', L'w', C'write', 'Write buffer')
map('n', L'q', C'quit', 'Quit buffer')
map('n', L'e', C'Oil', 'Open file explorer')

-- navigation
map('n', '<C-k>', '<C-u>zz', 'Scroll up and center')
map('n', '<C-j>', '<C-d>zz', 'Scroll down and center')

-- config files
map({ 'n', 'v', 'x' }, L 'v', C 'e $MYVIMRC', 'Edit nvim config')
map({ 'n', 'v', 'x' }, L 'z', C 'e ~/.zshrc', 'Edit zshrc')
map({ 'n', 'v', 'x' }, L 'wz', C 'e ~/.config/wezterm/wezterm.lua', 'Edit wezterm config')
map({ 'n', 'v', 'x' }, L 'o', C 'source $MYVIMRC', 'Source ' .. vim.fn.expand '$MYVIMRC')
map({ 'n', 'v', 'x' }, L 'O', C 'restart', 'Restart vim.')

-- lsp
map('n', L 'lf', C 'lua vim.lsp.buf.format()', 'Format buffer')
map('n', L 'cr', C 'lua vim.lsp.buf.rename()', 'Rename symbol')
map('n', L 'ca', C 'lua vim.lsp.buf.code_action()', 'Code action')
map('n', 'gd', C 'lua vim.lsp.buf.definition()', 'Go to definition')
map('n', 'K', C 'lua vim.lsp.buf.hover()', 'Show type and docs of the symbol')
map('n', 'gl', C 'lua vim.diagnostic.open_float()', 'Show diagnostics')
map('n', 'dn', C 'lua vim.diagnostic.jump({ count = 1, float = true })', 'Next diagnostic')
map('n', 'dp', C 'lua vim.diagnostic.jump({ count = -1, float = true })', 'Previous diagnostic')

-- control panes
map('n', 'ss', C 'split', 'Split horizontal', { noremap = true, silent = true })
map('n', 'sv', C 'vsplit', 'Split vertical', { noremap = true, silent = true })
map('n', 'sk', '<C-w>k', 'Focus pane above')
map('n', 'sh', '<C-w>h', 'Focus pane left')
map('n', 'sj', '<C-w>j', 'Focus pane below')
map('n', 'sl', '<C-w>l', 'Focus pane right')
map('n', 'sq', '<C-w>q', 'Close pane')
map('n', '<C-w><left>', '<C-w><', 'Decrease pane width')
map('n', '<C-w><right>', '<C-w>>', 'Increase pane width')
map('n', '<C-w><up>', '<C-w>+', 'Increase pane height')
map('n', '<C-w><down>', '<C-w>-', 'Decrease pane height')

-- picker
map('n', L 'g', C 'Pick grep_live', 'Grep live')
map(
  { 'n', 'v' },
  L 'sw',
  C 'lua require("mini.pick").builtin.grep { pattern = vim.fn.expand "<cword>" }',
  'Search word'
)
map('n', L '<space>', C 'Pick files', 'Find files')
map('n', L 'r', C 'Pick buffers', 'Find buffers')
map('n', L 'h', C 'Pick help', 'Find help')

-- terminal
local T = function(mode)
	if mode == 'vertical' then
		return function()
			vim.cmd 'vert split | term'
		end
	elseif mode == 'horizontal' then
		return function()
			vim.cmd 'hor split | term'
		end
	else
		return function()
			vim.cmd('vert split | term ' .. mode)
		end
	end
end
map('n', L 'tv', T 'vertical', 'Open terminal vertically')
map('n', L 'th', T 'horizontal', 'Open terminal horizontally')
map('n', L 'ge', T 'gemini', 'Open terminal with Gemini CLI')
map('n', L 'ta', C 'set autochdir', 'Attach Terminal to Current Buffer')
map('n', L 'td', C 'set noautochdir', 'Detach Terminal from Current Buffer')
map('t', 'tq', '<C-\\><C-n>', 'Change to normal mode in terminal')

-- plugin:lazygit
map('n', L'lg', C'LazyGit', 'Open LazyGit', { silent = true})
