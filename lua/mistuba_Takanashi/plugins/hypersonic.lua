return{
	{
	'tomiis4/Hypersonic.nvim',
	event = "CmdlineEnter",
	cmd = "Hypersonic",
	config = function()
		require('hypersonic').setup({
			---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
			border = 'rounded',
			---@type number 0-100
			winblend = 0,
			---@type boolean
			add_padding = true,
			---@type string
			hl_group = 'Keyword',
			---@type string
			wrapping = '"',
			---@type boolean
			enable_cmdline = true
		})
	end
	},
	{
	"chrisgrieser/nvim-rip-substitute",
	cmd = "RipSubstitute",
	opts = {},
	keys = {
		{
			"<leader>fs",
			function() require("rip-substitute").sub() end,
			mode = { "n", "x" },
			desc = " rip substitute",
		},
	},
	config = function ()
		-- default settings
		require("rip-substitute").setup ({})
	end
},

}
