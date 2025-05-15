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

    local gen_loader = require("mini.snippets").gen_loader
    require("mini.snippets").setup({
      snippets = {
        -- Load custom file with global snippets first (adjust for Windows)
        gen_loader.from_file("~/.config/nvim/snippets/global.json"),

        -- Load snippets based on current language by reading files from
        -- "snippets/" subdirectories from 'runtimepath' directories.
        gen_loader.from_lang(),
      },
    })
  end,
}
