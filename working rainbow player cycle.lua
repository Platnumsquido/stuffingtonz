local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Function to change the color of a part
local function changeColor(part, color)
    if part:IsA("BasePart") then
        part.BrickColor = BrickColor.new(color)
    end
end

-- Function to change colors of the character
local function changeCharacterColors()
    local character = player.Character
    if character then
        local hue = 0 -- Initialize the hue value
        local parts = character:GetDescendants()
        while true do
            hue = (hue + 1) % 360 -- Increment hue value to create the cycle effect
            local rainbowColor = Color3.fromHSV(hue / 360, 1, 1)
            for _, part in ipairs(parts) do
                changeColor(part, rainbowColor)
            end
            RunService.RenderStepped:Wait() -- Wait for the next frame to update colors
        end
    end
end

-- Change the colors when the character is added (this will handle respawns)
player.CharacterAdded:Connect(changeCharacterColors)

-- Change the colors initially (when the script is first executed)
changeCharacterColors()
