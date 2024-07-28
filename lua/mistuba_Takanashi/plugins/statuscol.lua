return{
  "luukvbaal/statuscol.nvim", config = function()
  local builtin = require("statuscol.builtin")
  local statuscol_config = {
    setopt = true,
    thousands = false,
    relculright = false,
    ft_ignore = nil,
    bt_ignore = nil,
    segments = {
      {
        text = { builtin.lnumfunc },
        condition = { true, builtin.not_empty },
        click = "v:lua.ScLa",
      },
      {
        text = { "%s" },
        condition = { true, builtin.not_empty },
        click = "v:lua.ScSa"
      },
      { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    },
    clickmod = "c",         -- modifier used for certain actions in the builtin clickhandlers:
                            -- "a" for Alt, "c" for Ctrl and "m" for Meta.
    clickhandlers = {       -- builtin click handlers
      Lnum                    = builtin.lnum_click,
      FoldClose               = builtin.foldclose_click,
      FoldOpen                = builtin.foldopen_click,
      FoldOther               = builtin.foldother_click,
      DapBreakpointRejected   = builtin.toggle_breakpoint,
      DapBreakpoint           = builtin.toggle_breakpoint,
      DapBreakpointCondition  = builtin.toggle_breakpoint,
      ["diagnostic/signs"]    = builtin.diagnostic_click,
      gitsigns                = builtin.gitsigns_click,
    },
  }
  require("statuscol").setup(statuscol_config)
  end,
}
