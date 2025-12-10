return {
  "mattn/calendar-vim",
  config = function()
    -- Calendar settings
    vim.g.calendar_monday = 0  -- Start week on Sunday
    vim.g.calendar_weeknm = 1  -- Show week numbers
    vim.g.calendar_mark = "left-fit"  -- Mark style
  end,
}