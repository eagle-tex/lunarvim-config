local lvim_lsp = require("lvim.lsp")
local ts = require("typescript")
-- local tt = require("typescript-tools")

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
	--"sumneko_lua",
	-- "json",
	"cssls",
	"emmet_ls",
	"html",
	"jsonls",
	"lua_ls",
	"pyright",
	"tailwindcss",
	"tsserver",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)
-- added on 2023/09/22 to fix `css: @unknown rule` in css files
-- https://www.reddit.com/r/lunarvim/comments/w50jfk/need_help_with_fixing_unknown_at_rules_in_css/https://www.reddit.com/r/lunarvim/comments/w50jfk/need_help_with_fixing_unknown_at_rules_in_css/
require("lvim.lsp.manager").setup("cssls", {
	settings = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
		scss = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
		less = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
})
-- end of addition of 2023/09/22

-- require("lvim.lsp.manager").setup("tsserver", {
-- 	on_attach = function(client, bufnr)
-- 		require("nvim-lsp-ts-utils").setup({
-- 			filter_out_diagnostics_by_code = { 80001, 6133 },
-- 		})
-- 		-- the 3 lines below (commented out) have been added 20230216 - if not used, delete them
-- 		client.server_capabilities.document_formatting = false
-- 		local settings = { format = { enable = false } }
-- 		settings.format.enable = false
-- 		require("nvim-lsp-ts-utils").setup_client(client)
-- 	end,
-- })

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "emmet_ls"
end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- configure tsserver server manually.
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local common_on_attach = lvim_lsp.common_on_attach
local common_capabilities = lvim_lsp.common_capabilities()

lvim.lsp.on_attach_callback = function(client, bufnr)
	if lvim.colorscheme == "gruvbox" then
		-- change coloring of errors so I can actually read them with gruvbox
		vim.cmd(":hi DiagnosticError guifg=#de5b64 guibg=#1C1C1C")
		vim.cmd(":hi DiagnosticWarn guifg=DarkOrange ctermfg=DarkYellow")
		vim.cmd(":hi DiagnosticInfo guifg=Cyan ctermfg=Cyan")
		vim.cmd(":hi DiagnosticHint guifg=White ctermfg=White")
	end
end

-- Typescript config using typescript.nvim
ts.setup({
	server = {
		root_dir = require("lspconfig.util").root_pattern(".git"),
		capabilities = common_capabilities,
		on_attach = common_on_attach,
	},
})

-- Typescript config using typescript-tools.nvim -- NOT COMPLETE YET (20231015)
-- tt.setup({
-- 	server = {
-- 		root_dir = require("lspconfig.util").root_pattern(".git"),
-- 		capabilities = common_capabilities,
-- 		on_attach = common_on_attach,
-- 	},
-- 	-- on_attach = common_on_attach,
-- 	-- capabilities = common_capabilities,
-- 	-- handlers = function()
-- 	-- 	local api = require("typescript-tools.api")
-- 	-- 	require("typescript-tools").setup({
-- 	-- 		handlers = {
-- 	-- 			["textDocument/publishDiagnostics"] = api.filter_diagnostics({ 80001 }),
-- 	-- 		},
-- 	-- 	})
-- 	-- end,
-- 	-- settings = {},
-- })

-- -- Keeping this here for reference
-- require("lvim.lsp.manager").setup("tsserver", {
--   root_dir = require('lspconfig.util').root_pattern('.git'),
--   on_attach = common_on_attach,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
--   cmd = {
--     "typescript-language-server",
--     "--stdio",
--   },
-- })

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	--   { command = "isort", filetypes = { "python" } },

	-- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	{
		command = "prettierd",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		--     extra_args = { "--print-with", "100" },
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"css",
			"scss",
			"less",
			"html",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
			"handlebars",
			"json",
		},
	},
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "phpcsfixer", filetypes = { "php" } }, -- added on 20230521
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "eslint_d",
		sources = { linters.eslint_d },
		filetypes = { "javascript", "typescript", "typescriptreact", "json" },
	},
	{ command = "flake8", filetypes = { "python" } },
	--   {
	--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	--     command = "shellcheck",
	--     ---@usage arguments to pass to the formatter
	--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	--     extra_args = { "--severity", "warning" },
	--   },
	--   {
	--     command = "codespell",
	--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	--     filetypes = { "javascript", "python" },
	--   },
	{ command = "php", filetypes = { "php" } }, -- added on 20230521
})

-- -- set additional code actions
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		command = "eslint_d",
		-- exe = "eslint_d",
		sources = { code_actions.eslint_d }, -- added 20230128
		-- filetypes = { "javascript", "javascriptreact" } -- added 20230128
	},
})

-- Example using a list of specs with the default options
--vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- require("lazy").setup({
--	"folke/which-key.nvim",
--	{ "folke/neoconf.nvim", cmd = "Neoconf" },
--	"folke/neodev.nvim",
-- })

lvim.lsp.diagnostics.float.max_width = 120
-- lvim.lsp.diagnostics.float.focusable = true
-- vim.diagnostic.config({
--
-- })

lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
