local Exclusives = require(game.ReplicatedStorage:WaitForChild('Library'))

local Booths_Broadcast = game:GetService("ReplicatedStorage").Network:WaitForChild("Booths_Broadcast")
Booths_Broadcast.OnClientEvent:Connect(function(username, message)
    if type(message) == "table" and message['PlayerID'] then
        local playerID = message['PlayerID']
        for key, value in message["Listings"] do
            local uid = key
            local data = value["ItemData"]["data"]
            local item = data["id"]
            local gems = value["DiamondCost"]
            local amount = tonumber(data["_am"]) or 1
            local exclusive = false
            if class == "Pet" then
                if Exclusives.Directory.Pets[item].exclusiveLevel and gems <= 5000 then
                    game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerID, uid)
                end
            end
        end
    end
end)
