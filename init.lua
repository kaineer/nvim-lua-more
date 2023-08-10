-- init.lua

local fn = require("kaineer.fn")
local subpaths = { "options", "autocmds", "bindings", "plugins" }

fn.forEach(subpaths, require)
