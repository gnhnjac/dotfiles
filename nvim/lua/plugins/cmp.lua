local cmp = require("cmp")

cmp.setup({
  completion = {
    autocomplete = false,
    completeopt = "menu,menuone,noinsert",
    keyword_length = 2,
  },
  performance = {
    max_view_entries = 5, -- Limit number of suggestions
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

-- 1. Create a toggle function
local function toggle_auto_popup()
  -- Check the current config state
  local current_setting = cmp.get_config().completion.autocomplete
  
  if current_setting and #current_setting > 0 then
    -- If currently ON, turn it OFF
    cmp.setup({
      completion = {
        autocomplete = false
      }
    })
    print("Autocomplete: Manual Mode (<C-Space> to trigger)")
  else
    -- If currently OFF, turn it ON (reset to default events)
    cmp.setup({
      completion = {
        autocomplete = {
          require('cmp.types').cmp.TriggerEvent.InsertEnter,
          require('cmp.types').cmp.TriggerEvent.TextChanged,
        }
      }
    })
    print("Autocomplete: Auto-Popup Mode")
  end
end

-- 2. Bind it to a key (e.g., Leader + ta)
vim.keymap.set('n', '<Leader>ta', toggle_auto_popup, { desc = "Toggle Autocomplete Popup" })
