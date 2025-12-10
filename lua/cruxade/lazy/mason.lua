-- plugins/mason.lua
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Your LSP servers from lsp.lua
      "pyright",
      "tsserver",
      "html",
      "cssls",
      "eslint", 
      "jsonls",
      "yamlls",
      "dockerls",
      "bashls",
      "sqlls",
      "lua_ls",
      
      -- Formatters you need
      "stylua",
      "black",
      "prettier",
      "shfmt",
      "sqlfmt",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
  end,
}
