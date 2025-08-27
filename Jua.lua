-- Script para teletransportarse a la base y robar Brainrots en Steal a Brainrot

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- FunciÃ³n para encontrar la base del jugador
local function findBasePosition(player)
    -- Ajusta esta funciÃ³n para que encuentre la posiciÃ³n exacta de la base del jugador
    -- Esto puede variar dependiendo de cÃ³mo estÃ© configurado el juego
    -- Por ejemplo, podrÃ­as buscar un objeto especÃ­fico en la base del jugador
    local basePart = player.Character:FindFirstChild("BasePart") -- Ajusta el nombre del objeto segÃºn sea necesario
    if basePart then
        return basePart.Position
    end
    return nil
end

-- FunciÃ³n para teletransportarse a la base del jugador
local function teleportToBase(player)
    local basePosition = findBasePosition(player)
    if basePosition then
        character:SetPrimaryPartCFrame(CFrame.new(basePosition))
    end
end

-- FunciÃ³n para robar Brainrots instantÃ¡neamente
local function instantSteal(player)
    -- Ajusta esta funciÃ³n para que robe los Brainrots del jugador
    -- Esto puede variar dependiendo de cÃ³mo estÃ© configurado el juego
    -- Por ejemplo, podrÃ­as buscar un objeto especÃ­fico que represente los Brainrots y eliminarlo
    local brainrotPart = player.Character:FindFirstChild("BrainrotPart") -- Ajusta el nombre del objeto segÃºn sea necesario
    if brainrotPart then
        brainrotPart:Destroy()
    end
end

-- FunciÃ³n principal para teletransportarse y robar
local function main()
    while true do
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                teleportToBase(player)
                instantSteal(player)
                wait(1) -- Espera 1 segundo antes de intentar con el siguiente jugador
            end
        end
        wait(5) -- Espera 5 segundos antes de volver a verificar
    end
end

-- Ejecutar la funciÃ³n principal
main()
