-- Optional Neovim configuration to improve vtsls autocomplete for TanStack Router
-- Add this to your ~/.config/nvim/lua/plugins/typescript.lua

return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Extend vtsls settings for better autocomplete
      opts.servers = opts.servers or {}
      opts.servers.vtsls = vim.tbl_deep_extend("force", opts.servers.vtsls or {}, {
        settings = {
          typescript = {
            -- Enable all suggestions
            suggest = {
              enabled = true,
              completeFunctionCalls = true,
              completeStrings = true,  -- Important for string literal autocomplete
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
              includeCompletionsWithInsertText = true,
            },
            -- Preferences that might help
            preferences = {
              -- Include package.json auto imports
              includePackageJsonAutoImports = "on",
              -- Provide refactor not applicable reasons
              provideRefactorNotApplicableReason = true,
            },
          },
          -- Copy typescript settings to javascript
          javascript = {
            suggest = {
              enabled = true,
              completeFunctionCalls = true,
              completeStrings = true,
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
              includeCompletionsWithInsertText = true,
            },
            preferences = {
              includePackageJsonAutoImports = "on",
              provideRefactorNotApplicableReason = true,
            },
          },
          vtsls = {
            -- Ensure workspace TypeScript is used
            autoUseWorkspaceTsdk = true,
            -- Enable experimental features
            experimental = {
              maxInlayHintLength = 30,
              completion = {
                enableServerSideFuzzyMatch = true,
                -- Enable all completion features
                entriesLimit = 50,  -- Increase if needed
              },
            },
          },
        },
      })

      return opts
    end,
  },

  -- Ensure blink.cmp is configured to show LSP completions
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      -- Ensure LSP source is enabled and prioritized
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default or {
        { name = "lsp", priority = 1000 },
        { name = "snippets" },
        { name = "buffer" },
        { name = "path", priority = 25 },
      }

      -- Configure completion behavior
      opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
        keyword = {
          -- Trigger completion for strings
          range = "prefix",
        },
        list = {
          -- Selection behavior
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          -- Ensure LSP items are visible
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "source_name" },
            },
          },
        },
      })

      return opts
    end,
  },
}
