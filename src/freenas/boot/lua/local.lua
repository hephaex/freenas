local config = require("config")
local hook = require("hook")

local function debugModules()
	if loader.getenv("kernel") == "kernel-debug" then
		config.parse("openzfs_load=NO")
		config.parse("openzfs-debug_load=YES")
	else
		config.parse("openzfs_load=YES")
		config.parse("openzfs-debug_load=NO")
	end
end

hook.register("kernel.loaded", debugModules)
