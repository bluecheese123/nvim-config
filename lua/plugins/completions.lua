return {

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("luasnip.loaders.from_vscode").load()
      -- If you want insert `(` after select function or method item
      local cmp = require("cmp")
      --[[local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local ts_utils = require("nvim-treesitter.ts_utils")

      local ts_node_func_parens_disabled = {
        -- ecma
        named_imports = true,
        -- rust
        use_declaration = true,
      }

      local default_handler = cmp_autopairs.filetypes["*"]["("].handler
      cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
        local node_type = ts_utils.get_node_at_cursor():type()
        if ts_node_func_parens_disabled[node_type] then
          if item.data then
            item.data.funcParensDisabled = true
          else
            char = ""
          end
        end
        default_handler(char, item, bufnr, rules, commit_character)
      end

      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done({
          sh = false,
        })
      )--]]
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expandable() then
              luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        --        formatting = {
        --          fields = { "abbr", "menu" },
        --          format = function(entry, vim_item)
        --            -- Kind icons
        --            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        --            vim_item.menu = ({
        --              luasnip = "[LSnip]",
        --              vimtex = "[VimTeX]",
        --              buffer = "[Buffer]",
        --              path = "[Path]",
        --            })[entry.source.name]
        --            return vim_item
        --          end,
        --        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }, {
          { name = "luasnip" },
          { name = "vimtex" },
          { name = "buffer" },
          { name = "path" },
        }),
        luasnip.config.set_config({ -- Setting LuaSnip config

          -- Enable autotriggered snippets
          enable_autosnippets = true,

          -- Use Tab (or some other key if you prefer) to trigger visual selection
          store_selection_keys = "<C-s>",
        }),
        completion = {
          completeopt = "menu,menuone,preview",
        },
      })
    end,
  },
}
