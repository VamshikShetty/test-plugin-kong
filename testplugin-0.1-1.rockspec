package = "testplugin"
version = "0.1-1"

local plugin_name = "testplugin"

source = {
  url = "http://github.com/VamshikShetty/test-plugin-kong",
  tag = "0.1.0"
}

dependencies = {
}


build = {
  type = "builtin",
  modules = {
    -- TODO: add any additional code files added to the plugin
    ["kong.plugins."..plugin_name..".handler"] = "kong/plugins/"..plugin_name.."/handler.lua",
    ["kong.plugins."..plugin_name..".schema"] = "kong/plugins/"..plugin_name.."/schema.lua",
  }
}