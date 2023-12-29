local Booths_Broadcast = game:GetService("ReplicatedStorage").Network:WaitForChild("Booths_Broadcast")

local function checklisting(uid, gems, item, version, shiny, amount, username, playerid)
    gems = tonumber(gems)

    if string.find(item, "Huge") and gems <= 1000000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
        processListingInfo(uid, gems, item, version, shiny, amount, username)
    
    elseif gems <= 5 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
        processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif string.find(item, "Exotic Pet") and gems <= 100 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
        processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif string.find(item, "Royalty") and gems <= 500000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Crystal Key" and gems <= 15000 then
        bought = game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerID, uid)
        if bought == true then
            processListingInfo(uid, gems, item, version, shiny, amount, username)
        
    elseif item == "Crystal Key Lower Half" and gems <= 5000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Crystal Key Upper Half" and gems <= 10000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Spinny Wheel Ticket" and gems <= 5000 then
        bought = game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerID, uid)
        if bought == true then
            processListingInfo(uid, gems, item, version, shiny, amount, username)
        
    elseif item == "Titanic Christmas Present" and gems <= 50000 then
        bought = game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerID, uid)
        if bought == true then
            processListingInfo(uid, gems, item, version, shiny, amount, username)
   
    elseif item == "X-Large Christmas Present" and gems <= 5000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)
 
    elseif item == "Large Christmas Present" and gems <= 2500 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Medium Christmas Present" and gems <= 1000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)
 
    elseif item == "Small Christmas Present" and gems <= 500 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Fortune" and gems <= 100000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Booth Slot Voucher" and gems <= 25000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Lucky Block" and gems <= 400000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Chest Mimic" and gems <= 800000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Charm Stone" and gems <= 40000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Bonus" and gems <= 20000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif class == "Charm" and gems <= 20000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif class == "Potion" and gems <= 1000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif class == "Enchant" and gems <= 1000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif class == "Misc" and gems <= 1000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username) 

    elseif class == "Fruit" and gems <= 100 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif class == "Egg" and gems <= 10000 then
        game:GetService("ReplicatedStorage").Network.Booths_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    end
end

Booths_Broadcast.OnClientEvent:Connect(function(username, message)
    local playerID = message['PlayerID']
    if type(message) == "table" then
        local listing = message["Listings"]
        for key, value in pairs(listing) do
            if type(value) == "table" then
                local uid = key
                local gems = value["DiamondCost"]
                local itemdata = value["ItemData"]

                if itemdata then
                    local data = itemdata["data"]

                    if data then
                        local item = data["id"]
                        local version = data["pt"]
                        local shiny = data["sh"]
                        local amount = data["_am"]
                        checklisting(uid, gems, item, version, shiny, amount, username , playerID)
                    end
                end
            end
        end
    end
end)
