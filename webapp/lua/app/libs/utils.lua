local resty_sha256 = require "resty.sha256"
local str = require "resty.string"

local _M = {}

function _M.encode(s)
    local sha256 = resty_sha256:new()
    sha256:update(s)
    local digest = sha256:final()
    return str.to_hex(digest)
end

function _M.trim(str)
    return (ngx.re.gsub(str, "^%s*(.-)%s*$", "%1"))
end

function _M.table_is_array(t)
    if type(t) ~= "table" then
        return false
    end
    local i = 0
    for _ in pairs(t) do
        i = i + 1
        if t[i] == nil then
            return false
        end
    end
    return true
end

function _M.is_table_empty(t)
    if t == nil or _G.next(t) == nil then
        return true
    else
        return false
    end
end

return _M
