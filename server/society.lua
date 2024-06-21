LUX.GetSocietyMoney = function(society)
    return Config.GetSocietyMoney(society)
end

LUX.RemoveSociety = function(society, amount)
    Config.RemoveSocietyMoney(society, amount)
end

LUX.AddSociety = function(society, amount)
    Config.AddSocietyMoney(society, amount)
end

