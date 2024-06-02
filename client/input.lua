local display = false
local msg = nil
local canceled = false

function input(bool, type, text, placeholder)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = 'Input',
        input_type = type,
        status = bool,
        text = text,
        placeholder = placeholder,
        lang = Config.Locale
    })
end

RegisterNUICallback('input_send', function(data)
	msg = data.input
    input(false)
end)

RegisterNUICallback('input_exit', function(data)
    canceled = true
    input(false)
end)

LUX.Input = function(type, text, placeholder)
    if Config.InputType == 'LUX' then
        input(true, type, text, placeholder)

        while msg == nil and not canceled do
		    Wait(1)
        end

        if not canceled then
            newmsg = msg
            msg = nil 
            return newmsg
        else
            canceled = false
            return nil
        end
    elseif Config.InputType == 'Native' then 
        AddTextEntry(text, text)
        DisplayOnscreenKeyboard(1, text, '', '', '', '', '', 32)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local displayResult = GetOnscreenKeyboardResult()
            return displayResult
        end
    elseif Config.InputType == 'OX' then
        local input = lib.inputDialog(text, {
            { type = type, label = '', placeholder = placeholder },
        })

        return input[1]
    end
end
