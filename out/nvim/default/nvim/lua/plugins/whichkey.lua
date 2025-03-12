return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>bdd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete buffer",
    },
    {
      "<leader>bda",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Delete all buffers",
    },
  },
}
