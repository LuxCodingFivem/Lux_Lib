local serverCallbacks = {}
local RequestId = 0

local clientRequests = {}

LUX.RegisterServerCallback = function(eventName, callback)
    serverCallbacks[eventName] = callback
end

RegisterNetEvent('Lux_Lib:triggerServerCallback', function(eventName, requestId, invoker, ...)
    if not serverCallbacks[eventName] then
        return print(string.format(Translation[Config.Locale]['server_callback_does_not_existes'], requestId, invoker))
    end

    local source = source

    serverCallbacks[eventName](source, function(...)
        TriggerClientEvent('Lux_Lib:serverCallback', source, requestId, invoker, ...)
    end, ...)
end)

LUX.TriggerClientCallback = function(player, eventName, callback, ...)
    clientRequests[RequestId] = callback
  
    TriggerClientEvent('Lux_Lib:triggerClientCallback', player, eventName, RequestId, GetInvokingResource() or string.format(Translation[Config.Locale]['unknown']), ...)
  
    RequestId = RequestId + 1
end
  
RegisterNetEvent('Lux_Lib:clientCallback', function(requestId, invoker, ...)
    if not clientRequests[requestId] then
        return print(string.format(Translation[Config.Locale]['client_callback_does_not_existes'], requestId, invoker))
    end
  
    clientRequests[requestId](...)
    clientRequests[requestId] = nil
end)