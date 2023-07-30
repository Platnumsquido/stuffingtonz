local localLifetime = 5 -- seconds
local material = Enum.Material.Neon
local thickness = 0.1
local color = Color3.fromRGB(0, 120, 255)

local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService").RenderStepped

function createBeam(p1, p2)
	local beam = Instance.new("Part", workspace)
	beam.Anchored = true
	beam.CanCollide = false
	beam.Material = material
	beam.Color = color
	beam.Size = Vector3.new(thickness, thickness, (p1 - p2).magnitude)
	beam.CFrame = CFrame.new(p1, p2) * CFrame.new(0, 0, -beam.Size.Z / 2)
	return beam
end

local isCreatingBeam = false

game:GetService("UserInputService").InputBegan:Connect(function(input, isProcessed)
	-- Check if the input is a left-click and not already being processed by other UI elements.
	if input.UserInputType == Enum.UserInputType.MouseButton1 and not isProcessed then
		isCreatingBeam = true
		while isCreatingBeam do
			local target = lp:GetMouse().Target
			if target then
				-- Create a beam between the player's head and the target position.
				local beam = createBeam(lp.Character.Head.Position, target.Position)
				-- Destroy the beam after the specified lifetime.
				spawn(function()
					for i = 1, 60 * localLifetime do
						rs:Wait()
						if beam and beam.Parent then
							beam.Transparency = i / (60 * localLifetime)
						else
							break
						end
					end
					if beam and beam.Parent then
						beam:Destroy()
					end
				end)
			end
			wait(0.1) -- Wait for 0.2 seconds before creating the next beam
		end
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input, isProcessed)
	-- Check if the left-click has ended.
	if input.UserInputType == Enum.UserInputType.MouseButton1 and not isProcessed then
		isCreatingBeam = false
	end
end)
