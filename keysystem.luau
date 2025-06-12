local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- Create a BlurEffect
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "StellarLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true

-- Create Frame
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundTransparency = 1

-- Create Background Frame
local bg = Instance.new("Frame", frame)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
bg.BackgroundTransparency = 1
bg.ZIndex = 0
TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()

local word = "APEX OT"
local letters = {}
local subTitleLabel -- Declare subtitle label for scope access

local function tweenOutAndDestroy()
	for _, label in ipairs(letters) do
		TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1, TextSize = 20}):Play()
	end
	if subTitleLabel then
		TweenService:Create(subTitleLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play() -- Fade out subtitle
	end
	TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
	TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
	wait(0.6)
	screenGui:Destroy()
	blur:Destroy()
end

for i = 1, #word do
	local char = word:sub(i, i)

	local label = Instance.new("TextLabel")
	label.Text = char
	label.Font = Enum.Font.GothamBlack
	label.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text color
	label.TextStrokeTransparency = 0 -- Stroke visible for better contrast
	label.TextTransparency = 1
	label.TextScaled = false
	label.TextSize = 30 
	label.Size = UDim2.new(0, 60, 0, 60)
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.Position = UDim2.new(0.5, (i - (#word / 2 + 0.5)) * 65, 0.5, 0)
	label.BackgroundTransparency = 1
	label.Parent = frame

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),    -- Black
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) -- White
	})
	gradient.Rotation = 90
	gradient.Parent = label

	local tweenIn = TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0, TextSize = 60})
	tweenIn:Play()

	table.insert(letters, label)
	wait(0.25)
end

-- Create subtitle text label below main word with black & white gradient
subTitleLabel = Instance.new("TextLabel", frame) -- Assign to the declared variable
subTitleLabel.Text = "JOIN discord.gg/VrJx432MB5"
subTitleLabel.Font = Enum.Font.Gotham
subTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Base white for contrast
subTitleLabel.TextStrokeTransparency = 0.5 -- Slight stroke for subtle contrast
subTitleLabel.TextTransparency = 1
subTitleLabel.TextScaled = true
subTitleLabel.TextSize = 24 -- Smaller font size for subtitle
subTitleLabel.Size = UDim2.new(1, 0, 0, 30)
subTitleLabel.AnchorPoint = Vector2.new(0.5, 0)
subTitleLabel.Position = UDim2.new(0.5, 0, 0.5, 50)
subTitleLabel.BackgroundTransparency = 1

local subGradient = Instance.new("UIGradient")
subGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),    -- Black
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) -- White
})
subGradient.Rotation = 90
subGradient.Parent = subTitleLabel

local subTweenIn = TweenService:Create(subTitleLabel, TweenInfo.new(0.5), {TextTransparency = 0})
subTweenIn:Play()

wait(2)

tweenOutAndDestroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/APEX/refs/heads/main/apex.lua"))()
