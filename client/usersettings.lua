RegisterNetEvent('Lux_Lib:SetUserSettings')
AddEventHandler('Lux_Lib:SetUserSettings', function(settings, type)
    if type == 'notify' then 
        Config.NotifyType = settings
    elseif type == 'input' then 
        Config.InputType = settings
    elseif type == 'progressbar' then 
        Config.ProgressbarType = settings
    end
end)

RegisterNetEvent(Config.PlayerLoadedEventName)
AddEventHandler(Config.PlayerLoadedEventName,function()
    LUX.TriggerServerCallback('Lux_Lib:GetUserSettings', function(Settings) 
        if Settings then
            if Settings.notify then
                Config.NotifyType = Settings.notify
            end
            if Settings.input then
                Config.InputType = Settings.input
            end
            if Settings.progressbar then
                Config.ProgressbarType = Settings.progressbar
            end
        end
    end)
end)