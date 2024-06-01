local RequestId = 0
local serverRequests = {}

local clientCallbacks = {}

LUX.TriggerServerCallback = function(eventName, callback, ...)
    serverRequests[RequestId] = callback
  
    TriggerServerEvent('Lux_Lib:triggerServerCallback', eventName, RequestId, GetInvokingResource() or string.format(Translation[Config.Locale]['unknown']), ...)

    RequestId = RequestId + 1
end

RegisterNetEvent('Lux_Lib:serverCallback', function(requestId, invoker, ...)
    if not serverRequests[requestId] then
        return print(string.format(Translation[Config.Locale]['server_callback_does_not_existes'], requestId, invoker))
    end

    serverRequests[requestId](...)
    serverRequests[requestId] = nil
end)

LUX.RegisterClientCallback = function(eventName, callback)
    clientCallbacks[eventName] = callback
end
  
RegisterNetEvent('Lux_Lib:triggerClientCallback', function(eventName, requestId, invoker, ...)
    if not clientCallbacks[eventName] then
        return print(string.format(Translation[Config.Locale]['client_callback_does_not_existes'], requestId, invoker))
    end
  
    clientCallbacks[eventName](function(...)
        TriggerServerEvent('Lux_Lib:clientCallback', requestId, invoker, ...)
    end, ...)
end)