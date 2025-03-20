return {
  {
    "maxmx03/fluoromachine.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local fm = require "fluoromachine"

      fm.setup {
        glow = true,
        theme = "fluoromachine",
        transparent = true,
        colors = function(_, color)
          local darken = color.darken
          local lighten = color.lighten
          local blend = color.blend
          local shade = color.shade
          local tint = color.tint
          return {
            bg = "#190920",
            bgdark = darken("#190920", 20),
            cyan = "#00fff6",
            red = "#ff0571",
            yellow = "#19ee04",
            orange = "#ff6f00",
            pink = "#ff00ff",
            purple = "#aa00ff",
          }
        end,
        overrides = {
          ["@type"] = { italic = true, bold = true },
          ["@function"] = { italic = true, bold = true },
          ["@comment"] = { italic = true },
          ["@keyword"] = { italic = false },
          ["@constant"] = { italic = false, bold = false },
          ["@variable"] = { italic = true },
          ["@field"] = { italic = true },
          ["@parameter"] = { italic = true, bold = true },
        },
      }

      vim.cmd.colorscheme "fluoromachine"
    end,
  },
}
