local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
 
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer
local BananaMain = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local cornerMainFrame = Instance.new("UICorner")
local titleFrame = Instance.new("Frame")
local titleText = Instance.new("TextLabel")
local lineFrame = Instance.new("Frame")
local gradientLineFrame = Instance.new("UIGradient")
local keyFrame = Instance.new("Frame")
local keyBox = Instance.new("TextBox")
local actionFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local checkKeyFrame = Instance.new("Frame")
local cornerCheckKey = Instance.new("UICorner")
local buttonCheckKey = Instance.new("TextButton")
local getKeyFrame = Instance.new("Frame")
local cornerGetKey = Instance.new("UICorner")
local buttonGetKey = Instance.new("TextButton")
local strokeKeyFrame = Instance.new('UIStroke', keyFrame)
local strokeGetKey = Instance.new('UIStroke', getKeyFrame)


BananaMain.Name = "[Banana] Main"
BananaMain.Parent = game:GetService('CoreGui')

mainFrame.Name = "mainFrame"
mainFrame.Parent = BananaMain
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0, 350, 0, 120)

cornerMainFrame.CornerRadius = UDim.new(0, 4)
cornerMainFrame.Name = "cornerMainFrame"
cornerMainFrame.Parent = mainFrame

titleFrame.Name = "titleFrame"
titleFrame.Parent = mainFrame
titleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleFrame.BackgroundTransparency = 1.000
titleFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
titleFrame.Size = UDim2.new(1, 0, 0, 27)

titleText.Name = "titleText"
titleText.Parent = titleFrame
titleText.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
titleText.BackgroundTransparency = 1.000
titleText.Position = UDim2.new(0, 5, 0, 0)
titleText.Size = UDim2.new(0, 0, 0, 25)
titleText.Font = Enum.Font.GothamBold
titleText.Text = "APEX OT | KEY SYSTEM                "
titleText.TextColor3 = Color3.fromRGB(255, 0, 255)
titleText.TextSize = 14.000
titleText.TextXAlignment = Enum.TextXAlignment.Left

lineFrame.Name = "lineFrame"
lineFrame.Parent = titleFrame
lineFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
lineFrame.BorderSizePixel = 0
lineFrame.Position = UDim2.new(0, 5, 0, 25)
lineFrame.Size = UDim2.new(0, 184, 0, 2)

gradientLineFrame.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.44), NumberSequenceKeypoint.new(0.90, 0.70), NumberSequenceKeypoint.new(1.00, 1.00)}
gradientLineFrame.Name = "gradientLineFrame"
gradientLineFrame.Parent = lineFrame

keyFrame.Name = "keyFrame"
keyFrame.Parent = mainFrame
keyFrame.Active = true
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyFrame.BorderSizePixel = 0
keyFrame.ClipsDescendants = true
keyFrame.Position = UDim2.new(0.5, 0, 0.5, -5)
keyFrame.Selectable = true
keyFrame.Size = UDim2.new(1, -20, 0, 25)

strokeKeyFrame.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
strokeKeyFrame.Color = Color3.fromRGB(255,0,255)
strokeKeyFrame.LineJoinMode = Enum.LineJoinMode.Round
strokeKeyFrame.Thickness = 2

keyBox.Name = "keyBox"
keyBox.Parent = keyFrame
keyBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundTransparency = 1.000
keyBox.ClipsDescendants = true
keyBox.Position = UDim2.new(0, 5, 0, 0)
keyBox.Size = UDim2.new(1, -10, 1, 0)
keyBox.ClearTextOnFocus = false
keyBox.Font = Enum.Font.GothamBold
keyBox.PlaceholderText = "Key Here"
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 14.000
keyBox.TextXAlignment = Enum.TextXAlignment.Left

actionFrame.Name = "actionFrame"
actionFrame.Parent = mainFrame
actionFrame.AnchorPoint = Vector2.new(0.5, 1)
actionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
actionFrame.BackgroundTransparency = 1.000
actionFrame.Position = UDim2.new(0.5, 0, 1, -10)
actionFrame.Size = UDim2.new(1, -10, 0, 25)

UIListLayout.Parent = actionFrame
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 30)

checkKeyFrame.Name = "checkKeyFrame"
checkKeyFrame.Parent = actionFrame
checkKeyFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
checkKeyFrame.Size = UDim2.new(0, 150, 0, 25)

cornerCheckKey.CornerRadius = UDim.new(0, 4)
cornerCheckKey.Name = "cornerCheckKey"
cornerCheckKey.Parent = checkKeyFrame

buttonCheckKey.Name = "buttonCheckKey"
buttonCheckKey.Parent = checkKeyFrame
buttonCheckKey.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
buttonCheckKey.BackgroundTransparency = 1.000
buttonCheckKey.Size = UDim2.new(1, 0, 1, 0)
buttonCheckKey.Font = Enum.Font.GothamBold
buttonCheckKey.Text = "Check Key"
buttonCheckKey.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonCheckKey.TextSize = 14.000

getKeyFrame.Name = "getKeyFrame"
getKeyFrame.Parent = actionFrame
getKeyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
getKeyFrame.Size = UDim2.new(0, 150, 0, 25)

strokeGetKey.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
strokeGetKey.Color = Color3.fromRGB(255,255,255)
strokeGetKey.LineJoinMode = Enum.LineJoinMode.Round
strokeGetKey.Thickness = 1


cornerGetKey.CornerRadius = UDim.new(0, 4)
cornerGetKey.Name = "cornerGetKey"
cornerGetKey.Parent = getKeyFrame

buttonGetKey.Name = "buttonGetKey"
buttonGetKey.Parent = getKeyFrame
buttonGetKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
buttonGetKey.BackgroundTransparency = 1.000
buttonGetKey.Size = UDim2.new(1, 0, 1, 0)
buttonGetKey.Font = Enum.Font.GothamBold
buttonGetKey.Text = "Get Key"
buttonGetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonGetKey.TextSize = 14.000

 
buttonGetKey.MouseButton1Click:Connect(function()
   setclipboard("https://discord.gg/VrJx432MB5")
   setclipboard("https://discord.gg/wDMPK3QAmY")
end)

local function validateKey(key)
    return key == "APEX_1A220abF" -- Replace this with your key
    return key == "KAI_22a7hbEw1" -- Replace this with your key
    return key == "FREE_10000000" -- Replace this with your key
    return key == "FREE_12345678"
end
 
 
buttonCheckKey.MouseButton1Click:Connect(function()
    local enteredKey = keyBox.Text
    if validateKey(enteredKey) then
        keyBox.PlaceholderText = "Correct Key!"
        keyBox.Text = ""
        wait(2)
        mainFrame:Destroy()
        print('KEY SUCCESS!')
 
-- Put Your Script Here
loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/APEX/refs/heads/main/apex.lua"))()
      
    else
        keyBox.PlaceholderText = "Wrong Key. Try again."
        keyBox.Text = ""
        wait(1)
        keyBox.PlaceholderText = "Enter Key..."
        keyBox.Text = ""
    end
end)
