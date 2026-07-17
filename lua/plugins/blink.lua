return {
    "saghen/blink.cmp",

    version = "1.*",

    dependencies = {
        "rafamadriz/friendly-snippets",
    },

    opts = {
        -------------------------------------------------
        -- Keymaps
        -------------------------------------------------

        keymap = {
            preset = "default",
        },

        -------------------------------------------------
        -- Appearance
        -------------------------------------------------

        appearance = {
            nerd_font_variant = "mono",
        },

        -------------------------------------------------
        -- Completion
        -------------------------------------------------

        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },

            menu = {
                border = "rounded",
                min_width = 18,
                max_height = 10,
                scrolloff = 2,
                scrollbar = false,

                draw = {
                    padding = {
                        1,
                        1,
                    },

                    columns = {
                        {
                            "kind_icon",
                            gap = 1,
                        },
                        {
                            "label",
                            "label_description",
                            gap = 1,
                        },
                        {
                            "source_name",
                        },
                    },

                    components = {
                        source_name = {
                            text = function(ctx)
                                return "[" .. ctx.source_name .. "]"
                            end,

                            highlight = "BlinkCmpSource",
                        },
                    },
                },
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 350,
                update_delay_ms = 50,

                window = {
                    border = "rounded",
                    max_width = 60,
                    max_height = 18,
                },
            },

            ghost_text = {
                enabled = false,
            },
        },

        -------------------------------------------------
        -- Signature help
        -------------------------------------------------

        signature = {
            enabled = true,

            window = {
                border = "rounded",
            },
        },

        -------------------------------------------------
        -- Sources
        -------------------------------------------------

        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
            },
        },
    },
}
