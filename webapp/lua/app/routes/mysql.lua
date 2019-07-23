local lor = require("lor.index")
local mysqlRouter = lor:Router()
local DB = require("app.libs.db")
local db = DB:new()

mysqlRouter:get(
    "",
    function(req, res, next)
        db:query("drop table if exists cats")
        local inres, err = db:query("create table cats (id serial primary key,name varchar(191))")
        local id = db:insert("insert into cats(name) values('huahua')")
        local result = db:select("SELECT * FROM cats")
        res:json({inres=inres, err=err,id = id, result=result})
    end
)

return mysqlRouter
