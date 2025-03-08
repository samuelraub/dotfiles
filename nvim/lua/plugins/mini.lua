return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.operators").setup({
      replace = {
        prefix = "rr",
        reindent_linewise = true,
      },
    })
    require("mini.ai").setup()
    require("mini.jump").setup()

    local jump2d = require("mini.jump2d")
    local jump_line_start = jump2d.builtin_opts.line_start
    jump2d.setup({
      labels = "abcdefghijklmnopqrstuvwxyz",
      spotter = jump_line_start.spotter,
      hooks = { after_jump = jump_line_start.hooks.after_jump },
      silent = true,
      allowed_lines = {
        blank = false,
        cursor_at = false,
      },
    })
  end,
}
