return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        explorer = {
          matcher = {
            fuzzy = true,
          },
        },
      },
    },
  },
}
