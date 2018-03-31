local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPdv = {}
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","delivery")
TSclient = Tunnel.getInterface("delivery","delivery")
Tunnel.bindInterface("delivery",vRPdv)


RegisterServerEvent('delivery:checkjob')
AddEventHandler('delivery:checkjob', function()
	local source = source
	local user_id = vRP.getUserId(source)
    local player = vRP.getUserSource(user_id)

    if vRP.hasPermission(user_id,"delivery.gopostal") then --here check if you have permission
      TriggerClientEvent('yesdelivery', source)
    else
      TriggerClientEvent('nodelivery', source)
    end
end)


--Essential payment functions 

RegisterServerEvent('delivery:success')
AddEventHandler('delivery:success', function(amount)
	-- Get the players money amount
local source = source
local user_id = vRP.getUserId(source)
local money = vRP.getMoney(user_id)
 -- update player money amount
vRP.giveMoney(user_id,amount)
TriggerClientEvent('chatMessage', source, "SERVER", {255, 0, 0}, "Você recebeu: ^2" .. amount .. "$.")
end)
