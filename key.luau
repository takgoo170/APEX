-- Roblox Key System GUI for Exploit/Script
-- Shows a GUI with Get Key and Check Key buttons
-- Get Key copies Discord invite link
-- Check Key prompts for key input and validates it
-- If valid, runs main script

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Key system definition
local KeySystem = {}

local EXPIRATION_TIME = 24 * 60 * 60 -- 24 hours in seconds

local validKeys = {
    -- Example keys
    ["TEMPKEY1"] = { issued = os.time(), neverExpire = false },
    ["TEMPKEY2"] = { issued = os.time() - 3600, neverExpire = false },
    ["APEX-TEST"] = { issued = os.time(), neverExpire = true },
}

function KeySystem.isKeyValid(key)
    local keyData = validKeys[key]
    if not keyData then
        return false, "Invalid key."
    end
    if keyData.neverExpire then
        return true, "Key is valid and never expires."
    end
    local currentTime = os.time()
    if (currentTime - keyData.issued) <= EXPIRATION_TIME then
        return true, "Key is valid and not expired."
    else
        return false, "Key has expired."
    end
end

-- Helper function to create UI elements
local function create(className, properties)
    local obj = Instance.new(className)
    for prop, val in pairs(properties) do
        obj[prop] = val
    end
    return obj
end

-- Create main ScreenGui
local screenGui = create("ScreenGui", {
    Name = "KeySystemGUI",
    ResetOnSpawn = false,
    Parent = playerGui
})

-- Main frame
local frame = create("Frame", {
    Parent = screenGui,
    Size = UDim2.new(0, 400, 0, 300),
    Position = UDim2.new(0.5, -200, 0.5, -150),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    BorderSizePixel = 0,
    ClipsDescendants = true,
})
-- Rounded corners
local uicorner = create("UICorner", {Parent = frame, CornerRadius = UDim.new(0, 16)})

-- Title
local title = create("TextLabel", {
    Parent = frame,
    Text = "APEX OT | KEY SYSTEM",
    Font = Enum.Font.GothamBold,
    TextSize = 24,
    TextColor3 = Color3.fromRGB(220, 220, 220),
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 50),
    Position = UDim2.new(0, 0, 0, 0),
    TextScaled = false,
    TextWrapped = false,
})

-- Message label for feedback
local messageLabel = create("TextLabel", {
    Parent = frame,
    Text = "",
    Font = Enum.Font.Gotham,
    TextSize = 16,
    TextColor3 = Color3.fromRGB(200, 50, 50),
    BackgroundTransparency = 1,
    Size = UDim2.new(1, -32, 0, 50),
    Position = UDim2.new(0, 16, 1, -100),
    TextWrapped = true,
    TextXAlignment = Enum.TextXAlignment.Center,
})

-- Get Key Button
local getKeyBtn = create("TextButton", {
    Parent = frame,
    Text = "Get Key",
    Font = Enum.Font.GothamBold,
    TextSize = 20,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundColor3 = Color3.fromRGB(45, 135, 230),
    Size = UDim2.new(0.4, 0, 0, 50),
    Position = UDim2.new(0.05, 0, 0.7, 0),
    AutoButtonColor = true,
    ClipsDescendants = true,
})
create("UICorner", {Parent = getKeyBtn, CornerRadius = UDim.new(0, 12)})

-- Check Key Button
local checkKeyBtn = create("TextButton", {
    Parent = frame,
    Text = "Check Key",
    Font = Enum.Font.GothamBold,
    TextSize = 20,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundColor3 = Color3.fromRGB(40, 160, 90),
    Size = UDim2.new(0.4, 0, 0, 50),
    Position = UDim2.new(0.55, 0, 0.7, 0),
    AutoButtonColor = true,
    ClipsDescendants = true,
})
create("UICorner", {Parent = checkKeyBtn, CornerRadius = UDim.new(0, 12)})

-- Key Entry UI (initially hidden)
local keyEntryFrame = create("Frame", {
    Parent = frame,
    Size = UDim2.new(1, -32, 0, 80),
    Position = UDim2.new(0, 16, 0.45, 0),
    BackgroundColor3 = Color3.fromRGB(40, 40, 40),
    Visible = false,
})
create("UICorner", {Parent = keyEntryFrame, CornerRadius = UDim.new(0, 12)})

local keyTextBox = create("TextBox", {
    Parent = keyEntryFrame,
    PlaceholderText = "Enter your key here",
    Font = Enum.Font.Gotham,
    TextSize = 18,
    TextColor3 = Color3.fromRGB(220, 220, 220),
    BackgroundColor3 = Color3.fromRGB(30, 30, 30),
    Size = UDim2.new(0.7, 0, 0.7, 0),
    Position = UDim2.new(0.05, 0, 0.15, 0),
    ClearTextOnFocus = false,
    TextWrapped = false,
    MultiLine = false,
    AutoLocalize = false,
    TextXAlignment = Enum.TextXAlignment.Left,
})
create("UICorner", {Parent = keyTextBox, CornerRadius = UDim.new(0, 8)})

local submitKeyBtn = create("TextButton", {
    Parent = keyEntryFrame,
    Text = "Submit",
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundColor3 = Color3.fromRGB(45, 135, 230),
    Size = UDim2.new(0.2, 0, 0.7, 0),
    Position = UDim2.new(0.8, 0, 0.15, 0),
    AutoButtonColor = true,
})
create("UICorner", {Parent = submitKeyBtn, CornerRadius = UDim.new(0, 8)})

-- Copy Discord link to clipboard function
local function copyDiscordLink()
    local discordLink = "https://discord.gg/examplekey"
    -- Use setclipboard if available
    local success, err = pcall(function()
        setclipboard(discordLink)
    end)
    if success then
        messageLabel.TextColor3 = Color3.fromRGB(100, 230, 100)
        messageLabel.Text = "Discord link copied to clipboard! Join to get your key."
    else
        messageLabel.TextColor3 = Color3.fromRGB(230, 100, 100)
        messageLabel.Text = "Failed to copy to clipboard. Please copy manually: "..discordLink
    end
end

-- On Get Key clicked
getKeyBtn.MouseButton1Click:Connect(function()
    copyDiscordLink()
end)

-- On Check Key clicked: show key entry, hide buttons
checkKeyBtn.MouseButton1Click:Connect(function()
    messageLabel.Text = ""
    keyEntryFrame.Visible = true
    getKeyBtn.Visible = false
    checkKeyBtn.Visible = false
    keyTextBox.Text = ""
    keyTextBox:CaptureFocus()
end)

local function runMainScript()
    -- Hide GUI before running main script
    screenGui.Enabled = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/APEX/refs/heads/main/apex.lua"))() -- Main script code goes here
    -- For demonstration, just print
    print("[KeySystem] Key validated. Running main script...")
    -- You can replace this with actual exploit code or script
    -- Example: loadstring or other logic
    -- For now just a popup notification
    StarterGui:SetCore("SendNotification", {
        Title = "Success";
        Text = "Key validated! Script executing....";
        Duration = 5;
    })
end

submitKeyBtn.MouseButton1Click:Connect(function()
    local userKey = keyTextBox.Text:upper():gsub("%s","")
    local valid, msg = KeySystem.isKeyValid(userKey)
    if valid then
        messageLabel.TextColor3 = Color3.fromRGB(100, 230, 100)
        messageLabel.Text = "Key is valid! Launching script..."
        wait(1)
        runMainScript()
    else
        messageLabel.TextColor3 = Color3.fromRGB(230, 100, 100)
        messageLabel.Text = msg
    end
end)

-- Optional: Allow pressing Enter to submit key in textbox
keyTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        submitKeyBtn:CaptureFocus()
        submitKeyBtn.MouseButton1Click:Wait()
    end
end)

-- Center GUI on screen & make it responsive
screenGui.DisplayOrder = 1000
screenGui.ResetOnSpawn = false

return KeySystem
