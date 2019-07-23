local redisRouter = require("app.routes.redis")
local mysqlRouter = require("app.routes.mysql")

return function(app)
  app:get(
    "/",
    function(req, res, next)
      res:send("hello~")
    end
  )

  app:use("/redis-test", redisRouter())
  app:use("/mysql-test", mysqlRouter())
end
