LUX.Raycast = {}

LUX.Raycast.CoordsPlayerIsLookingAt = function()
    local playerPed = PlayerPedId() -- Get the player's PED
    local cameraCoord = GetGameplayCamCoord() -- Get camera coordinates
    local cameraRot = GetGameplayCamRot(2) -- Get camera rotation
    local direction = LUX.Raycast.RotationToDirection(cameraRot) -- Convert rotation to direction vector

    local distance = 1000.0 -- Maximum distance of the raycast
    local destination = {
        x = cameraCoord.x + direction.x * distance,
        y = cameraCoord.y + direction.y * distance,
        z = cameraCoord.z + direction.z * distance
    }

    local rayHandle = StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, 511, playerPed, 0)
    local _, hit, hitCoord, _, _ = GetShapeTestResult(rayHandle)

    if hit == 1 then
        return hitCoord
    else
        return nil -- No hit detected
    end
end

LUX.Raycast.RotationToDirection = function(rotation)
    local adjustedRotation = {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }

    local direction = {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        z = math.sin(adjustedRotation.x)
    }
    return direction
end