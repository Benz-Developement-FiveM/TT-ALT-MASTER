RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
	SendAlert(data.type, data.text, data.length, data.style)
end)

RegisterNetEvent('mythic_notify:client:PersistentAlert')
AddEventHandler('mythic_notify:client:PersistentAlert', function(data)
	PersistentAlert(data.action, data.id, data.type, data.text, data.style)
end)

function SendAlert(type, text, length, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = length,
		style = style
	})
end

function PersistentAlert(action, id, type, text, style)
	if action:upper() == 'START' then
		SendNUIMessage({
			persist = action,
			id = id,
			type = type,
			text = text,
			style = style
		})
	elseif action:upper() == 'END' then
		SendNUIMessage({
			persist = action,
			id = id
		})
	end
end

--[[ RegisterCommand("bildirimtest", function(source, args, rawCommand)
	exports['mythic_notify']:DoCustomHudText('error', "Hatalı mesajı --- Hatalı mesajı --- Hatalı mesajı" ,15000)
	Citizen.Wait(2500)
	exports['mythic_notify']:DoCustomHudText('error', "Bilgi mesajı  --- Bilgi mesajı  --- Bilgi mesajı" ,12500)
	Citizen.Wait(2500)
	exports['mythic_notify']:DoCustomHudText('error', "Başarılı mesajı - Başarılı mesajı - Başarılı mesajı" ,10000)
end, false)
 ]]