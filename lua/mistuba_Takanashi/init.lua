-- Load options.lua
require("mistuba_Takanashi.setup.options")
require("mistuba_Takanashi.setup.mappings")
require("mistuba_Takanashi.setup.utils")

-- Load Icons
require("mistuba_Takanashi.icons.default")

-- lazy bootstrap
require("mistuba_Takanashi.bootstrap")
-- require("mistuba_Takanashi.completion.completion_old")
require("mistuba_Takanashi.completion.completion")
require("mistuba_Takanashi.lsp")
