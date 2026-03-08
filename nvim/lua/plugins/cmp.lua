local cmp = require("cmp")

cmp.setup({
  completion = {
    -- FIX 1: Use the table of trigger events instead of 'true'
    autocomplete = {
      require('cmp.types').cmp.TriggerEvent.TextChanged,
    },
    completeopt = "menu,menuone,noinsert",
    keyword_length = 2,
  },
  performance = {
    max_view_entries = 5,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
  }),
})

-- Specific config for codecompanion to fix the autocomplete
cmp.setup.filetype("codecompanion", {
  completion = {
    keyword_length = 1,
  },
})

-- 2. Corrected Toggle Function
local function toggle_auto_popup()
  local current_setting = cmp.get_config().completion.autocomplete
  
  -- Check if autocomplete is currently enabled (it will be a table, not 'true')
  if current_setting and type(current_setting) == "table" then
    cmp.setup({
      completion = {
        autocomplete = false
      }
    })
    print("Autocomplete: Manual Mode (<C-Space> to trigger)")
  else
    cmp.setup({
      completion = {
        autocomplete = {
          require('cmp.types').cmp.TriggerEvent.TextChanged,
        }
      }
    })
    print("Autocomplete: Auto-Popup Mode")
  end
end

-- 3. Binding to <leader>ta
vim.keymap.set("n", "<leader>ta", toggle_auto_popup, { desc = "Toggle Autocomplete" })


