local Booths_Broadcast = game:GetService("ReplicatedStorage").Network:WaitForChild("Booths_Broadcast")

if not getgenv().a then
    getgenv().a = true
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end

local function processListingInfo(uid, gems, item, version, shiny, amount, boughtFrom)
    local ping = ""
    if string.find(item, "Huge") then
        ping = "@everyone"
    end
    print(uid, gems, item, version, shiny, amount, boughtFrom)
    print("BOUGHT FROM:", boughtFrom)
    print("UID:", uid)
    print("GEMS:", gems)
    print("ITEM:", item)
    local snipeMessage = game.Players.LocalPlayer.Name .. " just sniped a "
    if version then
        if version == 2 then
            version = "Rainbow"
        elseif version == 1 then
            version = "Golden"
        end
    else
       version = "Normal"
    end
    
    snipeMessage = snipeMessage .. version
    
    if shiny then
        snipeMessage = snipeMessage .. " Shiny"
    end
    
    snipeMessage = snipeMessage .. " " .. (item)
    
    print(snipeMessage)
    
    if amount then
        print("AMOUNT:", amount)
    else
        amount = 1
        print("AMOUNT:", amount)
    end

    local fields = {
        {
            name = "PRICE:",
            value = tostring(gems) .. " GEMS",
            inline = true,
        },
        {
            name = "BOUGHT FROM:",
            value = tostring(boughtFrom),
            inline = true,
        },
        {
            name = "AMOUNT:",
            value = tostring(amount),
            inline = true,
        },
        {
            name = "PETID:",
            value = tostring(uid),
            inline = true,
        }
    }

    local message = {
        content = ping,
        embeds = {
            {
                title = snipeMessage,
                fields = fields,
                author = {name = "New Pet Sniped!"}
            }
        },
        username = " Sniper",
        attachments = {}
    }

    local http = game:GetService("HttpService")
    local jsonMessage = http:JSONEncode(message)

    http:PostAsync(
    "https://discord.com/api/webhooks/1186432138195779698/I-MN6VBwVkTlpqC49yRMveog5pnA1tb4ZaLI3GLGpW1lWcOgQVXaMJAtR1TGeBVB1Ozx",
        jsonMessage,
        Enum.HttpContentType.ApplicationJson,
        false
    )
end

local function checklisting(uid, gems, item, version, shiny, amount, username, playerid)
    gems = tonumber(gems)

    if string.find(item, "Huge") and gems <= 1000000 then
        bought = game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerID, uid)
        if bought == true then
            processListingInfo(uid, gems, item, version, shiny, amount, username)
        end

    elseif gems <= 5 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)

    elseif string.find(item, "Exotic Pet") and gems <= 100 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
        processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif string.find(item, "Royalty") and gems <= 500000 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Crystal Key" and gems <= 15000 then
        bought = game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerID, uid)
        if bought == true then
            processListingInfo(uid, gems, item, version, shiny, amount, username)
        end

    elseif item == "Crystal Key Lower Half" and gems <= 5000 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Crystal Key Upper Half" and gems <= 10000 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Spinny Wheel Ticket" and gems <= 5000 then
        bought = game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerID, uid)
        if bought == true then
            processListingInfo(uid, gems, item, version, shiny, amount, username)
        end

    elseif item == "Titanic Christmas Present" and gems <= 50000 then
        bought = game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerID, uid)
        if bought == true then
            processListingInfo(uid, gems, item, version, shiny, amount, username)
        end 
   
    elseif item == "X-Large Christmas Present" and gems <= 5000 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)
 
    elseif item == "Large Christmas Present" and gems <= 2500 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Medium Christmas Present" and gems <= 1000 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)
 
    elseif item == "Small Christmas Present" and gems <= 500 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
	    processListingInfo(uid, gems, item, version, shiny, amount, username)

    elseif item == "Fortune" and gems <= 100000 then
        game:GetService("ReplicatedStorage").Network.s_RequestPurchase:InvokeServer(playerid, uid)
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

    elseif item == "Charm Stone" and gems <= 40000 then
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
