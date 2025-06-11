-- Script for DOORS (The Hotel)
-- Load UI Library
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reyn7525/GUI_LIB/refs/heads/main/ChibuHub"))()

-- Roblox Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

-- Local Player
local LocalPlayer = Players.LocalPlayer

-- Create GUI
local x2zu = UILibrary.Load("x2zu")

-- GUI Tabs
local InfoPage = x2zu.AddPage("Info")
local MiscPage = x2zu.AddPage("Misc")
local NotificationsPage = x2zu.AddPage("Notifications")
local VisualPage = x2zu.AddPage("Visual")
local ChamsPage = x2zu.AddPage("Chams")
local ESPPage = x2zu.AddPage("ESP")
local CharacterPage = x2zu.AddPage("Character")
local OtherPage = x2zu.AddPage("Other")

-- Info Tab
InfoPage.AddLabel("GUI was made by x2zu")
InfoPage.AddLabel("Library: x2zu")
InfoPage.AddLabel("Discord server: gg/FmMuvkaWvG")
InfoPage.AddButton("Copy Discord link", function()
    setclipboard("gg/FmMuvkaWvG")
end)
-- Misc Tab
MiscPage.AddSlider("Custom Delay Optimization", { Min = 1, Max = 200, Def = 50 }, function(value)
    -- Adjust performance delay (e.g., for interactions or updates)
    -- Implementation depends on game mechanics
end)

MiscPage.AddToggle("Instant Prompt", false, function(enabled)
    -- Instantly trigger proximity prompts
    for _, prompt in pairs(Workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") then
            prompt.HoldDuration = enabled and 0 or 0.5 -- Restore default if disabled
        end
    end
end)

MiscPage.AddToggle("No Seek Obstructions", false, function(enabled)
    -- Remove obstacles during Seek's chase
    for _, part in pairs(Workspace:GetDescendants()) do
        if part.Name == "ChandelierObstruction" or part.Name == "Seek_Arm" then
            part.CanCollide = not enabled
            part.Transparency = enabled and 1 or 0
        end
    end
end)

MiscPage.AddToggle("Anti Snare", false, function(enabled)
    -- Prevent snare traps
    for _, snare in pairs(Workspace:GetDescendants()) do
        if snare.Name == "Snare" then
            snare.CanCollide = not enabled
            snare.Transparency = enabled and 1 or 0
        end
    end
end)

MiscPage.AddToggle("Anti Hearing", false, function(enabled)
    -- Counter sound-based entities (e.g., Figure)
    -- Requires game-specific logic (e.g., mute player sounds)
end)

MiscPage.AddToggle("Anti Stunned", false, function(enabled)
    -- Prevent stun effects
    -- Requires game-specific logic (e.g., modify status effects)
end)

MiscPage.AddToggle("Anti Eyes", false, function(enabled)
    -- Avoid Eyes damage
    for _, eyes in pairs(Workspace:GetDescendants()) do
        if eyes.Name == "Eyes" then
            eyes.Transparency = enabled and 1 or 0
            -- Disable damage (requires game-specific logic)
        end
    end
end)

MiscPage.AddToggle("Anti Screech", false, function(enabled)
    -- Prevent Screech attacks
    for _, screech in pairs(Workspace:GetDescendants()) do
        if screech.Name == "Screech" then
            screech.Transparency = enabled and 1 or 0
            -- Disable attack (requires game-specific logic)
        end
    end
end)

-- Notifications Tab
NotificationsPage.AddToggle("Rush Spawn", false, function(enabled)
    -- Notify when Rush spawns
    if enabled then
        RunService.RenderStepped:Connect(function()
            for _, rush in pairs(Workspace:GetDescendants()) do
                if rush.Name == "RushMoving" then
                    StarterGui:SetCore("SendNotification", {
                        Title = "Rush Alert",
                        Text = "Rush has spawned!",
                        Duration = 5
                    })
                    break
                end
            end
        end)
    end
end)

NotificationsPage.AddToggle("Ambush Spawn", false, function(enabled)
    -- Notify when Ambush spawns
    if enabled then
        RunService.RenderStepped:Connect(function()
            for _, ambush in pairs(Workspace:GetDescendants()) do
                if ambush.Name == "AmbushMoving" then
                    StarterGui:SetCore("SendNotification", {
                        Title = "Ambush Alert",
                        Text = "Ambush has spawned!",
                        Duration = 5
                    })
                    break
                end
            end
        end)
    end
end)

NotificationsPage.AddToggle("Eyes Spawn", false, function(enabled)
    -- Notify when Eyes spawn
    if enabled then
        RunService.RenderStepped:Connect(function()
            for _, eyes in pairs(Workspace:GetDescendants()) do
                if eyes.Name == "Eyes" then
                    StarterGui:SetCore("SendNotification", {
                        Title = "Eyes Alert",
                        Text = "Eyes has spawned!",
                        Duration = 5
                    })
                    break
                end
            end
        end)
    end
end)

-- Visual Tab
VisualPage.AddToggle("Custom Fog", false, function(enabled)
    -- Modify fog settings
    Lighting.FogEnd = enabled and 50 or 1000
    Lighting.FogColor = enabled and Color3.fromRGB(100, 100, 100) or Color3.fromRGB(255, 255, 255)
end)

VisualPage.AddToggle("Player Light", false, function(enabled)
    -- Add light to player
    if enabled then
        local light = Instance.new("PointLight")
        light.Brightness = 1
        light.Range = 10
        light.Parent = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
    else
        if LocalPlayer.Character then
            for _, light in pairs(LocalPlayer.Character:GetDescendants()) do
                if light:IsA("PointLight") then
                    light:Destroy()
                end
            end
        end
    end
end)

VisualPage.AddColourPicker("Light Color", Color3.fromRGB(255, 255, 255), function(color)
    -- Change player light color
    if LocalPlayer.Character then
        for _, light in pairs(LocalPlayer.Character:GetDescendants()) do
            if light:IsA("PointLight") then
                light.Color = color
            end
        end
    end
end)

VisualPage.AddSlider("Light Brightness", { Min = 0, Max = 5, Def = 1 }, function(value)
    -- Adjust player light brightness
    if LocalPlayer.Character then
        for _, light in pairs(LocalPlayer.Character:GetDescendants()) do
            if light:IsA("PointLight") then
                light.Brightness = value
            end
        end
    end
end)

-- Chams Tab (Highlight entities/objects)
local function ApplyChams(target, enabled, color)
    if enabled then
        local highlight = Instance.new("Highlight")
        highlight.FillColor = color
        highlight.OutlineColor = color
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Parent = target
    else
        for _, highlight in pairs(target:GetDescendants()) do
            if highlight:IsA("Highlight") then
                highlight:Destroy()
            end
        end
    end
end

ChamsPage.AddToggle("Rush", false, function(enabled)
    for _, rush in pairs(Workspace:GetDescendants()) do
        if rush.Name == "RushMoving" then
            ApplyChams(rush, enabled, Color3.fromRGB(255, 0, 0))
        end
    end
end)

ChamsPage.AddToggle("Ambush", false, function(enabled)
    for _, ambush in pairs(Workspace:GetDescendants()) do
        if ambush.Name == "AmbushMoving" then
            ApplyChams(ambush, enabled, Color3.fromRGB(0, 255, 0))
        end
    end
end)

ChamsPage.AddToggle("Eyes", false, function(enabled)
    for _, eyes in pairs(Workspace:GetDescendants()) do
        if eyes.Name == "Eyes" then
            ApplyChams(eyes, enabled, Color3.fromRGB(0, 0, 255))
        end
    end
end)

ChamsPage.AddToggle("Figure", false, function(enabled)
    for _, figure in pairs(Workspace:GetDescendants()) do
        if figure.Name == "FigureRig" then
            ApplyChams(figure, enabled, Color3.fromRGB(255, 165, 0))
        end
    end
end)

ChamsPage.AddToggle("Seek", false, function(enabled)
    for _, seek in pairs(Workspace:GetDescendants()) do
        if seek.Name == "SeekMoving" then
            ApplyChams(seek, enabled, Color3.fromRGB(128, 0, 128))
        end
    end
end)

-- ESP Tab (Name/Distance labels)
local function ApplyESP(target, enabled, color)
    if enabled then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP"
        billboard.Size = UDim2.new(0, 100, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = target

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Text = target.Name
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3 = color
        nameLabel.TextScaled = true
        nameLabel.Parent = billboard

        local distanceLabel = Instance.new("TextLabel")
        distanceLabel.Text = "0 studs"
        distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
        distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
        distanceLabel.BackgroundTransparency = 1
        distanceLabel.TextColor3 = color
        distanceLabel.TextScaled = true
        distanceLabel.Parent = billboard

        RunService.RenderStepped:Connect(function()
            if LocalPlayer.Character and target:IsDescendantOf(Workspace) then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - target.Position).Magnitude
                distanceLabel.Text = math.floor(distance) .. " studs"
            end
        end)
    else
        for _, gui in pairs(target:GetDescendants()) do
            if gui:IsA("BillboardGui") and gui.Name == "ESP" then
                gui:Destroy()
            end
        end
    end
end

ESPPage.AddToggle("Rush", false, function(enabled)
    for _, rush in pairs(Workspace:GetDescendants()) do
        if rush.Name == "RushMoving" then
            ApplyESP(rush, enabled, Color3.fromRGB(255, 0, 0))
        end
    end
end)

ESPPage.AddToggle("Ambush", false, function(enabled)
    for _, ambush in pairs(Workspace:GetDescendants()) do
        if ambush.Name == "AmbushMoving" then
            ApplyESP(ambush, enabled, Color3.fromRGB(0, 255, 0))
        end
    end
end)

ESPPage.AddToggle("Eyes", false, function(enabled)
    for _, eyes in pairs(Workspace:GetDescendants()) do
        if eyes.Name == "Eyes" then
            ApplyESP(eyes, enabled, Color3.fromRGB(0, 0, 255))
        end
    end
end)

-- Character Tab
CharacterPage.AddToggle("Speed Bypass", false, function(enabled)
    -- Increase player speed (requires executor bypass)
    if LocalPlayer.Character then
        LocalPlayer.Character.Humanoid.WalkSpeed = enabled and 30 or 16
    end
end)

CharacterPage.AddToggle("Eternal Jump", false, function(enabled)
    -- Infinite jump
    UserInputService.JumpRequest:Connect(function()
        if enabled and LocalPlayer.Character then
            LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end)

-- Other Tab
OtherPage.AddButton("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

OtherPage.AddButton("CMD-X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
end)
