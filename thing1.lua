getgenv().SilentAim = State
local Ignore = {}
local function ClosestPlayerToCurser()
    local Closest = nil
    local MaxDistance = math.huge
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and
                v.Character.Head.PlayerInfo.Screen.HealthContainer.HealthBar.HealthProgressFrame.Size.X.Scale ~= 0 and FreeForAll(v)
         then
            local AimPoint, Part =
                game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(v.Character.Head.Position)
            if Part then
                local Ignore = {game.Players.LocalPlayer.Character}
                local RayCastPoints = {v.Character.Head.Position}
                local Point = game:GetService("Workspace").CurrentCamera:GetPartsObscuringTarget(RayCastPoints, Ignore)
                local Hitting = false
                for i, x in pairs(Point) do
                    if not x:IsDescendantOf(v.Character) then
                        Hitting = true
                    end
                end
                if Hitting == false then
                    local M =
                        (Vector2.new(AimPoint.X, AimPoint.Y) -
                        Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y)).magnitude
                    if M < MaxDistance then
                        MaxDistance = M
                        Closest = v
                    end
                end
            end
        end
    end
    return Closest
end

local OldIndex = Utils.GetMouseHit
Utils.GetMouseHit = function(...)
    local ClosestPlayerToCurser = ClosestPlayerToCurser()
    wait()
    if ClosestPlayerToCurser and ClosestPlayerToCurser.Character and getgenv().SilentAim then
        if ClosestPlayerToCurser.Character:FindFirstChild("Head") then
            return ClosestPlayerToCurser.Character.Head.Position
        end
    end

    return OldIndex(...)
end
end)
