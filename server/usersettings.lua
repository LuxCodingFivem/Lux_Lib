if Config.AllowUserSettings then 
    RegisterCommand('SelectNotify', function(source, args)
        if args[1] ~= nil and Config.UserSelectableNotify[args[1]] then 
            MySQL.Async.fetchAll('SELECT * FROM lux_core_user_settings WHERE identifier = @identifier', {
                ['@identifier'] = LUX.GetIdentifier(source)
            }, function(result)
                if (#result > 0) then 
                    MySQL.Async.execute('UPDATE lux_core_user_settings SET notify = @notify WHERE identifier = @identifier', {
                        ['@notify'] = args[1],
                        ['@identifier'] = LUX.GetIdentifier(source)
                    })
                    TriggerClientEvent('Lux_Lib:SetUserSettings', source, args[1], 'notify')
                    LUX.Notify(source, string.format(Translation[Config.Locale]['successfuly_changed_notify']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'success')
                else
                    MySQL.Async.execute('INSERT INTO lux_core_user_settings (identifier, notify) VALUES (@identifier, @notify)', {
                        ['@notify'] = args[1],
                        ['@identifier'] = LUX.GetIdentifier(source)
                    })
                    TriggerClientEvent('Lux_Lib:SetUserSettings', source, args[1], 'notify')
                    LUX.Notify(source, string.format(Translation[Config.Locale]['successfuly_changed_notify']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'success')
                end
            end)
        else
            LUX.Notify(source, string.format(Translation[Config.Locale]['no_valid_notify']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'error')
        end
    end, false)
    
    RegisterCommand('SelectInput', function(source, args)
        if args[1] ~= nil and Config.UserSelectableInput[args[1]] then 
            MySQL.Async.fetchAll('SELECT * FROM lux_core_user_settings WHERE identifier = @identifier', {
                ['@identifier'] = LUX.GetIdentifier(source)
            }, function(result)
                if (#result > 0) then 
                    MySQL.Async.execute('UPDATE lux_core_user_settings SET input = @input WHERE identifier = @identifier', {
                        ['@input'] = args[1],
                        ['@identifier'] = LUX.GetIdentifier(source)
                    })
                    TriggerClientEvent('Lux_Lib:SetUserSettings', source, args[1], 'input')
                    LUX.Notify(source, string.format(Translation[Config.Locale]['successfuly_changed_input']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'success')
                else
                    MySQL.Async.execute('INSERT INTO lux_core_user_settings (identifier, input) VALUES (@identifier, @input)', {
                        ['@input'] = args[1],
                        ['@identifier'] = LUX.GetIdentifier(source)
                    })
                    TriggerClientEvent('Lux_Lib:SetUserSettings', source, args[1], 'input')
                    LUX.Notify(source, string.format(Translation[Config.Locale]['successfuly_changed_input']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'success')
                end
            end)
        else
            LUX.Notify(source, string.format(Translation[Config.Locale]['no_valid_input']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'error')
        end
    end, false)
    
    RegisterCommand('SelectProgressbar', function(source, args)
        if args[1] ~= nil and Config.UserSelectableProgressbar[args[1]] then 
            MySQL.Async.fetchAll('SELECT * FROM lux_core_user_settings WHERE identifier = @identifier', {
                ['@identifier'] = LUX.GetIdentifier(source)
            }, function(result)
                if (#result > 0) then 
                    MySQL.Async.execute('UPDATE lux_core_user_settings SET progressbar = @progressbar WHERE identifier = @identifier', {
                        ['@progressbar'] = args[1],
                        ['@identifier'] = LUX.GetIdentifier(source)
                    })
                    TriggerClientEvent('Lux_Lib:SetUserSettings', source, args[1])
                    LUX.Notify(source, string.format(Translation[Config.Locale]['successfuly_changed_progressbar']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'success')
                else
                    MySQL.Async.execute('INSERT INTO lux_core_user_settings (identifier, progressbar) VALUES (@identifier, @progressbar)', {
                        ['@progressbar'] = args[1],
                        ['@identifier'] = LUX.GetIdentifier(source)
                    })
                    TriggerClientEvent('Lux_Lib:SetUserSettings', source, args[1], 'progressbar')
                    LUX.Notify(source, string.format(Translation[Config.Locale]['successfuly_changed_progressbar']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'success')
                end
            end)
        else
            LUX.Notify(source, string.format(Translation[Config.Locale]['no_valid_progressbar']), string.format(Translation[Config.Locale]['user_setting']), 5000, 'error')
        end
    end, false)
end

LUX.RegisterServerCallback('Lux_Lib:GetUserSettings', function(source, cb)
    MySQL.Async.fetchAll('SELECT * FROM lux_core_user_settings WHERE identifier = @identifier', {
        ['@identifier'] = LUX.GetIdentifier(source)
    }, function(result)
        if (#result > 0) then 
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)
