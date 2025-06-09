-- Create the main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Add corner radius to the Frame
local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

-- Close button
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "✖" -- Close icon
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(150, 150, 150)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Title label
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Text = "APEX OT | Key System"
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

-- Instructions label
local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, 0, 0, 30)
Instructions.Position = UDim2.new(0, 0, 0.2, 0)
Instructions.Text = ""
Instructions.TextSize = 13
Instructions.TextColor3 = Color3.fromRGB(150, 150, 150)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

-- TextBox for key input
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = Frame

-- Add corner radius to the TextBox
local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 5)
TextBoxCorner.Parent = TextBox

-- Get Key button
local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.35, 0, 0.15, 0)
GetKey.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
GetKey.Text = "Get Key"
GetKey.TextSize = 18
GetKey.TextColor3 = Color3.fromRGB(150, 150, 150)
GetKey.Parent = Frame

-- Add corner radius to the Get Key button
local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 5)
GetKeyCorner.Parent = GetKey

-- Check Key button
local CheckKey = Instance.new("TextButton")
CheckKey.Size = UDim2.new(0.35, 0, 0.15, 0)
CheckKey.Position = UDim2.new(0.55, 0, 0.7, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CheckKey.Text = "Check Key"
CheckKey.TextSize = 18
CheckKey.TextColor3 = Color3.fromRGB(150, 150, 150)
CheckKey.Parent = Frame

-- Add corner radius to the Check Key button
local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 5)
CheckKeyCorner.Parent = CheckKey

-- Function to validate the key
local function validateKey(key)
    return key == "APEX-123" -- Replace this with your actual key
end

-- Get Key button functionality
GetKey.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/wDMPK3QAmY")
end)

-- Check Key button functionality
CheckKey.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text

    -- Check if the key is set in the global environment
    if getgenv().Key and getgenv().Key == enteredKey then
        TextBox.PlaceholderText = "Success Key!"
        TextBox.Text = ""
        wait(1)
        ScreenGui:Destroy()

        -- Load your main script here
        loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/APEX/refs/heads/main/apex.lua"))()
elseif validateKey(enteredKey) then
        TextBox.PlaceholderText = "Success Key!"
        TextBox.Text = ""
        wait(1)
        ScreenGui:Destroy()

        -- Load your main script here
        loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/APEX/refs/heads/main/apex.lua"))()
    else
        TextBox.PlaceholderText = "Wrong Key. Try again."
        TextBox.Text = ""
        wait(1)
        TextBox.PlaceholderText = "Enter Key..."
        TextBox.Text = ""
    end
end)
