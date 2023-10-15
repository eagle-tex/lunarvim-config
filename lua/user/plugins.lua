lvim.plugins = {
	-- require("user.plugins.emmet-ls"),
	-- require("user.plugins.nvim-lastplace"),
	-- require("user.plugins.persistence"),
	-- require("user.plugins.todo-comments"),
	-- require("user.plugins.trouble"),

	-- { "christoomey/vim-tmux-navigator" },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestions = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},

	-- {
	-- 	"jose-elias-alvarez/typescript.nvim",
	-- 	keys = {
	-- 		{ "<leader>C", desc = "TypeScript" },
	-- 		{ "<leader>Ca", "<cmd>TypescriptAddMissingImports<cr>", desc = "Add missing imports" },
	-- 		{ "<leader>Co", "<cmd>TypescriptOrganizeImports<cr>", desc = "Organize imports" },
	-- 		{ "<leader>Cu", "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove unused imports" },
	-- 		{ "<leader>Cf", "<cmd>TypescriptFixAll<cr>", desc = "Fix all" },
	-- 		{ "<leader>Cr", "<cmd>TypescriptRenameFile<cr>", desc = "Rename file" },
	-- 		{ "<leader>Cg", "<cmd>TypescriptGoToSourceDefinition<cr>", desc = "Go to source definition" },
	-- 	},
	-- },

	{ "ayu-theme/ayu-vim" },
	{ "lunarvim/horizon.nvim" },
	{ "lunarvim/lunar.nvim" },
	{ "morhetz/gruvbox" },
	{ "sainnhe/edge" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/sonokai" },
	{ "tomasr/molokai" },

	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},

	{ "felipec/vim-sanegx", event = "BufRead" },
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup({
				-- dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
				dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
				options = { "buffers", "curdir", "tabpages", "winsize" },
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},

	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },

	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "jj" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
				-- example(recommended)
				-- keys = function()
				--   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
				-- end,
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui" },
			{ "theHamsta/nvim-dap-virtual-text", config = true },
		},
	},
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},

	-- nvim-colorizer (color highlighter)
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes,
				names = true, -- "Name" codes like Blue
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				mode = "background", -- Set the display mode
			})
		end,
	},
	{
		"nvim-telescope/telescope-project.nvim",
		event = "BufWinEnter",
		config = function()
			require("telescope").load_extension("project")
		end,
		-- init = function()
		-- 	vim.cmd([[packadd telescope.nvim]])
		-- end,
	},
	{
		-- view treesitter information
		"nvim-treesitter/playground",
		event = "BufRead",
	},

	-- {
	-- 	"phaazon/hop.nvim",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("hop").setup()
	-- 		vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
	-- 		vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
	-- 	end,
	-- },
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup({
				-- keys = function()
				-- 	vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
				-- 	vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
				--end,
			})
			vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
			vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })

			local hop = require("hop")
			local directions = require("hop.hint").HintDirection
			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "t", function()
				hop.hint_char1({
					direction = directions.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end, { remap = true })
			vim.keymap.set("", "T", function()
				hop.hint_char1({
					direction = directions.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = 1,
				})
			end, { remap = true })
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			local api = require("typescript-tools.api")
			require("typescript-tools").setup({
				handlers = {
					["textDocument/publishDiagnostics"] = api.filter_diagnostics(
						-- Ignore 'This may be converted to an async function' diagnostics.
						{ 6133, 80001 }
					),
				},
			})
		end,
		keys = {
			{ "<leader>C", desc = "TS Tools" },
			{ "<leader>Ca", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
			{ "<leader>Co", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
			{ "<leader>Cs", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
			{ "<leader>Ci", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
			{ "<leader>Cu", "<cmd>TSToolsRemoveUnused<cr>", desc = "Remove Unused Statements" },
			{ "<leader>Cf", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
			{ "<leader>Cr", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
			{ "<leader>Cg", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go To Source Definition" },
		},
	},

	{ "rafamadriz/friendly-snippets" },
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- You can use "default_mappings = true" setup option
				-- Or explicitly set keybindings
				-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
				-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
				-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
			})
		end,
	},
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				throttle = true, -- Throttles plugin updates (may improve performance)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
					-- For all filetypes
					-- Note that setting an entry here replaces all other patterns for this entry.
					-- By setting the 'default' entry below, you can control which nodes you want to
					-- appear in the context window.
					default = {
						"class",
						"function",
						"method",
					},
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		opts = {},
	},
	-- diffview -- added on 20230119
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		"stevearc/dressing.nvim",
		opts = {
			input = { enabled = false },
		},
	},

	{ "ThePrimeagen/harpoon" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },

	{
		"windwp/nvim-spectre",
		event = "BufRead",
		config = function()
			require("spectre").setup()
		end,
	},
	{
		-- nvim-ts-autotag (autoclose and autorename html tags)
		"windwp/nvim-ts-autotag",
		-- event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
	},

	-- {
	-- 	"AckslD/nvim-trevJ.lua",
	-- 	config = 'require("trevj").setup()',
	-- 	init = function()
	-- 		vim.keymap.set("n", "<leader>j", function()
	-- 			require("trevj").format_at_cursor()
	-- 		end)
	-- 	end,
	-- },
	{
		"Wansmer/treesj",
		keys = {
			{ "<leader>J", desc = "Join" },
			{ "<leader>Jm", "<cmd>TSJToggle<cr>", desc = "Trees toggle" },
			{ "<leader>Jj", "<cmd>TSJJoin<cr>", desc = "Trees join" },
			{ "<leader>Js", "<cmd>TSJSplit<cr>", desc = "Trees split" },
		},
		-- keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({
				--[[ your config ]]
			})
		end,
	},
}

table.insert(lvim.plugins, {
	"zbirenbaum/copilot-cmp",
	event = "InsertEnter",
	dependencies = { "zbirenbaum/copilot.lua" },
	config = function()
		local ok, cmp = pcall(require, "copilot_cmp")
		if ok then
			cmp.setup({})
		end
	end,
})

lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "frecency")
end
