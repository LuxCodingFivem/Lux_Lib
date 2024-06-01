local messageQueue = {}

function Notify(msg, title, time, type)
    SendNUIMessage({
        type = 'Notify',
        icon = Config.LuxNotifyTypes[type],
        title = title,
        msg = msg,
        time = time
    })
end

CreateThread(function()
    while true do
        Wait(100)
        while #messageQueue > 0 do
            local message = table.remove(messageQueue, 1)
            if Config.NotifyType == 'LUX' then
                Notify(FormatText(message.msg) or '', FormatText(message.title) or '', message.time or 2500, message.type or 'info')
            elseif Config.NotifyType == 'Native' then
                SetNotificationTextEntry('STRING')
                AddTextComponentString(message.msg)
                DrawNotification(false, true)
            elseif Config.NotifyType == 'Drillen' then 
                exports['dillen_notifications']:sendNotification({message = FormatText(message.msg) or '', title = FormatText(message.title) or '', duration = message.time or 2500, type = message.type or 'info'})
            elseif Config.NotifyType == 'SY' then
                exports['SY_Notify']:Alert(FormatText(message.title) or '', FormatText(message.msg) or '', message.time or 2500, message.type or 'info')
            elseif Config.NotifyType == 'okok' then
                exports['okokNotify']:Alert(FormatText(message.title) or '', FormatText(message.msg) or '', message.time or 2500, message.type or 'info')
            elseif Config.NotifyType == 'wasabi' then
                exports['wasabi_notify']:notify(FormatText(message.title) or '', FormatText(message.msg) or '', message.time or 2500, message.type or 'info')
            elseif Config.NotifyType == 'mythic' then
                if message.type == 'info' then 
                    message.type = 'inform'
                end
                exports['mythic_notify']:DoHudText(message.type or 'inform', FormatText(message.msg) or '')   
            elseif Config.NotifyType == 'ESX' then
                ESX = exports['es_extended']:getSharedObject()
                ESX.ShowNotification(message.msg or '')
            elseif Config.NotifyType == 'QBCore' then
                QBCore = exports['qb-core']:GetCoreObject()
                QBCore.Functions.Notify(message.msg or '', type or 'primary', message.time or 2500)
            elseif Config.NotifyType == 'OX' then 
                lib.notify({
                    title = FormatText(message.title) or '',
                    description = FormatText(message.msg) or '',
                    type = message.type or 'info'
                })
            end
            Wait(100)
        end
    end
end)

function QueueMessage(msg, title, time, type)
    table.insert(messageQueue, {
        msg = msg,
        title = title,
        time = time,
        type = type
    })
end

LUX.Notify = function(msg, title, time, type)
    QueueMessage(msg, title, time, type)
end

RegisterNetEvent('Lux_Lib:Notify')
AddEventHandler('Lux_Lib:Notify', function(msg, title, time, type)
    QueueMessage(msg, title, time, type)
end)

function FormatText(text)
    if text then 
        return text:gsub('~[0-9a-zA-Z]+~', '')
    else
        return nil
    end
end

