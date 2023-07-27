local localPlayer = game.Players.LocalPlayer

local function applyHighlightToCharacter(player, character)
    -- Check if the player is the local player and return early if it is
    if player == localPlayer then
        return
    end

    local highlight = Instance.new("Highlight", character)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
    highlight.FillTransparency = 1
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        applyHighlightToCharacter(player, character)
    end)
    if player.Character then
        applyHighlightToCharacter(player, player.Character)
    end
end

-- Apply to existing players
for _, player in ipairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end

-- Apply to new players
game.Players.PlayerAdded:Connect(onPlayerAdded)
