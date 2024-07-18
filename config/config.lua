local QBCore = exports['qb-core']:GetCoreObject()

function IsVehicleOverturned(vehicle)
    local roll = GetEntityRoll(vehicle)
    return (roll > 75.0 or roll < -75.0)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 

        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if IsVehicleOverturned(vehicle) then
                DisableControlAction(0, 59, true) -- direccion
                DisableControlAction(0, 60, true) -- aceleracion
            else
                EnableControlAction(0, 59, true)
                EnableControlAction(0, 60, true)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)
