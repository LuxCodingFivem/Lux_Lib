LUX.Infobar = function(msg)
    if Config.InfobarType == 'Native' then 
        CurrentActionMsg  = msg
        SetTextComponentFormat('STRING')
        AddTextComponentString(CurrentActionMsg)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    end
end