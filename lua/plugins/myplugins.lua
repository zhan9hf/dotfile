return {
	{ "morhetz/gruvbox" },
	{ "junegunn/seoul256.vim" },
	{ "jdsimcoe/abstract.vim" },
	{ "joshdick/onedark.vim" },

	-- 加载 colorscheme
	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "onedark",
			colorscheme = "tokyonight",
		},
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
		config = true,
		keys = {
			{
				"<leader>gg",
				"<cmd>Neogit cwd=%:p:h<cr>",
				desc = "Neogit root",
			},
			{ "<leader>gG", "<cmd>Neogit<cr>", desc = "Neogit current" },
		},
	},

	-- change trouble config
	{
		"folke/trouble.nvim",
		-- opts will be merged with the parent spec
		opts = { use_diagnostic_signs = true },
	},

	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"vimwiki/vimwiki",
		init = function()
			vim.g.vimwiki_list = {
				{
					path = "~/vimwiki/",
					syntax = "markdown",
					ext = ".md",
					index = "index",
					path_html = "~/vimwiki_html/",
					template_path = "~/vimwiki/templates/",
					template_default = "default",
					template_ext = ".md",
					table_mappings = 0,
				},
			}
			vim.g.vimwiki_global_ext = 0
		end,
		keys = { {
			"<leader>ww",
			"<cmd>VimwikiIndex<cr>",
			desc = "Vimwiki Index",
		} },
	},

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		config = true,
	},

	{
		"nvim-telescope/telescope.nvim",
		keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
		},
		-- change some options
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},

	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.default_timeout = -1
			opts.sources = opts.sources or {}
			vim.list_extend(opts.sources, {
				nls.builtins.formatting.cmake_format.with({ timeout = -1 }),
			})
		end,
	},

	{
		"echasnovski/mini.starter",
		opts = {
			header = table.concat({
				"███████╗██╗  ██╗ █████╗ ███╗   ██╗ ██████╗ ██╗  ██╗███████╗",
				"╚══███╔╝██║  ██║██╔══██╗████╗  ██║██╔════╝ ██║  ██║██╔════╝",
				"  ███╔╝ ███████║███████║██╔██╗ ██║██║  ███╗███████║█████╗  ",
				" ███╔╝  ██╔══██║██╔══██║██║╚██╗██║██║   ██║██╔══██║██╔══╝  ",
				"███████╗██║  ██║██║  ██║██║ ╚████║╚██████╔╝██║  ██║██║     ",
				"╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ",
			}, "\n"),
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				bashls = {},
				beancount = {},
				cssls = {},
				cssmodules_ls = {},
				denols = {},
				gradle_ls = {},
				html = {},
				kotlin_language_server = {},
				lemminx = {},
				marksman = {},
				neocmake = {
					init_options = {
						format = {
							enable = false,
						},
					},
				},
				sqlls = {},
				taplo = {},
				vimls = {},
			},
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
			{ "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
		},
		opts = function(_, opts)
			opts.close_if_last_window = true -- Close Neo-tree if it is the last window left in the tab
			-- opts.enable_git_status = false
			opts.window = {
				width = 25,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["m"] = { "move", config = { show_path = "absolute" } }, -- takes text input for destination, also accepts the optional config.show_path option like "add".
				},
			}
		end,
	},

	{ "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
	{ "echasnovski/mini.comment", enabled = false },
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	{ "L3MON4D3/LuaSnip", enabled = false },
	{ "rafamadriz/friendly-snippets", enabled = false },
	{ "saadparwaiz1/cmp_luasnip", enabled = false },
	-- then: setup supertab in cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
			"SirVer/ultisnips",
			"quangnguyen30192/cmp-nvim-ultisnips",
			"honza/vim-snippets",
			"paopaol/cmp-doxygen",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			opts.snippet = {
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body)
				end,
			}

			opts.preselect = "None"

			local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						cmp_ultisnips_mappings.jump_backwards(fallback)
					end
				end, { "i", "s" }),
			})

			opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
				{ name = "cmp-emoji" },
				{ name = "ultisnips" },
				{ name = "doxygen" },
			}))
		end,
	},
}
