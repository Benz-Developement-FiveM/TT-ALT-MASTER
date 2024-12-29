function sendCustomDiscordMessage(webhook, name, message, color, footer)
    footer = footer or "rcore_tattoos | rcore.cz"
    color = color or SConfig.DiscordColors.Grey
    local embeds = {
        {
            ["title"] = name,
            ["description"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
    end, 'POST', json.encode({ username = name, embeds = embeds }), { ['Content-Type'] = 'application/json' })
end

function fromSecondsToDays(val)
    return val/24/60/60
end

function isDiscordWebhookFilled()
    return not (SConfig.LogWebhook == 'YOUR_DISCORD_HOOK')
end

function findDiscordIdentifier(source)
    local discordId
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
        end
    end
    return discordId
end

function getNiceName(playerId)
    local discordLicense = findDiscordIdentifier(playerId)
    if discordLicense then
        return string.format('%s <@%s>', GetPlayerName(playerId), discordLicense)
    end

    return GetPlayerName(playerId)
end

function sendDiscordBuyTattoo(playerId, tattooName, expiration)
    if not isDiscordWebhookFilled() then
        dbg.warning('Webhook is not filled in sconfig.lua')
        return
    end

    if expiration == false then
        sendCustomDiscordMessage(SConfig.LogWebhook, _U('discord.title'), _U('discord.buy_tattoo', getNiceName(playerId), tattooName), 0x50bf15, "rcore_tattoos")
    else
        sendCustomDiscordMessage(SConfig.LogWebhook, _U('discord.title'), _U('discord.buy_hena_tattoo', getNiceName(playerId), tattooName, fromSecondsToDays(expiration)), 0x50bf15, "rcore_tattoos")
    end
end

function sendDiscordBuyBusinessTattoo(playerId, tattooName, expiration, businessName, employeeId)
    if not isDiscordWebhookFilled() then
        dbg.warning('Webhook is not filled in sconfig.lua')
        return
    end

    if expiration == false then
        if employeeId then
            sendCustomDiscordMessage(SConfig.LogWebhook, _U('discord.title'), _U('discord.buy_tattoo_business_employee', getNiceName(playerId), tattooName, businessName, getNiceName(employeeId)), 0x50bf15, "rcore_tattoos")
        else
            sendCustomDiscordMessage(SConfig.LogWebhook, _U('discord.title'), _U('discord.buy_tattoo_business', getNiceName(playerId), tattooName, businessName), 0x50bf15, "rcore_tattoos")
        end
    else
        if employeeId then
            sendCustomDiscordMessage(SConfig.LogWebhook, _U('discord.title'), _U('discord.buy_hena_tattoo_business_employee', getNiceName(playerId), tattooName, businessName, getNiceName(employeeId)), 0x50bf15, "rcore_tattoos")
        else
            sendCustomDiscordMessage(SConfig.LogWebhook, _U('discord.title'), _U('discord.buy_hena_tattoo_business', getNiceName(playerId), tattooName, businessName), 0x50bf15, "rcore_tattoos")
        end
    end
end

function sendDiscordRemoveTattoo(playerId, tattooName)
    if not isDiscordWebhookFilled() then
        dbg.warning('Webhook is not filled in sconfig.lua')
        return
    end

    sendCustomDiscordMessage(SConfig.LogWebhook, _U('discord.title'), _U('discord.remove_tattoo', getNiceName(playerId), tattooName), 0xb72424, "rcore_tattoos")
end
