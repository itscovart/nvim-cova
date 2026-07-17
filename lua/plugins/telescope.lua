local colors = require("core.colors")

return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                -------------------------------------------------
                -- Layout
                -------------------------------------------------

                layout_strategy = "horizontal",

                layout_config = {
                    width = 0.82,
                    height = 0.72,

                    prompt_position = "top",

                    horizontal = {
                        preview_width = 0.55,
                    },
                },

                sorting_strategy = "ascending",

                -------------------------------------------------
                -- Appearance
                -------------------------------------------------

                prompt_prefix = "❯ ",
                selection_caret = "▍ ",
                entry_prefix = "  ",

                border = true,

                borderchars = {
                    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                },

                winblend = 0,

                -------------------------------------------------
                -- Preview
                -------------------------------------------------

                preview = {
                    treesitter = true,
                    hide_on_startup = false,
                },

                -------------------------------------------------
                -- Filtering
                -------------------------------------------------

                file_ignore_patterns = {
                    ".git/",
                    "node_modules/",
                    "__pycache__/",
                    ".venv/",
                    "venv/",
                },

                path_display = {
                    "truncate",
                },

                -------------------------------------------------
                -- Keymaps
                -------------------------------------------------

                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<C-u>"] = actions.preview_scrolling_up,

                        ["<Esc>"] = actions.close,
                    },

                    n = {
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,

                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,

                        ["q"] = actions.close,
                    },
                },
            },

            pickers = {
                find_files = {
                    hidden = true,
                    previewer = true,
                },

                buffers = {
                    previewer = false,
                    initial_mode = "normal",
                    sort_mru = true,
                    ignore_current_buffer = true,

                    layout_config = {
                        width = 0.62,
                        height = 0.48,
                    },
                },

                oldfiles = {
                    previewer = false,

                    layout_config = {
                        width = 0.68,
                        height = 0.56,
                    },
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },
        })

        -------------------------------------------------
        -- Load FZF
        -------------------------------------------------

        telescope.load_extension("fzf")

        -------------------------------------------------
        -- Keymaps
        -------------------------------------------------

        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({
                hidden = true,
                previewer = true,
            })
        end, {
            desc = "Find files",
        })

        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
            desc = "Live grep",
        })

        vim.keymap.set("n", "<leader>fb", builtin.buffers, {
            desc = "Buffers",
        })

        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
            desc = "Help tags",
        })

        vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
    end,
}
