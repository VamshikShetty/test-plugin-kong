local typedefs = require "kong.db.schema.typedefs"


return {
  name = "testplugin",
  fields = {
   { consumer = typedefs.no_consumer },
   { protocols = typedefs.protocols_http },
   { config =
      {
         type = "record",
         fields = {
            { add_header = {  description = "add resp header",type = "boolean", required = true, default = true }, },
         }, 
      }, 
   },
  },
}