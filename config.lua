Config = {}

Config.Locale = 'de' -- Translation en, de you can add more

Config.InputType = 'LUX' -- LUX, Native or OX(for OX you have to make changes in the fxmanifest.lua)

Config.NotifyType = 'LUX' -- LUX, Native, Drillen, SY, okok, wasabi, mythic, QBCore, ESX and OX(for OX you have to make changes in the fxmanifest.lua)
Config.LuxNotifyTypes = { -- Lux Notify Types you can use all Free FontAwsom icons to make custom Notifys
    ['info'] = { -- type of the notification
        icon = 'fa-circle-info', -- font awsom icon
        gradient = {
            color1 = '#0b3c7b', -- gradient color 1(left)
            color2 = '#2e69bb', -- gradient color 2(right)
        }
    },
    ['success'] = { -- type of the notification
        icon = 'fa-circle-check', -- font awsom icon
        gradient = {
            color1 = '#0b7b12', -- gradient color 1(left)
            color2 = '#2ebb48', -- gradient color 2(right)
        },
    },
    ['warning'] = { -- type of the notification
        icon = 'fa-triangle-exclamation', -- font awsom icon
        gradient = {
            color1 = '#737b0b', -- gradient color 1(left)
            color2 = '#a1bb2e', -- gradient color 2(right)
        },
    },
    ['error'] = { -- type of the notification
        icon = 'fa-circle-exclamation', -- font awsom icon
        gradient = {
            color1 = '#7b0b0b', -- gradient color 1(left)
            color2 = '#bb2e2e', -- gradient color 2(right)
        },
    }
}

Config.ProgressbarType = 'LUX' -- LUX, progressBars, ESX, OX_Progressbar, OX_ProgressCircle, NC, VS and MFP

Config.AllowUserSettings = true -- Allows Users to change there Progressbar, Notify and Input !!! If you want to use this Option you have to inport the UserSettings SQL in your Database

Config.UserSelectableNotify = { -- set the Notifys to true if you want to allow players to select them
    ['LUX'] = true, 
    ['Native'] = true, 
    ['Drillen'] = true, 
    ['SY'] = false, 
    ['okok'] = false, 
    ['wasabi'] = false, 
    ['mythic'] = true, 
    ['QBCore'] = false, 
    ['ESX'] = true,
    ['OX'] = true, -- you have to make changes in the fxmanifest.lua for this option
}

Config.UserSelectableInput = { -- set the Inputs to true if you want to allow players to select them
    ['LUX'] = true,
    ['Native'] = true,
    ['OX'] = true, -- you have to make changes in the fxmanifest.lua for this option
}

Config.UserSelectableProgressbar = { -- set the Progressbars to true if you want to allow players to select them
    ['LUX'] = true, 
    ['progressBars'] = true, 
    ['ESX'] = true, 
    ['OX_Progressbar'] = true, -- you have to make changes in the fxmanifest.lua for this option
    ['OX_ProgressCircle'] = true, -- you have to make changes in the fxmanifest.lua for this option
    ['NC'] = false,
    ['VS'] = false,
    ['MFP'] = false,
}


-- Framework Spesific if you use ESX you dont have to make changes in this section

Config.PlayerLoadedEventName = 'esx:playerLoaded' -- the event that gets triggert after a player ist loaded on the Server (Only Needed if you use AllowUserSettings)

Config.GetIdentifierEvent = function(source) -- Place the Event from your Framework to get the Player Identifier
    ESX = exports['es_extended']:getSharedObject()
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getIdentifier()
end

Config.GetAccountMoneyEvent = function(source, account) -- Place the Event from your Framework to get the Player Account Money
    ESX = exports['es_extended']:getSharedObject()
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getAccount(account).money
end


-- Translation

Translation = {
    ['de'] = {
        ['unknown'] = 'Unbekannt',
        ['server_callback_does_not_existes'] = 'Der Server Callback mit der requestId: %s der von %s aufgerufen wurde existiert nicht.',
        ['client_callback_does_not_existes'] = 'Der Client Callback mit der requestId: %s der von %s aufgerufen wurde existiert nicht.',
        ['wrong_version'] = '~r~Um %s nutzen zu können brauchst du mindestens %s v%s die aktutelle version von %s auf deinem server ist v%s',
        ['no_valid_notify'] = '~r~Du musst eine valide Notify auswählen',
        ['no_valid_input'] = '~r~Du musst ein valides Input auswählen',
        ['no_valid_progressbar'] = '~r~Du musst eine valide Progressbar auswählen',
        ['user_setting'] = 'Benutzer Einstellungen',
        ['successfuly_changed_notify'] = '~g~Du hast dein Notify erfolgreich geändert',
        ['successfuly_changed_input'] = '~g~Du hast dein Input erfolgreich geändert',
        ['successfuly_changed_progressbar'] = '~g~Du hast deine Progressbar erfolgreich geändert',
    },
    ['en'] = {
        ['unknown'] = 'Unknown',
        ['server_callback_does_not_existes'] = 'Server Callback with requestId: %s Called by: %s does not exist.',
        ['client_callback_does_not_existes'] = 'Client Callback with requestId: %s Called by: %s does not exist.',
        ['wrong_version'] = '~r~To use %s you need at least %s v%s the current version of %s on your server is v%s',
        ['no_valid_notify'] = '~r~You need to select a valid Notify',
        ['no_valid_input'] = '~r~You need to select a valid Input',
        ['no_valid_progressbar'] = '~r~You need to select a valid Progressbar',
        ['user_setting'] = 'User Settings',
        ['successfuly_changed_notify'] = '~g~Du hast dein Notify erfolgreich geändert',
        ['successfuly_changed_input'] = '~g~Du hast dein Input erfolgreich geändert',
        ['successfuly_changed_progressbar'] = '~g~Du hast deine Progressbar erfolgreich geändert',
    },
}