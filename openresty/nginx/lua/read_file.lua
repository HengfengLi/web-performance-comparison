function getFile(file_name)
    local f = assert(io.open(file_name, 'r'))
    local string = f:read("*all")
    f:close()
    return string
end

ngx.say(getFile('/usr/local/openresty/nginx/lua/test.json'))