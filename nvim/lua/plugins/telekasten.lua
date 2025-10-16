return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/logseq"),
      dailies = vim.fn.expand("~/logseq/journals"),
      weeklies = vim.fn.expand("~/logseq/journals"),
      templates = vim.fn.expand("~/logseq/templates"),
      image_subdir = "assets",
      extension = ".md",
      new_note_filename = "title",
      uuid_type = "%Y%m%d%H%M",
      uuid_sep = "-",
      follow_creates_nonexisting = true,
      dailies_create_nonexisting = true,
      weeklies_create_nonexisting = true,
      journal_auto_open = false,
      template_new_note = vim.fn.expand("~/logseq/templates/new_note.md"),
      template_new_daily = vim.fn.expand("~/logseq/templates/daily.md"),
      template_new_weekly = vim.fn.expand("~/logseq/templates/weekly.md"),
      image_link_style = "markdown",
      sort = "filename",
      plug_into_calendar = true,
      calendar_opts = {
        weekstart = "sunday",
        calendar_monday = 0,
        calendar_mark = "left-fit",
      },
      close_after_yanking = false,
      insert_after_inserting = true,
      tag_notation = "#tag",
      command_palette_theme = "dropdown",
      show_tags_theme = "dropdown",
      subdirs_in_links = true,
      template_handling = "smart",
      new_note_location = "smart",
      filename_space_subst = "-",
    })

    -- Keymaps
    local map = vim.keymap.set
    map("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", { desc = "Find notes" })
    map("n", "<leader>zd", "<cmd>Telekasten find_daily_notes<CR>", { desc = "Find daily notes" })
    map("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", { desc = "Search in notes" })
    map("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", { desc = "Follow link" })
    map("n", "<leader>zT", "<cmd>Telekasten goto_today<CR>", { desc = "Today's note" })
    map("n", "<leader>zW", "<cmd>Telekasten goto_thisweek<CR>", { desc = "This week's note" })
    map("n", "<leader>zw", "<cmd>Telekasten find_weekly_notes<CR>", { desc = "Find weekly notes" })
    map("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { desc = "New note" })
    map("n", "<leader>zN", "<cmd>Telekasten new_templated_note<CR>", { desc = "New templated note" })
    map("n", "<leader>zy", "<cmd>Telekasten yank_notelink<CR>", { desc = "Yank note link" })
    map("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { desc = "Show calendar" })
    map("n", "<leader>zi", "<cmd>Telekasten paste_img_and_link<CR>", { desc = "Paste image and link" })
    map("n", "<leader>zt", "<cmd>Telekasten toggle_todo<CR>", { desc = "Toggle todo" })
    map("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", { desc = "Show backlinks" })
    map("n", "<leader>zF", "<cmd>Telekasten find_friends<CR>", { desc = "Find friends" })
    map("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", { desc = "Insert image link" })
    map("n", "<leader>zp", "<cmd>Telekasten preview_img<CR>", { desc = "Preview image" })
    map("n", "<leader>zm", "<cmd>Telekasten browse_media<CR>", { desc = "Browse media" })
    map("n", "<leader>za", "<cmd>Telekasten show_tags<CR>", { desc = "Show tags" })
    map("n", "<leader>zr", "<cmd>Telekasten rename_note<CR>", { desc = "Rename note" })

    -- Insert mode mappings
    map("i", "[[", "<cmd>Telekasten insert_link<CR>", { desc = "Insert link" })
  end,
}