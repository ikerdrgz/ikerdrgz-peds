print('^5[ikerdrgz-peds] [INFO]: Script initializing!^0')

CreateThread(function()
    create()
end)

---------------------
---- Main Thread ----
---------------------

if ZConfig.enable_thread then
    CreateThread(function()
        while true do
            while PlayerPedId() == nil do Wait(500); end
            local ms = ZConfig.thread_ms
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            for k,v in pairs(ZConfig.peds) do
                if #(pos - vec3(v.coords.x, v.coords.y, v.coords.z)) <= ZConfig.interact_dist then ms = 5;
                    help(v.coords.x, v.coords.y, v.coords.z + 0.8, v.text)
                   
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent(v.event)
                    end
                end
            end

            Wait(ms)
        end
    end)
end

-------------------
---- Functions ----
-------------------

function create()
    for k,v in pairs(ZConfig.peds) do
        RequestModel(GetHashKey(v.model))

        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(0)
        end
    
        created_ped = CreatePed(5, GetHashKey(v.model), vector3(v.coords.x, v.coords.y, v.coords.z - 1), false, true)
        SetEntityHeading(created_ped, v.coords.w)
        SetEntityAsMissionEntity(created_ped, true, true)
        FreezeEntityPosition(created_ped, true)
        SetBlockingOfNonTemporaryEvents(created_ped, true)
        SetEntityInvincible(created_ped, true)
        SetPedFleeAttributes(created_ped, 0, 0)
        
        GiveWeaponToPed(created_ped, GetHashKey(v.weapon), 0, false, true)
        SetCurrentPedWeapon(created_ped, GetHashKey(v.weapon), true)
    end
end

function help(x, y, z, txt)
	AddTextEntry('ikerdrgz-peds', txt)
	SetFloatingHelpTextWorldPosition(1, x, y, z)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('ikerdrgz-peds')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

print('^2[ikerdrgz-peds] [SUCCESS]: Script successfully started and created ' .. #ZConfig.peds .. ' peds!^0')