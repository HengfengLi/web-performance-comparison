function getFile(file_name)
    local f = assert(io.open(file_name, 'r'))
    local string = f:read("*all")
    f:close()
    return string
end

function writeFile(file_name, data)
    local f = assert(io.open(file_name, 'w'))
    local string = f:write(data)
    f:close()
end

ngx.req.read_body()
local data = ngx.req.get_body_data()
if nil == data then
    local file_name = ngx.req.get_body_file()
    if file_name then
        data = getFile(file_name)
    end
end

local abs_path = '/usr/local/openresty/nginx/lua/data/' .. ngx.var.file_name .. '.json'

writeFile(abs_path, data)

ngx.say("Done")