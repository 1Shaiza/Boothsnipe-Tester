local osclock = os.clock()
repeat task.wait() until game:IsLoaded()

setfpscap(10)
game:GetService("RunService"):Set3dRenderingEnabled(false)
local Booths_Broadcast = game:GetService("ReplicatedStorage").Network:WaitForChild("Booths_Broadcast")
local Players = game:GetService('Players')
local getPlayers = Players:GetPlayers()
local PlayerInServer = #getPlayers
local http = game:GetService("HttpService")
local ts = game:GetService("TeleportService")
local rs = game:GetService("ReplicatedStorage")
local playerID, snipeNormal

if not snipeNormalPets then
    snipeNormalPets = false
end

local vu = game:GetService("VirtualUser")
Players.LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   task.wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local function processListingInfo(uid, gems, item, version, shiny, amount, boughtFrom, boughtStatus, mention)
    local gemamount = Players.LocalPlayer.leaderstats["💎 Diamonds"].Value
    local snipeMessage ="||".. Players.LocalPlayer.Name .. "||"
    local weburl, webContent, webcolor
    if version then
        if version == 2 then
            version = "Rainbow "
        elseif version == 1 then
            version = "Golden "
        end
    else
       version = ""
    end

    if boughtStatus then
	webcolor = tonumber(0x00ff00)
	weburl = "https://discord.com/api/webhooks/1191493946921205820/A9V-r4TBRrO6L_PaYKLlUy-jLn6A38uJ6hAD3Im8Qohuo3gm21UgNo7elr03GVTxTUUF"
        snipeMessage = snipeMessage .. " just sniped a "
	if mention then 
            webContent = "<@".. userid ..">"
        else
	    webContent = ""
	end
	if snipeNormal == true then
	    weburl = normalwebhook
	end
    else
	webcolor = tonumber(0xff0000)
	weburl = webhookFail
	snipeMessage = snipeMessage .. " failed to snipe a "
    end
    
    snipeMessage = snipeMessage .. "**" .. version
    
    if shiny then
        snipeMessage = snipeMessage .. " Shiny "
    end
    
    snipeMessage = snipeMessage .. item .. "**"
    
    local message1 = {
        ['content'] = webContent,
        ['embeds'] = {
            {
		["author"] = {
			["name"] = "Booth Sniper",
			["icon_url"] = "https://cdn.discordapp.com/attachments/1191492866992775208/1191570677652799498/1130472141331120219.png?ex=65a5ebab&is=659376ab&hm=5e8c0e0242fd3c8adc378487398431dc7106d2c86740fc2082187d285fd82d48&",
		},
                ['title'] = snipeMessage,
                ["color"] = webcolor,
                ["timestamp"] = DateTime.now():ToIsoDate(),
                ['fields'] = {
                    {
                        ['name'] = "__Price:__",
                        ['value'] = tostring(gems) .. " 💎",
                    },
                    {
                        ['name'] = "__Bought from:__",
                        ['value'] = "||"..tostring(boughtFrom).."|| ",
                    },
                    {
                        ['name'] = "__Amount:__",
                        ['value'] = tostring(amount) .. "x",
                    },
                    {
                        ['name'] = "__Remaining gems:__",
                        ['value'] = tostring(gemamount) .. " 💎",
                    },      
                    {
                        ['name'] = "__PetID:__",
                        ['value'] = "||"..tostring(uid).."||",
                    },
                },
		["footer"] = {
                        ["icon_url"] = "https://cdn.discordapp.com/attachments/1191492866992775208/1191570677652799498/1130472141331120219.png?ex=65a5ebab&is=659376ab&hm=5e8c0e0242fd3c8adc378487398431dc7106d2c86740fc2082187d285fd82d48&", -- optional
                        ["text"] = "Heavily Modified by Shaiza"
		}
            },
        }
    }

    local jsonMessage = http:JSONEncode(message1)
    local success, webMessage = pcall(function()
	http:PostAsync(weburl, jsonMessage)
    end)
    if success == false then
        local response = request({
            Url = weburl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonMessage
        })
    end
end

local function checklisting(uid, gems, item, version, shiny, amount, username, playerid)
    local Library = require(rs:WaitForChild('Library'))
    local purchase = rs.Network.Booths_RequestPurchase
    gems = tonumber(gems)
    local ping = false
    snipeNormal = false
    local type = {}
    pcall(function()
        type = Library.Directory.Pets[item]
    end)

    if amount == nil then
        amount = 1
    end

    local price = gems / amount

    if type.huge and price <= 1000000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
        if boughtPet == true then
            ping = true
	end
        processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping) 
	
    elseif type.exclusiveLevel and price <= 10000 and item ~= "Banana" and item ~= "Coin" then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
        processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
    elseif string.find(item, "Exclusive") and price <= 25000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
    elseif item == "Titanic Christmas Present" and price <= 25000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
    elseif type.titanic and price <= 1000000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
        if boughtPet == true then
	    ping = true
	end
        processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Chest Mimic" and price <= 200000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)	
   elseif item == "Diamond Chest Mimic" and price <= 250000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Fortune" and price <= 100000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Lucky Block" and price <= 100000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Massive Commet" and price <= 100000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Crystal Key" and price <= 15000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Crystal Key Upper Half" and price <= 10000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Crystal Key Upper Half" and price <= 5000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Spinny Wheel Ticket" and price <= 5000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Booth Slot Voucher" and price <= 25000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)
   elseif item == "Charm Stone" and price <= 40000 then
        local boughtPet, boughtMessage = purchase:InvokeServer(playerid, uid)
	processListingInfo(uid, gems, item, version, shiny, amount, username, boughtPet, ping)

    end
end

Booths_Broadcast.OnClientEvent:Connect(function(username, message)
    local playerIDSuccess, playerError = pcall(function()
	playerID = message['PlayerID']
    end)
    if playerIDSuccess then
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
                            checklisting(uid, gems, item, version, shiny, amount, username, playerID)
                        end
                    end
                end
            end
	end
    end
end)

local function jumpToServer() 
    local sfUrl = "https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=%s&excludeFullGames=true" 
    local req = request({ Url = string.format(sfUrl, 15502339080, "Desc", 100) }) 
    local body = http:JSONDecode(req.Body) 
    local deep = math.random(1, 3)
    if deep > 1 then 
        for i = 1, deep, 1 do 
             req = request({ Url = string.format(sfUrl .. "&cursor=" .. body.nextPageCursor, 15502339080, "Desc", 100) }) 
             body = http:JSONDecode(req.Body) 
             task.wait(0.1)
        end 
    end 
    local servers = {} 
    if body and body.data then 
        for i, v in next, body.data do 
            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
                table.insert(servers, v.id)
            end
        end
    end
    local randomCount = #servers
    if not randomCount then
       randomCount = 2
    end
    ts:TeleportToPlaceInstance(15502339080, servers[math.random(1, randomCount)], game:GetService("Players").LocalPlayer) 
end

Players.PlayerRemoving:Connect(function(player)
    PlayerInServer = #getPlayers
    if PlayerInServer < 25 then
        jumpToServer()
    end
end) 

while task.wait(1) do
    if math.floor(os.clock() - osclock) >= math.random(900, 1200) then
        jumpToServer()
    end
end
