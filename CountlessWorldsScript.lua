local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Change Theme and create window
local colors = {
    SchemeColor = Color3.fromRGB(200,200,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Window = Library.CreateLib("Countless Worlds GUI, Made by Rumblenex", colors)

-- global variables
local stack = 1
getgenv().autoDrops = false
getgenv().autoBattle = false
getgenv().player = ""

-- Tabs
local mainTab = Window:NewTab("Main")
local miscTab = Window:NewTab("Misc")

local mainSection = mainTab:NewSection("Main Scripts")
local miscSection = miscTab:NewSection("Misc")

-- God Mode
mainSection:NewButton("God Mode", "Immune To All Damage", function(state)
    for i,v in pairs(game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name):GetChildren()) do
        if v.Name == "Hitbox" then
            v:Destroy()
        end
    end
end)

-- Auto Pick up Drops
mainSection:NewToggle("Auto Pickup", "Picks up all drops on kill", function(state)
    getgenv().autoDrops = state
end)

-- auto battle
mainSection:NewToggle("Auto Battle", "Picks up Battle Orbs", function(state) 
    getgenv().autoBattle = state
end)

-- speed
miscSection:NewTextBox("Walkspeed", "Sets player walkspeed", function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

--auto pick up function
coroutine.resume(coroutine.create(function()
   pcall(function()
        while task.wait() do
            if getgenv().autoDrops then
                -- pick up drops
                if game.workspace.Dropped then
                    for i,v in pairs(game.workspace.Dropped:GetChildren()) do
                        v.Grab:FireServer()
                    end
                end
                -- pick up exp and money
                if game.workspace.Globes then
                    for i,v in pairs(game.workspace.Globes:GetChildren()) do
                        v.Grab:FireServer()
                    end
                end
                wait(0.1)
            end
        end
    end)
end))


-- auto pick up battle orb
coroutine.resume(coroutine.create(function()
    pcall(function()
        while task.wait() do
            wait(0.1)
            if getgenv().autoBattle then
                if game.workspace:WaitForChild("OrbFolder") then
                    print(stack)
                    for i,v in pairs(game.workspace.OrbFolder:GetChildren()) do
                        local args = {
                            [1] = tostring(v),
                            [2] = false,
                            [3] = {
                                ["NewStack"] = stack,
                                ["Gui"] = game:GetService("ReplicatedStorage").StyleStuff.Bounce
                            }
                        }
                        game:GetService("ReplicatedStorage").Networking.RemoteEvents.OrbRem:FireServer(unpack(args))
                        stack = stack + 1
                        v:Destroy()
                    end
                end
            end
        end
    end)
end))



