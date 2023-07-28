local player = game.Players.LocalPlayer

-- Function to change the material of a part
local function changeMaterial(part, material)
    if part:IsA("BasePart") then
        part.Material = material
    end
end

-- Function to change materials of the character
local function changeCharacterMaterials()
    local character = player.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            changeMaterial(part, Enum.Material.ForceField) -- Change to your desired material
        end
    end
end

-- Change the materials when the character is added (this will handle respawns)
player.CharacterAdded:Connect(changeCharacterMaterials)

-- Change the materials initially (when the script is first executed)
changeCharacterMaterials()
