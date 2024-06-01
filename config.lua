Config = {}

Config.Locale = 'de' -- Translation en, de you can add more

-- Here you change the Default Input

-- you can Use Following Inputs
-- LUX (Intigrated)
-- Native (Intigrated)
-- OX https://github.com/overextended/ox_lib
-- if you want to use OX Inputs you have to edit the fxmanifest.lua
Config.InputType = 'LUX'

-- Here you change the Default Notification

-- you can use following Notifications:
-- LUX (Intigrated)
-- Native(Intigrated)
-- Drillen https://github.com/dillen1/dillen_notifications
-- SY https://github.com/SYNO-SY/SY_Notify
-- okok https://okok.tebex.io/package/4724993
-- wasabi https://store.wasabiscripts.com/package/6215100
-- mythic https://github.com/JayMontana36/mythic_notify
-- QBCore https://github.com/qbcore-framework
-- ESX https://github.com/esx-framework
-- RTX https://rtx.tebex.io/package/5402098
-- OX https://github.com/overextended/ox_lib
-- if you want to use OX Notify you have to edit the fxmanifest.lua
Config.NotifyType = 'LUX'

-- here you can add more Notifcation Types for LUX Notify
Config.LuxNotifyTypes = {
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

-- Here you change the Default Progressbar
-- LUX (Intigrated)
-- progressBars https://github.com/EthanPeacock/progressBars
-- ESX https://github.com/esx-framework
-- NC https://github.com/NaorNC/nc-progressbar
-- VS https://vibescripts.tebex.io/category/2132061
-- MFP https://mfp.tebex.io/package/5888163
-- OX_Progressbar https://github.com/overextended/ox_lib
-- OX_ProgressCircle https://github.com/overextended/ox_lib
-- if you want to use OX Progressbars you have to edit the fxmanifest.lua
Config.ProgressbarType = 'LUX'

-- User Settings

Config.AllowUserSettings = true -- Allows Users to change there Progressbar, Notify and Input !!! If you want to use this Option you have to inport the UserSettings SQL in your Database

-- Only neded if you set Config.AllowUserSettings to true
-- here you can setup all Notifcations the user can Select 
Config.UserSelectableNotify = {
    ['LUX'] = true, 
    ['Native'] = true, 
    ['Drillen'] = true, 
    ['SY'] = false, 
    ['okok'] = false, 
    ['wasabi'] = false, 
    ['mythic'] = true, 
    ['QBCore'] = false, 
    ['ESX'] = true,
    ['RTX'] = false,
    -- if you want to use the OX Notify you have to make Changes in fxmanifest.lua
    ['OX'] = true, 
}

-- Only neded if you set Config.AllowUserSettings to true
-- here you can setup all Inputs the user can Select 
Config.UserSelectableInput = {
    ['LUX'] = true,
    ['Native'] = true,
    -- if you want to use the OX Notify you have to make Changes in fxmanifest.lua
    ['OX'] = true,
}

-- Only neded if you set Config.AllowUserSettings to true
-- here you can setup all Progressbars the user can Select 
Config.UserSelectableProgressbar = {
    ['LUX'] = true, 
    ['progressBars'] = true, 
    ['ESX'] = true, 
    ['NC'] = false,
    ['VS'] = false,
    ['MFP'] = false,
    -- if you want to use the OX Notify you have to make Changes in fxmanifest.lua
    ['OX_Progressbar'] = true,
    ['OX_ProgressCircle'] = true,
}


-- Framework Specific if you use ESX if you use esx you don't have to make any changes in this section

-- the event that gets triggert after a player ist loaded on the Server 
-- (Only Needed if you use AllowUserSettings)
Config.PlayerLoadedEventName = 'esx:playerLoaded'

-- Place here the Event from your Framework to get the Player Identifier
Config.GetIdentifierEvent = function(source) 
    ESX = exports['es_extended']:getSharedObject()
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer.getIdentifier()
end

-- Place here the Event from your Framework to get the Player Account Money
Config.GetAccountMoneyEvent = function(source, account)
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