LUX.GetIdentifier = function(source)
    return Config.GetIdentifierEvent(source)
end

LUX.GetAccountMoney = function(source, account)
    return Config.GetAccountMoneyEvent(source, account)
end

LUX.RemoveAccountMoney = function(source, account, count)
    Config.RemoveAccountMoneyEvent(source, account, count)
end

LUX.AddAccountMoney = function(source, account, count)
    Config.AddAccountMoneyEvent(source, account, count)
end

LUX.GetJob = function(source)
    return Config.GetJobEvent(source)
end

LUX.AddItem = function(source, item, count)
    return Config.AddItemEvent(source, item, count)
end

LUX.RemoveItem = function(source, item, count)
    return Config.RemoveItemEvent(source, item, count)
end

LUX.GetItem = function(source, item)
    return Config.GetItemEvent(source, item)
end

LUX.GetGroup = function(source)
    return Config.GetGroupEvent(source)
end

LUX.GetName = function(source)
    return Config.GetnameEvent(source)
end