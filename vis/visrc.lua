-- load standard vis module, providing parts of the Lua API
require('vis')
local plug = require('plugins/vis-plug')

local plugins = {
	{ 'git.sr.ht/~mcepl/vis-fzf-open' },
	{ 'erf/vis-highlight' },
	{ 'milhnl/vis-format' },
	{ 'e-zk/vis-shebang' },
	{ 'erf/vis-title' },
	{ 'pshevtsov/base16-vis', theme = true, file = 'themes/base16-materia' },
}

plug.init(plugins, true)

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	-- Your per window configuration options e.g.
	vis:command('set number')
end)
