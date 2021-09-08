vRP = Proxy.getInterface("vRP")

HT = nil
local PlayerData = {}
local allCarsSpawned = false
local setTimerStarte = false

Citizen.CreateThread(function()
    while HT == nil do
        TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)
local slot1Used = false

while true do
	Citizen.Wait(4)

	DrawMarker(2, Config.Marker.x, Config.Marker.y, Config.Marker.z,  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 110, 0, 1, 0, 1)
	

end


end)

RegisterNetEvent("rc-rentCar:spawnCar")
AddEventHandler("rc-rentCar:spawnCar", function(currentVehicle, playerHasBoughtVeh)
	playerPed = PlayerPedId()
	print(currentVehicle)
	print(playerHasBoughtVeh)
	DoScreenFadeOut(1000)
	Citizen.Wait(1500)
	DoScreenFadeIn(600)
	exports['mythic_notify']:DoCustomHudText('inform', 'Bilen skal aleveres om 30 min')
		SpawnVehicle(currentVehicle, function(vehicle)
		if playerHasBoughtVeh == true then
			setTimerStarte = true
			Citizen.SetTimeout(Config.RentTime, function()
				DeleteVehicle(vehicle)
				PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 1)
				local playerHasBoughtVehNew = false
				TriggerServerEvent("change:Status", playerHasBoughtVehNew)
			end)

			Citizen.SetTimeout(Config.WarningRentTime1, function()
				exports['mythic_notify']:DoCustomHudText('inform', 'Bilen skal aleveres om 15 min')
			end)

			Citizen.SetTimeout(Config.WarningRentTime2, function()
				exports['mythic_notify']:DoCustomHudText('inform', 'Bilen skal aleveres om 1 min')
			end)

			
	
		end

		
	end)

end)

function SpawnVehicle(currentVehicle)
	local mhash = currentVehicle
    local i = 0
    while not HasModelLoaded(mhash) and i < 10000 do
      RequestModel(mhash)
      Citizen.Wait(10)
      i = i+1
    end
  
    -- spawn car
    if HasModelLoaded(mhash) then
      local nveh = CreateVehicle(mhash, Config.CarSpawnLocation.slot1, true, true) -- added player heading
      SetVehicleOnGroundProperly(nveh)
      SetEntityInvincible(nveh,false)
	  SetVehicleColours(nveh, 112, 112)
      SetPedIntoVehicle(GetPlayerPed(-1),nveh,-1) -- put player inside
      SetEntityAsMissionEntity(nveh, true, true) -- set as mission entity
      SetModelAsNoLongerNeeded(mhash) 
    end
  end

