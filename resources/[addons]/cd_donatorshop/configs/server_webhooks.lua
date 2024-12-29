------------------------------------------------------------------------------------------------------
-------------------------------------------- WEBHOOK URLS --------------------------------------------
------------------------------------------------------------------------------------------------------
--REPLACE 'CHANGE_ME' WITH YOUR DISCORD WEBHOOK.
local Logs_Redeem = 'CHANGE_ME' --Logs to discord when a player redeems a purchase.
local Logs_UIPurchase = 'CHANGE_ME' --Logs to discord when a player purchases an in-game item through the UI.
local Logs_VehiclePurchase = 'CHANGE_ME' --Logs to discord when a player purchases an in-game vehicle.
local ExploitLogWebhook = 'CHANGE_ME' --Logs to discord when the script detects a player is using a lua injector.
local StaffLogWebhook = 'CHANGE_ME' --Logs to discord when a staff member uses the chat command to add/remove tokens from players.

------------------------------------------------------------------------------------------------------
---------------------------------------------- WEBHOOKS ----------------------------------------------
------------------------------------------------------------------------------------------------------
function RedeemLogs(source, transaction_id, balance)
    if Logs_Redeem ~= nil and #Logs_Redeem > 10 then
        local message = string.format(L('logs_redeem_message'), GetPlayerName(source), GetIdentifier_player(source), transaction_id, balance)
        local data = {{
            ['color'] = '56108',
            ['title'] = L('logs_redeem_title'),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(Logs_Redeem, function(err, text, headers) end, 'POST', json.encode({username = L('logs_botname'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end

function UIPurchaseLogs(source, data, total_spent)
    if Logs_UIPurchase ~= nil and #Logs_UIPurchase > 10 then
        local count = 0
        local message = string.format(L('logs_purchase_info'), GetPlayerName(source), GetIdentifier_player(source))..'\n'
        for cd = 1, #data do
                count = count+1
                message = message..'**['..count..']**\n'..data[cd]..'\n\n'
        end
        message = message..''..string.format(L('logs_purchase_total'), total_spent)
        local data = {{
            ['color'] = '16711680',
            ['title'] = L('logs_purchase_title'),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(Logs_UIPurchase, function(err, text, headers) end, 'POST', json.encode({username = L('logs_botname'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end

function VehiclePurchaseLogs(source, plate, label, model, garage_type, cost)
    if Logs_VehiclePurchase ~= nil and #Logs_VehiclePurchase > 10 then
        local message = string.format(L('logs_purchasevehicle_message'), GetPlayerName(source), GetIdentifier_player(source), plate, label, model, garage_type, cost)
        local data = {{
            ['color'] = '2061822',
            ['title'] = L('logs_purchasevehicle_title'),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(Logs_VehiclePurchase, function(err, text, headers) end, 'POST', json.encode({username = L('logs_botname'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end

function ExploitAlertLogs(source, identifier)
    if ExploitLogWebhook ~= nil and #ExploitLogWebhook > 10 then
        local message = string.format(L('logs_exploit_message'), GetPlayerName(source), source, identifier)
        PerformHttpRequest(ExploitLogWebhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

function StaffLogs(source, target, action, amount)
    if StaffLogWebhook ~= nil and #StaffLogWebhook > 10 then
        local message = string.format(L('logs_stafflog_message'), GetPlayerName(source), GetIdentifier_player(source), GetPlayerName(target), target, GetIdentifier_player(target), action, amount)
        local data = {{
            ['color'] = '56108',
            ['title'] = L('logs_stafflog_title'),
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date('%c'),
                ['icon_url'] = 'https://i.imgur.com/VMPGPTQ.png',
            },
        }}
        PerformHttpRequest(StaffLogWebhook, function(err, text, headers) end, 'POST', json.encode({username = L('logs_botname'), embeds = data}), { ['Content-Type'] = 'application/json' })
    end
end