
--[[
	Credit to einsteinK.
	Credit to Stravant for LBI.
	
	Credit to the creators of all the other modules used in this.
	
	Sceleratis was here and decided modify some things.
	
	einsteinK was here again to fix a bug in LBI for if-statements
--]]
local luaX = require(LuaX)
local luaY = require(LuaY)
local luaZ = require(LuaZ)
local luaU = require(LuaU)
local rerubi = require(Rerubi)
luaX:init()
local LuaState = {}
getfenv().script = nil
return function(str,env)
	local f,writer,buff,name
	local env = env or getfenv(2)
	local name = (env.script and env.script:GetFullName())
	local ran,error = pcall(function()
		local zio = luaZ:init(luaZ:make_getS(str), nil)
		if not zio then return error() end
		local func = luaY:parser(LuaState, zio, nil, name or "nil")
		writer, buff = luaU:make_setS()
		luaU:dump(LuaState, func, writer, buff)
		f = rerubi(buff.data, env)
	end)
	
	if ran then
		return f,buff.data
	else
		return nil,error
	end
end
