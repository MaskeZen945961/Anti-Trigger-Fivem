ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- onlystaff = true = only staff can use this event , false = all player can use this event
-- joballowed = "jobname" = only player with this job can use this event , nil = all player can use this event
-- job2allowed = "jobname" = only player with this job2 can use this event , nil = all player can use this event
-- kick = true = kick the player if he use this event , false = don't kick the player if he use this event
-- ban = true = ban the player if he use this event , false = don't ban the player if he use this event
-- notif = true = show a notification to the player if he use this event , false = don't show a notification to the player if he use this event
-- coord = vector3(0,0,0) = the player must be in this coord to use this event , nil = the player can use this event everywhere
-- reason = "reason" = the reason of the kick/ban if the player use this event

--If you dont have SqlBan download it here : https://github.com/RedAlex/FiveM-BanSql/tree/master else edit the event to ban the player


Antitriggerserverent = {
    {event = "esx:giveInventoryItem", onlystaff = false, joballowed = nil , job2allowed = nil , kick = nil, ban = nil , notif = true , coord = nil  , reason = "Anti Trigger Server Event"},
    {event = "Ambulance:revive", onlystaff = true, joballowed = "ambulance" , job2allowed = nil , kick = true, ban = nil , notif = false , coord = nil, reason = "Anti Trigger Server Event"},
    --Here you can add more event
}

for _, data in pairs(Antitriggerserverent) do
    RegisterServerEvent(data.event)
    AddEventHandler(data.event, function()
        local src = source
        xPlayer = ESX.GetPlayerFromId(src)
        group = xPlayer.getGroup()
        if data.onlystaff == true then
            if group == "user" then
                if data.kick == true then
                    DropPlayer(src, "Anti Trigger Server Event (" .. data.event .. ")")
                end
                if data.ban == true then
                    TriggerEvent('BanSql:ICheat' , src , "Anti Trigger Server Event (" .. data.event .. ")")
                end
                if data.notif == true then
                    TriggerClientEvent('esx:showNotification', src, data.reason .. " Not staff")
                end

                return
            end
        end
        if data.joballowed then
            if xPlayer.job.name ~= data.joballowed then
                if xPlayer.getGroup() == "user" then
                    if data.kick == true then
                        DropPlayer(src, "Anti Trigger Server Event (" .. data.event .. ")")
                    end
                    if data.ban == true then
                        TriggerEvent('BanSql:ICheat' , src , "Anti Trigger Server Event (" .. data.event .. ")")
                    end
                    if data.notif == true then
                        TriggerClientEvent('esx:showNotification', src, data.reason .. " Not job")
                    end
                end 
                return
            end
        end
        if data.job2allowed then
            if xPlayer.job2.name ~= data.job2allowed then
                if xPlayer.getGroup() == "user" then
                    if data.kick == true then
                        DropPlayer(src, "Anti Trigger Server Event (" .. data.event .. ")")
                    end
                    if data.ban == true then
                        TriggerEvent('BanSql:ICheat' , src , "Anti Trigger Server Event (" .. data.event .. ")")
                    end
                    if data.notif == true then
                        TriggerClientEvent('esx:showNotification', src, data.reason .. " Not job2")
                    end
                end 
                return
            end
        end
        if data.coord then
            local xPlayer = ESX.GetPlayerFromId(src)
            local coords = xPlayer.getCoords(true)
            local distance = #(coords - data.coord)
            if distance > 10 then
                if data.kick == true then
                    DropPlayer(src, "Anti Trigger Server Event (" .. data.event .. ")")
                end
                if data.ban == true then
                    TriggerEvent('BanSql:ICheat' , src , "Anti Trigger Server Event (" .. data.event .. ")")
                end
                if data.notif == true then
                    TriggerClientEvent('esx:showNotification', src, data.reason .. " Not coord")
                end
                return
            end
        end
    end)
end
