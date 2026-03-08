require("codecompanion").setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "GEMINI_API_KEY", -- This points to your shell's environment variable
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "gemini",
    },
  },
})
