local lor = require("lor.index")
local app = lor()
local router = require("app.router")

-- 模板配置
-- app:conf("view enable", false)
-- app:conf("view engine", "tmpl")
-- app:conf("view ext", "html")
-- app:conf("view layout", "")
-- app:conf("views", "./app/views")

-- 自定义中间件
app:use(
    function(req, res, next)
        res:set_header("Server", "")

        -- 这里可用动态设置
        -- res:set_header("Access-Control-Allow-Origin", "*")

        -- 禁止页面在所有的 frame 中显示
        res:set_header("X-Frame-Options", "DENY")
        res:set_header("X-XSS-Protection", " 1; mode=block")
        res:set_header("X-Content-Type-Options", "nosniff")
        next()
    end
)

router(app)

-- 错误处理中间件
app:erroruse(
    function(err, req, res, next)
        ngx.log(ngx.ERR, err)
        res:set_header("Server", "")
        if req:is_found() ~= true then
            if ngx.re.find(req.headers["Accept"], "application/json") then
                res:status(404):json(
                    {
                        success = false,
                        msg = "404! sorry, not found."
                    }
                )
            else
                res:status(404):send("404! sorry, not found. " .. (req.path or ""))
            end
        else
            if ngx.re.find(req.headers["Accept"], "application/json") then
                res:status(500):json(
                    {
                        success = false,
                        msg = "500! internal error, please check the log."
                    }
                )
            else
                res:status(500):send("internal error, please check the log.")
            end
        end
    end
)

return app
