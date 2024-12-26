return {
	"robitx/gp.nvim",
	lazy = true,
	config = function()
		local conf = {
			openai_api_key = { "cat", "/Users/ebbec/dev/chatgpt.txt" },
		}
		require("gp").setup(conf)
	end,
	keys = {
      { "<leader>cp", "<cmd>GpChatToggle<cr>", desc = "Toggle other chatGpt" },
    },
}
