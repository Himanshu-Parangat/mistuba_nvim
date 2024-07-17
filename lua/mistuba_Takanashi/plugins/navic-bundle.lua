return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  opts = { lsp = { auto_attach = true } },
  config = function ()
    local navbuddy = require("nvim-navbuddy")
    local actions = require("nvim-navbuddy.actions")
    local custome_icons = {
        --   פּ ﯟ   some other good icons
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = 'm ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = "󰊕 ",
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = '󰎠 ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = '󰌋 ',
        Null = '󰟢 ',
        EnumMember = ' ',
        Struct = '󰌗 ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
    }

    navbuddy.setup {
        window = {
            border = "rounded",  -- "single" "rounded", "double", "solid", "none"
                                -- or an array with eight chars building up the border in a clockwise fashion
                                -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
            size = "80%",       -- Or table format example: { height = "40%", width = "100%"}
            position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
            scrolloff = nil,    -- scrolloff value within navbuddy window
            sections = {
                left = {
                    size = "20%",
                    border = nil, -- You can set border style for each section individually as well.
                },
                mid = {
                    size = "40%",
                    border = nil,
                },
                right = {
                    -- No size option for right most section. It fills to
                    -- remaining area.
                    border = nil,
                    preview = "leaf",  -- Right section can show previews too.
                                       -- Options: "leaf", "always" or "never"
                }
            },
        },
        node_markers = {
            enabled = true,
            icons = {
                leaf = "  ",
                leaf_selected = " → ",
                branch = " ",
            },
        },
        icons = custome_icons,
        use_default_mappings = true,            -- If set to false, only mappings set
                                                -- by user are set. Else default
                                                -- mappings are used for keys
                                                -- that are not set by user
        mappings = {
            ["<esc>"] = actions.close(),        -- Close and cursor to original location
            ["q"] = actions.close(),

            ["j"] = actions.next_sibling(),     -- down
            ["k"] = actions.previous_sibling(), -- up

            ["h"] = actions.parent(),           -- Move to left panel
            ["l"] = actions.children(),         -- Move to right panel
            ["0"] = actions.root(),             -- Move to first panel

            ["v"] = actions.visual_name(),      -- Visual selection of name
            ["V"] = actions.visual_scope(),     -- Visual selection of scope

            ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
            ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

            ["i"] = actions.insert_name(),      -- Insert at start of name
            ["I"] = actions.insert_scope(),     -- Insert at start of scope

            ["a"] = actions.append_name(),      -- Insert at end of name
            ["A"] = actions.append_scope(),     -- Insert at end of scope

            ["r"] = actions.rename(),           -- Rename currently focused symbol

            ["d"] = actions.delete(),           -- Delete scope

            ["f"] = actions.fold_create(),      -- Create fold of current scope
            ["F"] = actions.fold_delete(),      -- Delete fold of current scope

            ["c"] = actions.comment(),          -- Comment out current scope

            ["<enter>"] = actions.select(),     -- Goto selected symbol
            ["o"] = actions.select(),

            ["J"] = actions.move_down(),        -- Move focused node down
            ["K"] = actions.move_up(),          -- Move focused node up

            ["s"] = actions.toggle_preview(),   -- Show preview of current node

            ["<C-v>"] = actions.vsplit(),       -- Open selected node in a vertical split
            ["<C-s>"] = actions.hsplit(),       -- Open selected node in a horizontal split

            ["t"] = actions.telescope({         -- Fuzzy finder at current level.
                layout_config = {               -- All options that can be
                    height = 0.60,              -- passed to telescope.nvim's
                    width = 0.60,               -- default can be passed here.
                    prompt_position = "top",
                    preview_width = 0.50
                },
                layout_strategy = "horizontal"
            }),

            ["g?"] = actions.help(),            -- Open mappings help window
        },
        lsp = {
            auto_attach = true,   -- If set to true, you don't need to manually use attach function
            preference = nil,      -- list of lsp server names in order of preference
        },
        source_buffer = {
            follow_node = true,    -- Keep the current node in focus on the source buffer
            highlight = true,      -- Highlight the currently focused node
            reorient = "smart",    -- "smart", "top", "mid" or "none"
            scrolloff = nil        -- scrolloff value when navbuddy is open
        },
      custom_hl_group = nil,     -- "Visual" or any other hl group to use instead of inverted colors
    }


    local navic = require("nvim-navic")

    navic.setup {
    icons = custome_icons,
    lsp = {
        auto_attach = true,
        preference = nil,
    },
    highlight = true,
    separator = "  ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false,
    format_text = function(text)
        return text
    end,
    }

    vim.o.winbar = " %{%v:lua.require'nvim-navic'.get_location()%}"

    -- vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicText",               {default = true, bg = "", fg = "#ffffff"})
    -- vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, bg = "", fg = "#ffffff"})


  end
}

