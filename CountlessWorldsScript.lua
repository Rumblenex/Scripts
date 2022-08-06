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
getgenv().autoDrops = true
getgenv().autoBattle = true
getgenv().player = ""

-- Tabs
local mainTab = Window:NewTab("Main")

local mainSection = mainTab:NewSection("Main Scripts")
    
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
    if state then
        PickupDrops()
    end
end)

-- auto battle
mainSection:NewToggle("Auto Battle", "Picks up Battle Orbs", function(state) 
    getgenv().autoBattle = state
    if state then
        Battle()
    end
end)

--auto pick up function
function PickupDrops()
   spawn(function()
        while getgenv().autoDrops do
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
    end) 
end


-- auto pick up battle orb
function Battle()
    spawn(function()
        while getgenv().autoBattle do
            wait(0.1)
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
    end) 
end



