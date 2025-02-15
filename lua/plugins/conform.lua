return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters = {
                prettier = {
                    prepend_args = {
                        "--tab-width",
                        "4",
                        "--use-tabs",
                        "false",
                        "--print-width",
                        "9999",
                        "--prose-wrap",
                        "never",
                        "--html-whitespace-sensitivity",
                        "strict",
                        "--bracket-same-line",
                        "true",
                    },
                },
            },
            formatters_by_ft = {
                html = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                css = { "prettier" },
            },
        },
    },
}
