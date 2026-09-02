-- Oracle PL/SQL.
--
-- `.sql` files are pointed at Neovim's bundled "plsql" filetype (legacy
-- regex syntax/ftplugin, maintained upstream specifically for Oracle)
-- instead of generic "sql". No treesitter parser or LSP exists for
-- "plsql", which is deliberate here: sqlls/sqls only attach to the
-- "sql"/"mysql" filetypes, so giving Oracle files their own filetype
-- keeps those (and any convention/style diagnostics they'd raise) from
-- ever attaching, and since no formatter is mapped for "plsql" below,
-- conform's format-on-save has nothing to run against these buffers either.
vim.g.filetype_sql = "plsql"
vim.g.sql_type_default = "sqloracle"

return {}
