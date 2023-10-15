-- User Config for predefined plugins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true -- false is the default value. changed on 20220702
lvim.builtin.dap.active = true

lvim.builtin.telescope.active = true
lvim.builtin.project.active = true
-- lvim.builtin.telescope.extensions = { "frecency", "project" }

lvim.builtin.treesitter.context_commentstring = {
	enable = true,
	config = {
		javascript = {
			__default = "// %s",
			__multiline = "/* %s */",
			jsx_element = "{/* %s */}",
			jsx_fragment = "{/* %s */}",
			jsx_attribute = "// %s",
			comment = "// %s",
		},
		json = { __default = "// %s", __multiline = "/* %s */" },
		typescript = { __default = "// %s", __multiline = "/* %s */" },
	},
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.ignore_install = { }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true -- enable treesitter rainbow

lvim.builtin.project.detection_methods = { "lsp", "pattern" }
lvim.builtin.project.patterns = {
	".git",
	"package-lock.json",
	"yarn.lock",
	"package.json",
	"requirements.txt",
}

lvim.builtin.telescope.defaults.path_display = {
	shorten = 4,
}

-- lvim.builtin.treesitter.autotag.enable = true
-- lvim.builtin.telescope.active = true
-- lvim.builtin.gitsigns.active = true
-- lvim.builtin.which_key.active = true
-- lvim.builtin.comment.active = true
-- lvim.builtin.project.active = true
-- lvim.builtin.nvimtree.setup.git.enable = true

-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
-- lvim.builtin
