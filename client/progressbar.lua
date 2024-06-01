function StartProgressbar(time, text)
    SendNUIMessage({
        type = "Progressbar",
        status = true,
        time = time,
        text = text
    })
end

function StopProgressbar()
    SendNUIMessage({
        type = "Progressbar",
        status = false
    })
end

LUX.StartProgressbar = function(time, text)
    if Config.ProgressbarType == 'LUX' then 
        StartProgressbar(time, text)
    elseif Config.ProgressbarType == 'progressBars' then 
        exports['progressBars']:startUI(time, text)
    elseif Config.ProgressbarType == 'ESX' then 
        ESX = exports['es_extended']:getSharedObject()
        ESX.Progressbar(text, time,{})
    elseif Config.ProgressbarType == 'OX_Progressbar' then 
        lib.progressBar({
            duration = time,
            label = text,
        })
    elseif Config.ProgressbarType == 'OX_ProgressCircle' then 
        lib.progressCircle({
            duration = time,
            label = text,
        })
    elseif Config.ProgressbarType == 'NC' then 
        exports['nc-progressbar']:Progress({duration = time, label = text,})
    elseif Config.ProgressbarType == 'VS' then 
        exports['vsProgressBar']:vsSTART(text, time)
    elseif Config.ProgressbarType == 'MFP' then
        exports['mfp_progressbar']:startUI(time, text)
    end
end

LUX.StopProgressbar = function()
    if Config.ProgressbarType == 'LUX' then 
        StopProgressbar()
    elseif Config.ProgressbarType == 'OX_Progressbar' or Config.ProgressbarType == 'OX_ProgressCircle' then 
        lib.cancelProgress()
    elseif Config.ProgressbarType == 'VS' then 
        exports['vsProgressBar']:vsCANCEL()
    elseif Config.ProgressbarType == 'MFP' then
        exports['mfp_progressbar']:startUI(time, text, true)
    end
end