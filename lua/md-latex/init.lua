local M = {}

M.config = {
	enabled = true,
	message = "test",
}

M.setup = function(config)
	config = config or {}
	M.config = vim.tbl_deep_extend("force", M.config, config)
end

M.say_hello = function()
	if M.config.enabled then
		print(M.config.message)
	else
		print("plugin is disabled")
	end
end

vim.schedule(function()
	vim.api.nvim_create_user_command("MyPluginHello", function()
		M.say_hello()
	end, {})
end)

return M
