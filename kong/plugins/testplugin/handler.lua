local kong = kong
local kong_meta = require "kong.meta"

local Handler = {
   VERSION = "1.0.0",
   PRIORITY = 1100,
 }

function Handler:access(conf)
   kong.log.err("access called")
end

-- plugin built-in method to handle response header filtering
function Handler:header_filter(conf)
   if conf.add_header then
      kong.response.set_header("Bye-World", "this is on the response 1")
   else
      kong.response.set_header("Bye-World", "this is on the response 2")
   end
end

-- return the plugin class
return Handler