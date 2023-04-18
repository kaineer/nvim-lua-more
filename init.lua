-- init.lua

local paths = { "options", "autocmds", "bindings", "plugins" }
require("kaineer.fn").forEach(paths, require)
