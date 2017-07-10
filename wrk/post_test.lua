-- os.time() is not working correctly. In Lua's current version, 
-- there is no way to get current milliseconds. 
math.randomseed(os.clock())
math.random(); math.random(); math.random()
counter = 0

request = function()
    path = "/write/" .. counter .. "-" .. string.format("%d", math.random(1000000000))
    counter = counter + 1
    wrk.method = "POST"
    wrk.body   = '{"squadName":"Super hero squad","homeTown":"Metro City","formed":2016,"secretBase":"Super tower","active":true,"members":[{"name":"Molecule Man","age":29,"secretIdentity":"Dan Jukes","powers":["Radiation resistance","Turning tiny","Radiation blast"]},{"name":"Madame Uppercut","age":39,"secretIdentity":"Jane Wilson","powers":["Million tonne punch","Damage resistance","Superhuman reflexes"]},{"name":"Eternal Flame","age":1000000,"secretIdentity":"Unknown","powers":["Immortality","Heat Immunity","Inferno","Teleportation","Interdimensional travel"]}]}'
    wrk.headers["Content-Type"] = "application/json"
    return wrk.format(nil, path)
end
