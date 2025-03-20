-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.colorscheme.aurora" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.fluoromachine-nvim" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.color.ccc-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.editing-support/rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support/nvim-regexplainer" },
  { import = "astrocommunity.editing-support/vim-move" },
  { import = "astrocommunity.editing-support/vim-visual-multi" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.indent.indent-rainbowline" },
  { import = "astrocommunity.syntax.vim-cool" },
  { import = "astrocommunity.syntax.vim-sandwich" },
  -- { import = "astrocommunity.colorscheme.nightfox-nvim" },
  -- { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  -- { import = "astrocommunity.editing-support/zen-mode-nvim" },
  -- { import = "astrocommunity.editing-support/ultimate-autopair-nvim" },
  -- { import = "astrocommunity.color.twilight-nvim" },
  -- import/override with your plugins folder
  -- { import = "astrocommunity.color.modes-nvim" },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
}
