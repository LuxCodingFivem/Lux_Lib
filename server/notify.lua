LUX.Notify = function(PlayerSource, msg, title, time, type)
    TriggerClientEvent('Lux_Lib:Notify', PlayerSource, msg, title, time, type)
end

LUX.PictureNotify = function(PlayerSource, title, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
    print(PlayerSource, title, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
    TriggerClientEvent('Lux_Lib:PictureNotify', PlayerSource, title, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
end