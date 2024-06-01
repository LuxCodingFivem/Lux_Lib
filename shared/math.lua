LUX.Math = {}

LUX.Math.Round = function(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end

LUX.Math.Trim = function(sting)
    return (string.gsub(sting, "^%s*(.-)%s*$", "%1"))
end

LUX.Math.GroupDigits = function(number)
    local number = tostring(number)
    local formattedNumber = ""
    local count = 0

    for i = string.len(number) , 1, -1 do
        formattedNumber = string.sub(number, i, i) .. formattedNumber
        count = count + 1

        if count == 3 and i > 1 then
            formattedNumber = "." .. formattedNumber
            count = 0
        end
    end

    return formattedNumber
end
