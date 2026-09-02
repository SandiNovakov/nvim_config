-- Generic ANSI SQL. `.sql` files are routed to the "plsql" filetype instead
-- (see cruxade.lang.plsql) so this only applies when "sql" is set explicitly.
return {
	treesitter = { "sql" },
	-- conform = {
	-- 	sql = { "sqlfluff" },
	-- },
	-- mason = {
	-- 	"sqlfluff", -- SQL formatter
	-- },
	-- lsps = {
	-- 	"sqls",
	-- },
}
