--v1.4.1
---// Loading Section \\---
task.wait(2)
repeat  task.wait() until game:IsLoaded()
if game.PlaceId == 8304191830 then
    
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")

            
else
    repeat task.wait() until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name)
    game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
    repeat task.wait() until game:GetService("Workspace")["_waves_started"].Value == true
end
------------------------------


local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")

getgenv().savefilename = "Anime-Adventures_"..game.Players.LocalPlayer.Name.."_Custom.json"

--Webhook sender
local function webhook()
	pcall(function()
		local url = tostring(getgenv().weburl) --webhook
		print("webhook?")
		if url == "" then
			return
		end
			
    	XP = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.XPReward.Main.Amount.Text)
		gems = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.GemReward.Main.Amount.Text)
        cwaves = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.WavesCompleted.Text

		ctime = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text
		waves = cwaves:split(": ")
        ttime = ctime:split(": ")

		local data = {
			["content"] = "",
			["username"] = "Anime Adventures",
			["avatar_url"] = "https://tr.rbxcdn.com/e5b5844fb26df605986b94d87384f5fb/150/150/Image/Jpeg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Anime Adventures | Result ✔",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["description"] = "🎮 **"..game:GetService("Players").LocalPlayer.Name.."** 🎮",
					["color"] = 110335,

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					},

					["fields"] = {
						{
							["name"] = "Total Waves:",
							["value"] = tostring(waves[2]) ..
								" <:wave:997136622363627530>",
							["inline"] = true
						}, {
							["name"] = "Recieved Gems:",
							["value"] = gems .. " <:gem:997123585476927558>",
							["inline"] = true
						}, {
                            ["name"] = "Recieved XP:",
                            ["value"] = XP .. " 🧪",
                            ["inline"] = true
                        }, {
                            ["name"] = "Total Time:",
                            ["value"] = tostring(ttime[2]) .. " ⏳",
                            ["inline"] = true
                        }, {
                            ["name"] = "Current Gems:",
                            ["value"] = tostring(game.Players.LocalPlayer._stats.gem_amount.Value).." <:gem:997123585476927558>",
                            ["inline"] = true
                        }, {
                            ["name"] = "Current Level:",
                            ["value"] = tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text).. " ✨",
                            ["inline"] = true
                        }
					}
				}
			}
		}

		local porn = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local sex = {Url = url, Body = porn, Method = "POST", Headers = headers}
		warn("Sending webhook notification...")
        request(sex)
        
        print(waves[2])
        print("worked")
        print(getgenv().sellatwave)
        print("worked 2")
        if ((tonumber(waves[2])) >= tonumber(getgenv().sellatwave) and tonumber(waves[2]) ~= 999) then
            if(getgenv().world == "Planet Namak") then
                getgenv().namekDailyInfinite = true

            elseif (getgenv().world == "Shiganshinu District") then
                getgenv().aotDailyInfinite = true

            elseif (getgenv().world == "Snowy Town") then
                getgenv().demonslayerDailyInfinite = true
                
            elseif (getgenv().world == "Hidden Sand Village") then
                getgenv().narutoDailyInfinite = true

            elseif (getgenv().world == "Marine's Ford") then
                getgenv().marinefordDailyInfinite = true

            end

        end
        updatejson()
	end)
end

--Buy Item Webhook
local function buyItemWebhook(itemBought)
	pcall(function()
		local url = tostring(getgenv().weburl) --webhook
		print("webhook?")
		if url == "" then
			return
		end

		local data = {
			["content"] = "",
			["username"] = "Anime Adventures",
			["avatar_url"] = "https://tr.rbxcdn.com/e5b5844fb26df605986b94d87384f5fb/150/150/Image/Jpeg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Anime Adventures | Result ✔",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["description"] = "🎮 **"..game:GetService("Players").LocalPlayer.Name.."** 🎮",
					["color"] = 110335,

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					},

					["fields"] = {
						{
							["name"] = "Item Bought",
							["value"] = itemBought,
							["inline"] = true
						}
					}
				}
			}
		}

		local porn = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local sex = {Url = url, Body = porn, Method = "POST", Headers = headers}
		warn("Sending webhook notification...")
        request(sex)
	end)
end

getgenv().UnitCache = {}

for _, Module in next, game:GetService("ReplicatedStorage"):WaitForChild("src"):WaitForChild("Data"):WaitForChild("Units"):GetDescendants() do
    if Module:IsA("ModuleScript") and Module.Name ~= "UnitPresets" then
        for UnitName, UnitStats in next, require(Module) do
            getgenv().UnitCache[UnitName] = UnitStats
        end
    end
end

-- JSON FILE
function sex()
    -- reads jsonfile
    local jsonData = readfile(savefilename)
    local data = HttpService:JSONDecode(jsonData)

    -- global values
    getgenv().disableatuofarm = false

    getgenv().sellatwave = data.sellatwave 
    getgenv().autosell = data.autosell
    getgenv().AutoFarm = data.autofarm
    getgenv().weburl = data.webhook
    getgenv().autostart = data.autostart
    getgenv().autoupgrade = data.autoupgrade
    getgenv().difficulty = data.difficulty
    getgenv().world = data.world
    getgenv().level = data.level
    getgenv().door = data.door

    getgenv().SpawnUnitPos = data.xspawnUnitPos
    getgenv().SelectedUnits = data.xselectedUnits
    getgenv().autoabilities = data.autoabilities

    getgenv().farmDailies = data.farmDailies
    getgenv().namekDailyInfinite = data.namekDailyInfinite
    getgenv().aotDailyInfinite = data.aotDailyInfinite
    getgenv().demonslayerDailyInfinite = data.demonslayerDailyInfinite
    getgenv().narutoDailyInfinite = data.narutoDailyInfinite
    getgenv().marinefordDailyInfinite = data.marinefordDailyInfinite

    getgenv().namekSpawnPos = data.xnamekSpawnPos
    getgenv().aotSpawnPos = data.xaotSpawnPos
    getgenv().demonslayerSpawnPos = data.xdemonslayerSpawnPos
    getgenv().narutoSpawnPos = data.xnarutoSpawnPos
    getgenv().marinefordSpawnPos = data.xmarinefordSpawnPos

    getgenv().buyStarRemnant = data.buyStarRemnant
    getgenv().buySummonTicket = data.buySummonTicket

    
    

    ---// updates the json file
    function updatejson()

        local xdata = {
            -- unitname = getgenv().unitname,
            -- unitid = getgenv().unitid,
            sellatwave = getgenv().sellatwave,
            autosell = getgenv().autosell,
            webhook = getgenv().weburl,
            autofarm = getgenv().AutoFarm,
            autostart = getgenv().autostart,
            autoupgrade = getgenv().autoupgrade,
            difficulty = getgenv().difficulty,
            world = getgenv().world,
            level = getgenv().level,
            door = getgenv().door,
            xspawnUnitPos = getgenv().SpawnUnitPos,
            xselectedUnits = getgenv().SelectedUnits,
            autoabilities = getgenv().autoabilities,

            --store whether or not dailies for each map were completed
            farmDailies = getgenv().farmDailies,
            namekDailyInfinite = getgenv().namekDailyInfinite,
            aotDailyInfinite = getgenv().aotDailyInfinite,
            demonslayerDailyInfinite = getgenv().demonslayerDailyInfinite,
            narutoDailyInfinite = getgenv().narutoDailyInfinite,
            marinefordDailyInfinite = getgenv().marinefordDailyInfinite,
            
            xnamekSpawnPos = getgenv().namekSpawnPos,
            xaotSpawnPos = getgenv().aotSpawnPos,
            xdemonslayerSpawnPos = getgenv().demonslayerSpawnPos,
            xnarutoSpawnPos =  getgenv().narutoSpawnPos,
            xmarinefordSpawnPos =  getgenv().marinefordSpawnPos,

            buyStarRemnant = getgenv().buyStarRemnant,
            buySummonTicket = getgenv().buySummonTicket


            
        }

        local json = HttpService:JSONEncode(xdata)
        writefile(savefilename, json)

    end

    --------------------------------------------------
    --------------------------------------------------
    -- Uilib Shits

    local DiscordLib = loadstring(game:HttpGet "https://raw.githubusercontent.com/Forever4D/Lib/main/DiscordLib2.lua")()
    local win = DiscordLib:Window("Anime Adventures Rumblenex Version".." - "..tostring(identifyexecutor()))
    local serv = win:Server("Anime Adventures", "http://www.roblox.com/asset/?id=6031075938")
            
    if game.PlaceId == 8304191830 then
        local unitselecttab = serv:Channel("Select Units")
        local autofarmtab = serv:Channel("Auto Farm")
        --------------------------------------------------
        --------------- Select Units Tab -----------------
        --------------------------------------------------

        local Units = {}

        local function loadUnit()
            repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("collection"):FindFirstChild("grid"):FindFirstChild("List"):FindFirstChild("Outer"):FindFirstChild("UnitFrames")
            task.wait(2)
            table.clear(Units)
            for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
                if v.Name == "CollectionUnitFrame" then
                    repeat task.wait() until v:FindFirstChild("_uuid")
                    table.insert(Units, v.name.Text .. " #" .. v._uuid.Value)
                end
            end
        end

        loadUnit()

        local function Equip()
            game:GetService("ReplicatedStorage").endpoints.client_to_server.unequip_all:InvokeServer()
            for i = 1, 6 do
                local unitinfo = getgenv().SelectedUnits["U" .. i]
                warn(unitinfo)
                if unitinfo ~= nil then
                    local unitinfo_ = unitinfo:split(" #")
                    task.wait(0.3)
                    game:GetService("ReplicatedStorage").endpoints.client_to_server.equip_unit:InvokeServer(unitinfo_[2])
                end
            end
            updatejson()
        end

        local drop = unitselecttab:Dropdown("Unit 1", Units, getgenv().SelectedUnits["U1"], function(bool)
            getgenv().SelectedUnits["U1"] = bool
            Equip()
        end)

        local drop2 = unitselecttab:Dropdown("Unit 2", Units, getgenv().SelectedUnits["U2"], function(bool)
            getgenv().SelectedUnits["U2"] = bool
            Equip()
        end)

        local drop3 = unitselecttab:Dropdown("Unit 3", Units, getgenv().SelectedUnits["U3"], function(bool)
            getgenv().SelectedUnits["U3"] = bool
            Equip()
        end)

        local drop4 = unitselecttab:Dropdown("Unit 4", Units, getgenv().SelectedUnits["U4"], function(bool)
            getgenv().SelectedUnits["U4"] = bool
            Equip()
        end)

        local axx =  game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")
        _G.drop5 = nil
        _G.drop6 = nil
        if tonumber(axx[2]) >= 20 then
            _G.drop5 = unitselecttab:Dropdown("Unit 5", Units, getgenv().SelectedUnits["U5"], function(bool)
                getgenv().SelectedUnits["U5"] = bool
                Equip()
            end)
        end

        if tonumber(axx[2]) >= 50 then
            _G.drop6 = unitselecttab:Dropdown("Unit 6", Units, getgenv().SelectedUnits["U6"], function(bool)
                getgenv().SelectedUnits["U6"] = bool
                Equip()
            end)
        end
        --------------// Refresh Unit List \\-------------

        unitselecttab:Button("Refresh Unit List", function()
            drop:Clear()
            drop2:Clear()
            drop3:Clear()
            drop4:Clear()
            if _G.drop5 ~= nil then
                _G.drop5:Clear()
            end
            if _G.drop6 ~= nil then
                _G.drop6:Clear()
            end 

            loadUnit()
            game:GetService("ReplicatedStorage").endpoints.client_to_server.unequip_all:InvokeServer()
            for i, v in ipairs(Units) do
                drop:Add(v)
                drop2:Add(v)
                drop3:Add(v)
                drop4:Add(v)
                if _G.drop5 ~= nil then
                    _G.drop5:Add(v)
                end
                if _G.drop6 ~= nil then
                    _G.drop6:Add(v)
                end 
            end
            getgenv().SelectedUnits = {
                U1 = nil,
                U2 = nil,
                U3 = nil,
                U4 = nil,
                U5 = nil,
                U6 = nil
            }
        end) 

        unitselecttab:Label(" ")
        unitselecttab:Label(" ")

        --------------------------------------------------
        ------------------ Auto Farm Tab -----------------
        --------------------------------------------------
        

        autofarmtab:Toggle("Auto Farm", getgenv().AutoFarm, function(bool)
            getgenv().AutoFarm = bool
            updatejson()
        end)

        getgenv().levels = {"nill"}

        autofarmtab:Toggle("Auto Start", getgenv().autostart, function(bool)
            getgenv().autostart = bool
            updatejson()
            
            if getgenv().autostart and getgenv().AutoFarm then

                for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetDescendants()) do
                    if v.Name == "Owner" and v.Value == nil then
                        getgenv().door = v.Parent.Name
                        break
                    end
                end

                task.wait(0.1)

                local args = {
                    [1] = getgenv().door
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(
                    args))

                    task.wait(0.1)

                local args = {
                    [1] = getgenv().door, -- Lobby 
                    [2] = getgenv().level, -- World
                    [3] = true, -- Friends Only or not
                    [4] = getgenv().difficulty
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(
                    args))

                    task.wait(0.1)

                local args = {
                    [1] = getgenv().door
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(
                    args))
            end

        end)

        autofarmtab:Toggle("Auto Abilities", getgenv().AutoFarm, function(bool)
            getgenv().autoabilities = bool
            updatejson()
        end)

        autofarmtab:Toggle("Auto Upgrade Units", getgenv().autoupgrade, function(bool)
            getgenv().autoupgrade = bool
            updatejson()
        end)

        autofarmtab:Toggle("Auto Sell at spectic Wave", getgenv().autosell, function(x)
            getgenv().autosell = x
            updatejson()
            if getgenv().autosell == false then
                getgenv().disableatuofarm = false
            end
        end)

        autofarmtab:Textbox("Select Wave Number for Auto Sell {Press Enter}", getgenv().sellatwave, false, function(t)
            getgenv().sellatwave = tonumber(t)
            updatejson()
        end)

        
 
        local worlddrop = autofarmtab:Dropdown("Select World", {"Plannet Namak", "Shiganshinu District", "Snowy Town","Hidden Sand Village", "Marine's Ford"}, getgenv().world, function(world)
                getgenv().world = world
                updatejson()
                if world == "Plannet Namak" then
                    getgenv().leveldrop:Clear()
                    table.clear(levels)
                    getgenv().levels = {"namek_infinite", "namek_level_1", "namek_level_2", "namek_level_3",
                                        "namek_level_4", "namek_level_5", "namek_level_6"}
                    for i, v in ipairs(levels) do
                        getgenv().leveldrop:Add(v)
                    end
                elseif world == "Shiganshinu District" then
                    getgenv().leveldrop:Clear()
                    table.clear(levels)
                    getgenv().levels = {"aot_infinite", "aot_level_1", "aot_level_2", "aot_level_3", "aot_level_4",
                                        "aot_level_5", "aot_level_6"}
                    for i, v in ipairs(levels) do
                        getgenv().leveldrop:Add(v)
                    end
                elseif world == "Snowy Town" then
                    getgenv().leveldrop:Clear()
                    table.clear(levels)
                    getgenv().levels = {"demonslayer_infinite", "demonslayer_level_1", "demonslayer_level_2",
                                        "demonslayer_level_3", "demonslayer_level_4", "demonslayer_level_5",
                                        "demonslayer_level_6"}
                    for i, v in ipairs(levels) do
                        getgenv().leveldrop:Add(v)
                    end
                elseif world == "Hidden Sand Village" then
                    getgenv().leveldrop:Clear()
                    table.clear(levels)
                    getgenv().levels = {"naruto_infinite", "naruto_level_1", "naruto_level_2", "naruto_level_3",
                                        "naruto_level_4", "naruto_level_5", "naruto_level_6"}
                    for i, v in ipairs(levels) do
                        getgenv().leveldrop:Add(v)
                    end
                elseif world == "Marine's Ford" then
                    getgenv().leveldrop:Clear()
                    table.clear(levels)
                    getgenv().levels = {"marineford_infinite","marineford_level_1","marineford_level_2","marineford_level_3",
                    "marineford_level_4","marineford_level_5","marineford_level_6",}
                    for i, v in ipairs(levels) do
                        getgenv().leveldrop:Add(v)
                    end
                end
        end)

        getgenv().leveldrop = autofarmtab:Dropdown("Select Level", getgenv().levels, getgenv().level, function(level)
                getgenv().level = level
                updatejson()
        end)

        getgenv().diff = autofarmtab:Dropdown("Select Difficulty", {"Normal", "Hard"}, getgenv().difficulty, function(diff)
                getgenv().difficulty = diff
                updatejson()
        end)

		local webhooktab = serv:Channel("Webhook")
		webhooktab:Label("Webhook sends notification in discord everytime\nGame is Finished!")
		
		local webhoolPlaceholder
		if getgenv().weburl == "" then
			webhoolPlaceholder = "Insert url here!"
		else
			webhoolPlaceholder = getgenv().weburl
		end
		webhooktab:Textbox("Webhook URL {Press Enter}" , webhoolPlaceholder, false, function(web_url)
            getgenv().weburl = web_url
            updatejson()
        end)
        webhooktab:Button("Test Webhook", function()
            webhook()
            buyItemWebhook("test")
        end)

        autofarmtab:Label(" ")
        autofarmtab:Label(" ")

    else -- When in a match

        local autofarmtab = serv:Channel("Auto Farm")
        local autoseltab = serv:Channel("Auto Sell")
		local webhooktab = serv:Channel("Webhook")

        game.Players.LocalPlayer.PlayerGui.MessageGui.Enabled = false
        game:GetService("ReplicatedStorage").packages.assets["ui_sfx"].error.Volume = 0
        game:GetService("ReplicatedStorage").packages.assets["ui_sfx"].error_old.Volume = 0

        autofarmtab:Toggle("Auto Farm", getgenv().AutoFarm, function(bool)
            getgenv().AutoFarm = bool
            updatejson()
        end)

        autofarmtab:Toggle("Auto Abilities", getgenv().AutoFarm, function(bool)
            getgenv().autoabilities = bool
            updatejson()
        end)

        autofarmtab:Toggle("Auto Start", getgenv().autostart, function(bool)
            getgenv().autostart = bool
            updatejson()
        end)

        autoseltab:Toggle("Auto Sell at Specfic Wave", getgenv().autosell, function(x)
            getgenv().autosell = x
            updatejson()
            if getgenv().autosell == false then
                getgenv().disableatuofarm = false
            end

        end)

        autoseltab:Textbox("Select Wave Number for Auto Sell {Press Enter}", getgenv().sellatwave, false, function(t)
            getgenv().sellatwave = tonumber(t)
            updatejson()
        end)

        autofarmtab:Toggle("Auto Upgrade Units", getgenv().autoupgrade, function(bool)
            getgenv().autoupgrade = bool
            updatejson()
        end)

        function MouseClick(UnitPos)
            local connection
            connection = UserInputService.InputBegan:Connect(
                function(input, gameProcessed)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        connection:Disconnect()
                        local a = Instance.new("Part", game.Workspace)
                        a.Size = Vector3.new(1, 1, 1)
                        a.Material = Enum.Material.Neon
                        a.Position = mouse.hit.p
                        task.wait()
                        a.Anchored = true
                        DiscordLib:Notification("Spawn Unit Posotion:", tostring(a.Position), "Okay!")
                        a.CanCollide = false
                        for i = 0, 1, 0.1 do
                            a.Transparency = i
                            task.wait()
                        end
                        a:Destroy()
                        --SpawnUnitPos[UnitPos]["x"] = a.Position.X
                        --SpawnUnitPos[UnitPos]["y"] = a.Position.Y
                        --SpawnUnitPos[UnitPos]["z"] = a.Position.Z

                        if(getgenv().world == "Planet Namak") then
                            namekSpawnPos[UnitPos]["x"] = a.Position.X
                            namekSpawnPos[UnitPos]["y"] = a.Position.Y
                            namekSpawnPos[UnitPos]["z"] = a.Position.Z
                            getgenv().SpawnUnitPos = getgenv().namekSpawnPos

                        elseif (getgenv().world == "Shiganshinu District") then
                            aotSpawnPos[UnitPos]["x"] = a.Position.X
                            aotSpawnPos[UnitPos]["y"] = a.Position.Y
                            aotSpawnPos[UnitPos]["z"] = a.Position.Z
                            getgenv().SpawnUnitPos = getgenv().aotSpawnPos

                        elseif (getgenv().world == "Snowy Town") then
                            demonslayerSpawnPos[UnitPos]["x"] = a.Position.X
                            demonslayerSpawnPos[UnitPos]["y"] = a.Position.Y
                            demonslayerSpawnPos[UnitPos]["z"] = a.Position.Z
                            getgenv().SpawnUnitPos = getgenv().demonslayerSpawnPos
                            
                        elseif (getgenv().world == "Hidden Sand Village") then
                            narutoSpawnPos[UnitPos]["x"] = a.Position.X
                            narutoSpawnPos[UnitPos]["y"] = a.Position.Y
                            narutoSpawnPos[UnitPos]["z"] = a.Position.Z
                            getgenv().SpawnUnitPos = getgenv().narutoSpawnPos

                        elseif (getgenv().world == "Marine's Ford") then
                            marinefordSpawnPos[UnitPos]["x"] = a.Position.X
                            marinefordSpawnPos[UnitPos]["y"] = a.Position.Y
                            marinefordSpawnPos[UnitPos]["z"] = a.Position.Z
                            getgenv().SpawnUnitPos = getgenv().marinefordSpawnPos

                        end


                        
                        updatejson()
                    end
                end)
        end

        --// Set Position \\--
        autofarmtab:Button("Set Unit 1 Postion", function()
            DiscordLib:Notification("Set Unit 1 Spawn Position",
                "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                "Done")
            MouseClick("UP1")
        end)

        autofarmtab:Button("Set Unit 2 Postion", function()
            DiscordLib:Notification("Set Unit 2 Spawn Position",
                "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                "Done")
            MouseClick("UP2")
        end)
        autofarmtab:Button("Set Unit 3 Postion", function()
            DiscordLib:Notification("Set Unit 3 Spawn Position",
                "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                "Done")
            MouseClick("UP3")
        end)
        autofarmtab:Button("Set Unit 4 Postion", function()
            DiscordLib:Notification("Set Unit 4 Spawn Position",
                "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                "Done")
            MouseClick("UP4")
        end)

        local axxc = game.Players.LocalPlayer.PlayerGui["spawn_units"].Lives.Main.Desc.Level.Text:split(" ")

        if tonumber(axxc[2]) >= 20 then
            autofarmtab:Button("Set Unit 5 Postion", function()
                DiscordLib:Notification("Set Unit 5 Spawn Position",
                    "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    "Done")
                MouseClick("UP5")
            end)
        end

        if tonumber(axxc[2]) >= 50 then
            autofarmtab:Button("Set Unit 6 Postion", function()
                DiscordLib:Notification("Set Unit 6 Spawn Position",
                    "Click on the floor to set the spawn unit position!\n (don't press \"Done\" until you set position)",
                    "Done")
                MouseClick("UP6")
            end)
        end

		--//Webhook Tab (in-game)\\--
		webhooktab:Label("Webhook sends notification in discord everytime game Finishes.")
		local webhoolPlaceholder
		if getgenv().weburl == "" then
			webhoolPlaceholder = "Insert url here!"
		else
			webhoolPlaceholder = getgenv().weburl
		end
		webhooktab:Textbox("Webhook URL {Press Enter}" , webhoolPlaceholder, false, function(web_url)
            getgenv().weburl = web_url
            updatejson()
        end)
        webhooktab:Button("Test Webhook", function()
            webhook()
            buyItemWebhook("test")
        end)

        -- set unit position end--
        autofarmtab:Label("--- Saved Config (Doesn't Refresh) ---")
        autofarmtab:Label("Auto Sell at Wave: " .. tostring(getgenv().sellatwave))
        autofarmtab:Label("Webhook: " .. tostring(getgenv().weburl))
        autofarmtab:Label("Auto Farm: " .. tostring(getgenv().AutoFarm))
        autofarmtab:Label("Auto Start: " .. tostring(getgenv().autostart))
        autofarmtab:Label("Auto Sell: " .. tostring(getgenv().autosell))
        autofarmtab:Label("Auto Upgrade: " .. tostring(getgenv().autoupgrade))
        autofarmtab:Label("Difficulty: " .. tostring(getgenv().difficulty))
        autofarmtab:Label("Selected World: " .. tostring(getgenv().world))
        autofarmtab:Label("Selected Level: " .. tostring(getgenv().level))
        autofarmtab:Label(" ")
        autofarmtab:Label(" ")

    end

    --------------------------------------------------
    --------------------------------------------------


    if game.PlaceId == 8304191830 then


        --------------------------------------------------
        -------------------- Auto Buy/Sell ---------------
        getgenv().UnitSellTog = false
        getgenv().autosummontickets = false
        getgenv().autosummongem = false
        getgenv().autosummongem10 = false
        



        local misc = serv:Channel("Auto Buy/Sell")
        misc:Toggle("Auto Summon {Use Ticket 1}", getgenv().autosummontickets, function(bool)
            getgenv().autosummontickets = bool
            while getgenv().autosummontickets do
                task.wait()
                local args = {
                    [1] = "dbz_fighter",
                    [2] = "ticket"
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_random_fighter:InvokeServer(unpack(
                    args))
            end
            updatejson()
        end)

        misc:Toggle("Auto Summon {Buy 1}", getgenv().autosummongem, function(bool)
            getgenv().autosummongem = bool
            while getgenv().autosummongem do
                task.wait()
                local args = {
                    [1] = "dbz_fighter",
                    [2] = "gems"
                }

                game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_random_fighter:InvokeServer(unpack(
                    args))
            end
            updatejson()
        end)

        misc:Toggle("Auto Summon {Buy 10}", getgenv().autosummongem10, function(bool)
            getgenv().autosummongem10 = bool
            while getgenv().autosummongem10 do
                task.wait()
                local args = {
                    [1] = "dbz_fighter",
                    [2] = "gems10"
                }

                game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_random_fighter:InvokeServer(unpack(
                    args))

            end
            updatejson()
        end)

        local utts = misc:Dropdown("Select Rarity", {"Rare", "Epic"}, getgenv().UnitToSell, function(u)
            getgenv().UnitToSell = u
        end)

        misc:Toggle("Auto Sell Units", getgenv().UnitSellTog, function(bool)
            getgenv().UnitSellTog = bool
        end)


        --//Custom Tab (in-game)\\--
        local customFeatures = serv:Channel("Custom Features")
        getgenv().autoopenocean = false
            
        customFeatures:Toggle("Auto Open Ocean Stars", getgenv().autoopenocean, function(bool)
            getgenv().autoopenocean = bool
            while getgenv().autoopenocean do
                task.wait()
                local args = {[1] = "capsule_marineford"}

                game:GetService("ReplicatedStorage").endpoints.client_to_server.use_item:InvokeServer(unpack(args))
            end
            updatejson()
        end)

        customFeatures:Toggle("Auto Farm Daily Infinite", getgenv().farmDailies, function(bool)
            getgenv().farmDailies = bool
            updatejson()

            while(getgenv().farmDailies) do
                task.wait()
                if(getgenv().namekDailyInfinite == false) then
                    getgenv().world = "Planet Namak"
                    getgenv().level = "namek_infinite"
                    getgenv().difficulty = "Hard"
                    getgenv().SpawnUnitPos = getgenv().namekSpawnPos

                elseif (getgenv().aotDailyInfinite == false) then
                    getgenv().world = "Shiganshinu District"
                    getgenv().level = "aot_infinite"
                    getgenv().difficulty = "Hard"
                    getgenv().SpawnUnitPos = getgenv().aotSpawnPos

                elseif (getgenv().demonslayerDailyInfinite == false) then
                    getgenv().world = "Snowy Town"
                    getgenv().level = "demonslayer_infinite"
                    getgenv().difficulty = "Hard"
                    getgenv().SpawnUnitPos = getgenv().demonslayerSpawnPos

                elseif (getgenv().narutoDailyInfinite == false) then
                    getgenv().world = "Hidden Sand Village"
                    getgenv().level = "naruto_infinite"
                    getgenv().difficulty = "Hard"
                    getgenv().SpawnUnitPos = getgenv().narutoSpawnPos

                else
                    getgenv().world = "Marine's Ford"
                    getgenv().level = "marineford_infinite"
                    getgenv().difficulty = "Hard"
                    getgenv().SpawnUnitPos = getgenv().marinefordSpawnPos

                end
            end

            

            updatejson()

            
        
        end)

        customFeatures:Button("Reset Dailies", function()
            getgenv().namekDailyInfinite = false
            getgenv().aotDailyInfinite = false
            getgenv().demonslayerDailyInfinite = false
            getgenv().narutoDailyInfinite = false
            getgenv().marinefordDailyInfinite = false

            updatejson()
        end)

        local traveling_merchant = game.workspace:FindFirstChild("travelling_merchant")
        customFeatures:Toggle("Auto Buy Star Remnant", getgenv().buyStarRemnant, function(bool)
            getgenv().buyStarRemnant = bool
            updatejson()
            
            if (traveling_merchant.is_open.value and getgenv().buyStarRemnant) then
                print("star remnant statemnt works")
                local items = traveling_merchant.stand.items:GetChildren()
                for i,v in pairs(items) do
                    local currItem = items[i]
                
                    if(currItem:FindFirstChild("star_remnant")) then
                        print("in here")
                        local starRemnant = currItem
                        local args = {
                            [1] = tostring(starRemnant)
                        }

                        game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(unpack(args))

                        local item = tostring(starRemnant)
                        buyItemWebhook(item)
                    end
                end
            end

        end)

        customFeatures:Toggle("Auto Buy Summon Ticket", getgenv().buySummonTicket, function(bool)
            getgenv().buySummonTicket = bool
            updatejson()

            if (traveling_merchant.is_open.value and getgenv().buySummonTicket) then
                local items = traveling_merchant.stand.items:GetChildren()
            
                for i,v in pairs(items) do
                    local currItem = items[i]
                
                    if(currItem:FindFirstChild("star_neon")) then
                        local summonTicket = currItem
                        local args = {
                            [1] = tostring(summonTicket)
                        }
        
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(unpack(args))
                        
                        local item = tostring(summonTicket)
                        buyItemWebhook(summonTicket)
                    end
                end
            end

        end)

    end

    local credits = serv:Channel("Credits")
    credits:Label("Forever4D#0001")
    credits:Label("Arpon AG#6612")
    credits:Button("Copy Discord Invite", function()
        setclipboard("https://arponag.xyz/Discord")
        DiscordLib:Notification("Notification", "Discord link copied to your clipboard", "Okay!")
    end)
    credits:Label(" ")


end

--------------------------------------------------
--------------------------------------------------

---// Checks if file exist or not\\---
if isfile(savefilename) then 
    sex()
else
    local xdata = {
        -- unitname = "name",
        -- unitid = "id",
        autoabilities = false,
        buyStarRemnant = false,
        buySummonTicket = false,
        namekDailyInfinite = false,
        aotDailyInfinite = false,
        narutoDailyInfinite = false,
        demonslayerDailyInfinite = false,
        marinefordDailyInfinite = false,
        webhook = "",
        sellatwave = 0,
        autosell = false,
        autofarm = false,
        autostart = false,
        autoupgrade = false,
        difficulty = "Normal",
        world = "nil",
        level = "nil",
        door = "nil",
        xspawnUnitPos = {
            UP1 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP2 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP3 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP4 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },
            
            UP5 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP6 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            }
        },

        xnamekSpawnPos = {
            UP1 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP2 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP3 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP4 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },
            
            UP5 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP6 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            }
        },

        xaotSpawnPos = {
            UP1 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP2 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP3 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP4 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },
            
            UP5 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP6 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            }
        },

        xdemonslayerSpawnPos = {
            UP1 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP2 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP3 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP4 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },
            
            UP5 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP6 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            }
        },

        xnarutoSpawnPos = {
            UP1 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP2 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP3 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP4 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },
            
            UP5 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP6 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            }
        },

        xmarinefordSpawnPos = {
            UP1 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP2 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP3 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP4 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },
            
            UP5 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            },

            UP6 = {
                x = -2952.81689453125,
                y = 91.80620574951172,
                z = -707.9673461914062
            }
        },
        
        xselectedUnits = {
            U1 = nil,
            U2 = nil,
            U3 = nil,
            U4 = nil,
            U5 = nil,
            U6 = nil
        }

    }
    local json = HttpService:JSONEncode(xdata)
    writefile(savefilename, json)

    sex()
end
--------------------------------------------------



------// Auto Farm \\------
coroutine.resume(coroutine.create(function()
    while task.wait() do
        local _wave = game:GetService("Workspace"):WaitForChild("_wave_num")
        
        if getgenv().AutoFarm and not getgenv().disableatuofarm then
            if game.PlaceId ~= 8304191830 then
                x = 4
                y = 3
                z = 4

                for i = 1, 6 do
                    local unitinfo = getgenv().SelectedUnits["U" .. i]
                    if unitinfo ~= nil then
                        local unitinfo_ = unitinfo:split(" #")
                        local pos = getgenv().SpawnUnitPos["UP" .. i]

                        --place units 0
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"], pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 1
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"], pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 2 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"], pos["y"], pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 3 
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] - x, pos["y"], pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 4
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"]+ x, pos["y"], pos["z"] + z), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

                        --place units 5
                        local args = {
                            [1] = unitinfo_[2],
                            [2] = CFrame.new(Vector3.new(pos["x"] + x, pos["y"] , pos["z"]), Vector3.new(0, 0, -1))
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end
end))

------// Auto Leave \\------
coroutine.resume(coroutine.create(function()
	local GameFinished = game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished")
	GameFinished:GetPropertyChangedSignal("Value"):Connect(function()
	print("Changed", GameFinished.Value == true)
	while GameFinished.Value == true do
        repeat task.wait() until  game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Enabled == true
        task.wait()

		pcall(function() webhook() end)
        print("next")


        repeat task.wait() until game:GetService("TeleportService"):Teleport(8304191830, game.Players.LocalPlayer)
        
	end
	end)
end))




------// Auto Sell Units \\------
coroutine.resume(coroutine.create(function()
while task.wait() do
    if getgenv().UnitSellTog then

        for i, v in pairs(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.collection.grid.List.Outer.UnitFrames:GetChildren()) do
            if v.Name == "CollectionUnitFrame" then
                repeat task.wait() until v:FindFirstChild("name")
                for _, Info in next, getgenv().UnitCache do
                    if Info.name == v.name.Text and Info.rarity == getgenv().UnitToSell then
                        local args = {
                            [1] = {
                                [1] = tostring(v._uuid.Value)
                            }
                        }
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_units:InvokeServer(unpack(args))
                     end
                end
            end
        end
        
    end
end
end))

------// Auto Upgrade \\------
coroutine.resume(coroutine.create(function()
    while task.wait() do
        if getgenv().autoupgrade then
            if game.PlaceId ~= 8304191830 then
                local max = 8
                repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
                for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
                    repeat task.wait() until v:WaitForChild("_stats")
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                        repeat task.wait() until v:WaitForChild("_stats"):WaitForChild("upgrade")

                        if v["_stats"].upgrade.Value == 0 or v["_stats"].upgrade.Value <= max then
                            game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(v)
                        end
                    end
                end
            end
        end
    end
end))


------// Auto Sell \\------
coroutine.resume(coroutine.create(function()
    while task.wait() do
        local _wave = game:GetService("Workspace"):WaitForChild("_wave_num")
        if getgenv().autosell and tonumber(getgenv().sellatwave) <= _wave.Value then
            getgenv().disableatuofarm = true
            if game.PlaceId ~= 8304191830 then
                repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
                for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
                    repeat
                        task.wait()
                    until v:WaitForChild("_stats")
                    if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                        repeat
                            task.wait()
                        until v:WaitForChild("_stats"):WaitForChild("upgrade")
            
                        game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(v)
                    end
                end
            end
        end
    end
end))

--//Auto Abilities--
coroutine.resume(coroutine.create(function()
    pcall(function()
        while task.wait() do
            if getgenv().autoabilities then
                if game.PlaceId ~= 8304191830 then
                    repeat task.wait() until game:GetService("Workspace"):WaitForChild("_UNITS")
                    for i, v in ipairs(game:GetService("Workspace")["_UNITS"]:GetChildren()) do
                        repeat task.wait() until v:WaitForChild("_stats")
                        if v:FindFirstChild("_stats") then
                            if tostring(v["_stats"].player.Value) == game.Players.LocalPlayer.Name then
                                game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack:InvokeServer(v)
                            end
                        end
                    end
                end
            end
        end
    end)
end))

------// Auto Start \\------
coroutine.resume(coroutine.create(function()
    while task.wait() do
        if getgenv().autostart and getgenv().AutoFarm then
            if game.PlaceId == 8304191830 then
                if(getgenv().farmDailies) then
                    task.wait()
                    if(getgenv().namekDailyInfinite == false) then
                        getgenv().world = "Planet Namak"
                        getgenv().level = "namek_infinite"
                        getgenv().difficulty = "Hard"
                        getgenv().SpawnUnitPos = getgenv().namekSpawnPos
    
                    elseif (getgenv().aotDailyInfinite == false) then
                        getgenv().world = "Shiganshinu District"
                        getgenv().level = "aot_infinite"
                        getgenv().difficulty = "Hard"
                        getgenv().SpawnUnitPos = getgenv().aotSpawnPos
    
                    elseif (getgenv().demonslayerDailyInfinite == false) then
                        getgenv().world = "Snowy Town"
                        getgenv().level = "demonslayer_infinite"
                        getgenv().difficulty = "Hard"
                        getgenv().SpawnUnitPos = getgenv().demonslayerSpawnPos
    
                    elseif (getgenv().narutoDailyInfinite == false) then
                        getgenv().world = "Hidden Sand Village"
                        getgenv().level = "naruto_infinite"
                        getgenv().difficulty = "Hard"
                        getgenv().SpawnUnitPos = getgenv().narutoSpawnPos
    
                    else
                        getgenv().world = "Marine's Ford"
                        getgenv().level = "marineford_infinite"
                        getgenv().difficulty = "Hard"
                        getgenv().SpawnUnitPos = getgenv().marinefordSpawnPos
    
                    end
                    updatejson()
                end

                    if(getgenv().world == "Planet Namak") then
                        getgenv().SpawnUnitPos = getgenv().namekSpawnPos
        
                    elseif (getgenv().world == "Shiganshinu District") then
                        getgenv().SpawnUnitPos = getgenv().aotSpawnPos
        
                    elseif (getgenv().world == "Snowy Town") then
                        getgenv().SpawnUnitPos = getgenv().demonslayerSpawnPos
                        
                    elseif (getgenv().world == "Hidden Sand Village") then
                        getgenv().SpawnUnitPos = getgenv().narutoSpawnPos
        
                    elseif (getgenv().world == "Marine's Ford") then
                        getgenv().SpawnUnitPos = getgenv().marinefordSpawnPos
        
                    end
                    updatejson()


                local traveling_merchant = game.workspace:FindFirstChild("travelling_merchant")
                if (traveling_merchant.is_open.value and getgenv().buyStarRemnant) then
                    print("star remnant statemnt works")
                    local items = traveling_merchant.stand.items:GetChildren()
                    for i,v in pairs(items) do
                            local currItem = items[i]
                        
                            if(currItem:FindFirstChild("star_remnant")) then
                                print("in here")
                                local starRemnant = currItem
                                local args = {
                                    [1] = tostring(starRemnant)
                                }

                                game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(unpack(args))

                                local item = tostring(starRemnant)
                                buyItemWebhook(item)
                            end
                        end
                    end

                    if (traveling_merchant.is_open.value and getgenv().buySummonTicket) then
                        local items = traveling_merchant.stand.items:GetChildren()
                    
                        for i,v in pairs(items) do
                            local currItem = items[i]
                        
                            if(currItem:FindFirstChild("star_neon")) then
                                local summonTicket = currItem
                                local args = {
                                    [1] = tostring(summonTicket)
                                }
                
                                game:GetService("ReplicatedStorage").endpoints.client_to_server.buy_travelling_merchant_item:InvokeServer(unpack(args))
                                
                                local item = tostring(summonTicket)
                                buyItemWebhook(item)
                            end
                        end
                    end


                for i, v in pairs(game:GetService("Workspace")["_LOBBIES"].Story:GetDescendants()) do
                    if v.Name == "Owner" and v.Value == nil then
                        getgenv().door = v.Parent.Name
                        break
                    end
                end

                task.wait(0.1)

                local args = {
                    [1] = getgenv().door
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(
                    args))

                    task.wait(0.1)

                local args = {
                    [1] = getgenv().door, -- Lobby 
                    [2] = getgenv().level, -- World
                    [3] = true, -- Friends Only or not
                    [4] = getgenv().difficulty
                }
                game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(
                    args))

                    task.wait(0.1)

                local args = {
                    [1] = getgenv().door
                }

                game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
                task.wait()
            end
        end
    end
end))

--hide name
task.spawn(function()  -- Hides name for yters (not sure if its Fe)
    while task.wait() do
        pcall(function()
            if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
               workspace[game.Players.LocalPlayer.Name].Head["_overhead"]:Destroy()
            end
        end)
    end
end)

--anti afk
pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
---------------------------------------------------------------------
