local client = vim.lsp.start_client({
	name = "toylsp",
	cmd = { "/home/harrison/Laboratory/toy-lsp/main" },
	on_attach = function() end,
})

if not client then
	vim.notify("lsp client did not work")
	return
end

vim.api.nvim_create_autocmd("Filetype", {
	pattern = "markdown",
	callback = function()
		vim.lsp.buf_attach_client(0, client)
	end,
})
