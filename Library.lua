--// VENTO UI LIBRARY
--// Inspired by WindUI / Linoria
--// Author: You 😎

local VentoUI = {}
VentoUI.__index = VentoUI

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Utils
local function Create(class, props)
    local obj = Instance.new(class)
    for i, v in pairs(props or {}) do
        obj[i] = v
    end
    return obj
end
