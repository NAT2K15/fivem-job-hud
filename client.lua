local config = {
    x = 0.172,
    y = 0.8775,
    message = "Discord: ~b~discord.gg/RquDVTfDwu~w~ | ~g~Job: ~y~%s"
}

local player = "unknown"


RegisterNetEvent('NAT2K15:UNFREEZE')
AddEventHandler('NAT2K15:UNFREEZE', function() 
    Citizen.Wait(3000)
    local id = GetPlayerServerId(PlayerId())
    local data = exports.core_framework:getclientdept(id)
    if(data == nil) then
        player = "unknown"
    else 
        if(data[id]) then
            player = data[id].dept
        else 
            player = "unknown"
        end
    end

end)

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(0)
        SetTextFont(4)
        SetTextScale(0.44, 0.44)
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(string.format(config.message, player))
        DrawText(config.x, config.y)
    end
end)