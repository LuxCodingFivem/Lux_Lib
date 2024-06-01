LUX = {}

exports('getLibObject', function()
	return LUX
end)

LUX.CheckResourceVersion = function(resource, minimumVersion)
	local currentVersion = GetResourceMetadata(resource, 'version', 0)
    currentVersion = currentVersion and currentVersion:match('%d+%.%d+%.%d+') or string.format(Translation[Config.Locale]['unknown'])

	if currentVersion ~= minimumVersion then
		local cv = { string.strsplit('.', currentVersion) }
		local mv = { string.strsplit('.', minimumVersion) }
		local msg = string.format(Translation[Config.Locale]['wrong_version'], GetInvokingResource(), resource, minimumVersion, resource, currentVersion)

		for i = 1, #cv do
            local current, minimum = tonumber(cv[i]), tonumber(mv[i])

            if current ~= minimum then
                if not current or current < minimum then
                    return print(msg)
                else break end
            end 
		end
	end

	return true
end