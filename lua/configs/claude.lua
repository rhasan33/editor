require("claudecode").setup({
  auto_start = true,
  track_selection = true,
  terminal = {
    split_side = "right",
    split_width_percentage = 0.30,
    provider = "snacks",
    auto_close = true,
  },
  diff_opts = {
    layout = "vertical",
  },
})
