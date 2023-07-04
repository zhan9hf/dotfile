return {
	-- add gruvbox
	{ "morhetz/gruvbox" },

	-- Configure LazyVim to load colorscheme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},

	-- change trouble config
	{
		"folke/trouble.nvim",
		-- opts will be merged with the parent spec
		opts = { use_diagnostic_signs = true },
	},

	-- add symbols-outline
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		config = true,
	},

	-- change some telescope options and a keymap to browse plugin files
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

	-- add telescope-fzf-native
	-- {
	-- 	"telescope.nvim",
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 		build = "make",
	-- 		config = function()
	-- 			require("telescope").load_extension("fzf")
	-- 		end,
	-- 	},
	-- },

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"p00f/clangd_extensions.nvim",
		},
		opts = {
			servers = {
				bashls = {},
				beancount = {},
				clangd = { cmd = { "clangd", "--offset-encoding=utf-16" } },
				clojure_lsp = {},
				cssls = {},
				cssmodules_ls = {},
				denols = {},
				docker_compose_language_service = {},
				dockerls = {},
				-- golangci_lint_ls = {},
				gradle_ls = {},
				-- groovyls = {},
				html = {},
				jsonls = {},
				kotlin_language_server = {},
				lemminx = {},
				ltex = {},
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
				marksman = {},
				cmake = {},
				-- powershell_es = {},
				pylsp = {},
				rust_analyzer = {},
				sqlls = {},
				taplo = {},
				tsserver = {},
				vimls = {},
				yamlls = {},
			},
			setup = {
				clangd = function(_, opts)
					require("clangd_extensions").setup({ server = opts })
					return true
				end,
			},
		},
	},

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				"cpp",
				"java",
				"go",
				"typescript",
			})
		end,
	},

	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = function(_, opts)
			opts.close_if_last_window = true -- Close Neo-tree if it is the last window left in the tab
			opts.window = {
				width = 32,
				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
					},
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "revert_preview",
					["P"] = { "toggle_preview", config = { use_float = true } },
					["l"] = "open",
					["h"] = "close_node",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["w"] = "open_with_window_picker",
					["C"] = "close_node",
					["z"] = "close_all_nodes",
					["a"] = {
						"add",
						-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
						-- some commands may take optional config options, see `:h neo-tree-mappings` for details
						config = {
							show_path = "none", -- "none", "relative", "absolute"
						},
					},
					["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
					-- ["c"] = {
					--  "copy",
					--  config = {
					--    show_path = "none" -- "none", "relative", "absolute"
					--  }
					--}
					["m"] = { "move", config = { show_path = "absolute" } }, -- takes text input for destination, also accepts the optional config.show_path option like "add".
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
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

	{ "ggandor/flit.nvim", enabled = false },
	{ "ggandor/leap.nvim", enabled = false },
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("hop").setup()
			local hop = require("hop")
			local directions = require("hop.hint").HintDirection
			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
			end, { remap = true })
			vim.keymap.set("", "t", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end, { remap = true })
			vim.keymap.set("", "T", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			end, { remap = true })
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

			opts.sources = cmp.config.sources({
				{ name = "cmp-emoji" },
				{ name = "nvim_lsp" },
				{ name = "ultisnips" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "doxygen" },
				{ name = "copilot" },
			})
		end,
	},
}
