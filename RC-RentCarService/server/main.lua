local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRPclient = Tunnel.getInterface("vRP", "dit_script") 
vRP = Proxy.getInterface("vRP")


HT = nil

TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)

RegisterNetEvent("rc-rentCar:TriggerCarSpawn")
AddEventHandler("rc-rentCar:TriggerCarSpawn", function(currentVehicle,playerHasBoughtVeh, currentPrice)
local _source = source
local user_id = vRP.getUserId({source})

    print(currentPrice)
    print(currentVehicle)
    print(playerHasBoughtVeh)

    if vRP.getMoney({user_id}) < currentPrice then
        local playerHasBoughtVehNew = false
        TriggerClientEvent("rc-rentCar:noMoney", source)
        TriggerClientEvent("rc-rentCar:changeStautus", source,playerHasBoughtVehNew)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du mangler'..currentPrice..' Kontanter!', length = 2500, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } })
    else
        vRP.tryPayment({user_id,currentPrice})
        TriggerClientEvent("rc-rentCar:spawnCar", source, currentVehicle, playerHasBoughtVeh)
    end

    
end)

RegisterNetEvent("change:Status")
AddEventHandler("change:Status", function(playerHasBoughtVehNew)

    TriggerClientEvent("rc-rentCar:changeStautus", source,playerHasBoughtVehNew)

end)