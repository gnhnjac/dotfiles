require("codecompanion").setup({
  opts = {
    log_level = "ERROR", -- This hides [WARN] messages from the prompt library
  },
  -- 1. Define your custom adapters here
  adapters = {
    -- The CLI version for Chat (\ac)
    gemini_cli = function()
      return require("codecompanion.adapters").extend("gemini_cli", {
        command = "gemini",
        args = { "--experimental-acp" },
      })
    end,
  },

  -- 2. This tells the plugin WHICH adapter to use for WHICH task
  -- Using both 'strategies' and 'adapters' handles transitions between plugin versions
  interactions = {
    chat = { 
      adapter = "gemini_cli",
      opts = {
        completion_provider = "cmp",
      },
    },
    agent = { 
      adapter = "gemini_cli",
      opts = {
        completion_provider = "cmp",
      },
    },
  },
})

