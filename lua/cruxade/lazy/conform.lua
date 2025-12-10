return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        -- Lua
        lua = { "stylua" },
        
        -- Python
        python = { "black", "isort" },
        
        -- JavaScript/TypeScript
        javascript = { "prettier" },
        typescript = { "prettier" },
        
        -- Vue (JavaScript/TypeScript in .vue files)
        vue = { "prettier" },
        
        -- Web
        html = { "prettier" },
        css = { "prettier" },
        
        -- Config/data formats
        json = { "prettier" },
        yaml = { "prettier" },
        
        -- SQL (using sqlfmt or pg_format - choose one)
        sql = { "sqlfmt" }, -- or "pg_format"
        
        -- Docker
        dockerfile = { "hadolint" }, -- hadolint is a linter, for formatting use dockerfile-lint or rely on LSP
        
        -- Bash/Shell scripting
        bash = { "shfmt" },
        sh = { "shfmt" },
        
        -- Vim script
        vim = { "vimlint" }, -- vimlint is a linter; vimscript formatting is limited
        
        -- Gitignore (no specific formatter usually)
        -- gitignore = {}, -- LSP fallback or no formatting
        
        -- Vim documentation
        vimdoc = {}, -- LSP fallback
      },
      
      -- Optional: Configure formatter options
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" }, -- 2 spaces, indent case statements
        },
        sqlfmt = {
          prepend_args = { "--use-spaces", "--indent-width", "2" },
        },
        -- prettier can be configured with .prettierrc file
      },
    })

    -- Keymap for manual formatting
    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format file or range" })
  end,
}
