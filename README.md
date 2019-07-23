openresty 容器环境
===

目录结构
---

```shell
├── README.md
├── db
├── docker-compose.yml
├── dockerfile
└── webapp # 项目
    ├── client_body_temp
    ├── conf
    │   └── nginx.conf # nginx配置
    ├── logs # 日志
    ├── lua # lua文件
        ├── app # 业务逻辑在这里写
        │   ├── env.lua.example # 示例配置文件
        │   ├── libs # 一些库的简单封装
        │   ├── main.lua # 入口文件
        │   ├── router.lua # 路由文件
        │   ├── routes # 路由目录
        │   └── server.lua
        ├── lor # lor库 http://lor.sumory.com/index-cn
        └── resty # 一些常用库

```

如何运行
---

```shell
git clone git@git.dev.tencent.com:wblucky/opDocker.git

cd opDocker

mkdir db

# 复制配置文件 如果修改数据库密码下面的 env.lua 里面的配置也要修改
cp .env.example .env
cp webapp/lua/app/env.lua.example webapp/lua/app/env.lua

docker-compose up

```

浏览器访问 `localhost:8088` 你就可以看到 `hello world!` 😊

浏览器访问 `localhost:8088/redis-test` 你就可以看到 `redis` 相关例子, 对应的代码在 `webapp/lua/app/routes/redis.lua`

浏览器访问 `localhost:8088/mysql-test` 你就可以看到 `mysql` 相关例子, 对应的代码在 `webapp/lua/app/routes/mysql.lua`


感谢 

- [openresty](https://github.com/openresty/openresty) 

- [lor](https://github.com/sumory/lor)