local newSoundId = "rbxassetid://1255040462" -- Replace this with the desired SoundId
local newPlaybackSpeed = 1 -- Replace this with the desired playback speed
local newVolume = 3 -- Replace this with the desired volume

local rs = game:GetService("ReplicatedStorage")
local soundObject = rs.Sounds.Guns.PlayerKill

if soundObject and soundObject:IsA("Sound") then
    soundObject.SoundId = newSoundId
    soundObject.PlaybackSpeed = newPlaybackSpeed
    soundObject.Volume = newVolume
    print("Sound properties have been updated:")
    print("SoundId:", soundObject.SoundId)
    print("PlaybackSpeed:", soundObject.PlaybackSpeed)
    print("Volume:", soundObject.Volume)
else
    print("Sound object not found or is not a valid Sound instance.")
end
local newSoundId = "rbxassetid://1255040462" -- Replace this with the desired SoundId
local newPlaybackSpeed = 1 -- Replace this with the desired playback speed
local newVolume = 3 -- Replace this with the desired volume

local rs = game:GetService("ReplicatedStorage")
local soundObject = rs.Sounds.Guns.PlayerHeadshot

if soundObject and soundObject:IsA("Sound") then
    soundObject.SoundId = newSoundId
    soundObject.PlaybackSpeed = newPlaybackSpeed
    soundObject.Volume = newVolume
    print("Sound properties have been updated:")
    print("SoundId:", soundObject.SoundId)
    print("PlaybackSpeed:", soundObject.PlaybackSpeed)
    print("Volume:", soundObject.Volume)
else
    print("Sound object not found or is not a valid Sound instance.")
end
local newSoundId = "rbxassetid://1255040462" -- Replace this with the desired SoundId
local newPlaybackSpeed = 1 -- Replace this with the desired playback speed
local newVolume = 3 -- Replace this with the desired volume

local rs = game:GetService("ReplicatedStorage")
local soundObject = rs.Sounds.Guns.PlayerBodyHit

if soundObject and soundObject:IsA("Sound") then
    soundObject.SoundId = newSoundId
    soundObject.PlaybackSpeed = newPlaybackSpeed
    soundObject.Volume = newVolume
    print("Sound properties have been updated:")
    print("SoundId:", soundObject.SoundId)
    print("PlaybackSpeed:", soundObject.PlaybackSpeed)
    print("Volume:", soundObject.Volume)
else
    print("Sound object not found or is not a valid Sound instance.")
end
