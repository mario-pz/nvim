return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "flake8" },
            dockerfile = { "hadolint" },
            c = { "cpplint" },
            cpp = { "cpplint" },
            java = { "checkstyle" },
            lua = { "luacheck" },
            go = { "golangcilint" },
            html = { "htmlhint" },
            css = { "stylelint" },
            markdown = { "markdownlint" },
            yaml = { "yamllint" },
            json = { "jsonlint" },
            vim = { "vint" },
            shell = { "shellcheck" },
            makefile = { "checkmake" },
            sh = { "shellcheck" },
            terraform = { "tflint" },
        }

        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
