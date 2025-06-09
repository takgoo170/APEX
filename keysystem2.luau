-- Script Hub Key System with Immediate Executor Key Bypass and Elegant UI Fallback
-- Applies Default design principles: whitespace, clean typography, minimal clutter

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local validKeys = {
    ["APEX-123"] = true,
    -- Add other valid keys here
}

-- Normalize key function: uppercase and trim spaces
local function normalizeKey(key)
    return (string.gsub(key or "", "%s+", "")):upper()
end

-- Main function to load your script hub features:
local function loadMainScript()
    -- Replace this with your actual main script loading
    print("Loading main script hub UI/features...")

    -- Example script load from your repo:
    loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/APEX/refs/heads/main/apex.lua"))()
end

-- Validate and unlock function
local function tryUnlock(key)
    local normalized = normalizeKey(key)
    if normalized == "" then
        return false, "No key entered."
    elseif validKeys[normalized] then
        return true, "Access granted. Loading..."
    else
        return false, "Invalid key, try again."
    end
end

-- Check for executor key (getgenv().Key)
local execKey = getgenv().Key and normalizeKey(getgenv().Key)

if execKey and validKeys[execKey] then
    -- Immediate bypass! No UI, load main script now
    loadMainScript()
    return
end

-- If no valid executor key, create UI to enter key:

-- Create ScreenGui & Frame
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 280)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- white background for clarity
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 48)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Enter Script Hub Key"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 36
Title.TextColor3 = Color3.fromRGB(17, 24, 39) -- dark text (#111827)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Frame

local Message = Instance.new("TextLabel")
Message.Size = UDim2.new(1, -20, 0, 24)
Message.Position = UDim2.new(0, 10, 0, 62)
Message.BackgroundTransparency = 1
Message.Text = ""
Message.Font = Enum.Font.Gotham
Message.TextSize = 18
Message.TextColor3 = Color3.fromRGB(107, 114, 128) -- neutral gray (#6b7280)
Message.TextXAlignment = Enum.TextXAlignment.Left
Message.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -40, 0, 48)
TextBox.Position = UDim2.new(0, 20, 0, 100)
TextBox.BackgroundColor3 = Color3.fromRGB(243, 244, 246) -- light gray (#f3f4f6)
TextBox.PlaceholderText = "Your Key"
TextBox.Text = ""
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 24
TextBox.TextColor3 = Color3.fromRGB(17, 24, 39)
TextBox.ClearTextOnFocus = false
local tbCorner = Instance.new("UICorner")
tbCorner.CornerRadius = UDim.new(0, 12)
tbCorner.Parent = TextBox
TextBox.Parent = Frame

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, -40, 0, 48)
Button.Position = UDim2.new(0, 20, 0, 160)
Button.BackgroundColor3 = Color3.fromRGB(17, 24, 39) -- black-ish (#111827)
Button.Text = "Unlock"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 24
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 12)
btnCorner.Parent = Button
Button.Parent = Frame

-- Helper to display message elegantly
local function updateMessage(text, isError)
    Message.Text = text
    if isError then
        Message.TextColor3 = Color3.fromRGB(220, 38, 38) -- red (#dc2626)
    else
        Message.TextColor3 = Color3.fromRGB(22, 163, 74) -- green (#16a34a)
    end
end

Button.MouseButton1Click:Connect(function()
    local inputKey = TextBox.Text
    local success, msg = tryUnlock(inputKey)
    updateMessage(msg, not success)
    if success then
        -- Disable inputs to prevent multiple tries
        Button.Active = false
        Button.AutoButtonColor = false
        Button.BackgroundColor3 = Color3.fromRGB(107, 114, 128) -- muted gray

        TextBox.FocusLost:Disconnect() -- optionally disconnect focus events

        -- Graceful delay then destroy UI and load main
        task.delay(1, function()
            ScreenGui:Destroy()
            loadMainScript()
        end)
    end
end)

-- Optional: also unlock on Enter key press inside textbox
TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        Button.MouseButton1Click:Fire()
    end
end)
