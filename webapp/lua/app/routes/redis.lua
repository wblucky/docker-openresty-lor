local lor = require("lor.index")
local redisRouter = lor:Router()
local REDIS = require("app.libs.redis")
local red = REDIS:new()
local redis_conf = require("app.env")

redisRouter:get(
    "",
    function(req, res, next)
        local ok, err = red:set("dog", "putty")
        local dog = red:get("dog")
        res:json({ok = ok, err = err, dog = dog})
    end
)

return redisRouter
