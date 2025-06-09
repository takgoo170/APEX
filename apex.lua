setclipboard("https://discord.gg/VrJx432MB5")
-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Player and Character
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local oldCFrame = hrp.CFrame
local leaderstats = lp:FindFirstChild("leaderstats")
local shecklesStat = leaderstats and leaderstats:FindFirstChild("Sheckles")
local RS, Players = game:GetService("ReplicatedStorage"), game:GetService("Players")
local PetName, PetWeight, PetAge = "", "", ""

local function makeInput(Tab, name, placeholder, callback)
    Tab:CreateInput({
        Name = name,
        PlaceholderText = placeholder,
        RemoveTextAfterFocusLost = false,
        Callback = callback,
    })
end

-- Remotes and Paths
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local seedRemote = GameEvents:WaitForChild("BuySeedStock")
local gearRemote = GameEvents:WaitForChild("BuyGearStock")
local TwilightRemote = GameEvents:WaitForChild("BuyNightEventShopStock")
local easterRemote = GameEvents:WaitForChild("BuyEasterStock")
local dmRemote = GameEvents:WaitForChild("BuyEventShopStock")
local plantRemote = GameEvents:WaitForChild("Plant_RE")
local favoriteEvent = GameEvents:WaitForChild("Favorite_Item")
local seedPath = lp.PlayerGui.Seed_Shop.Frame.ScrollingFrame
local gearPath = lp.PlayerGui.Gear_Shop.Frame.ScrollingFrame
local bmPath = lp.PlayerGui.EventShop_UI.Frame.ScrollingFrame

-- Constants
local ProductId = 3268187638
local CLICK_DELAY = 0.00000001
local MAX_DISTANCE = 50
local RANGE = 50
local flySpeed = 48

-- Item Lists
local seedItems = {"Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn", "Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut", "Cactus", "Dragon Fruit", "Mango", "Grape", "Mushroom", "Pepper", "Cacao", "Beanstalk"}
local gearItems = {"Watering Can", "Trowel", "Recall Wrench", "Basic Sprinkler", "Advanced Sprinkler", "Godly Sprinkler", "Lightning Rod", "Master Sprinkler", "Favorite Tool", "Harvest Tool"}
local TwilightItems = {"Night Egg", "Night Seed Pack", "Twilight Crate", "Star Caller", "Moon Cat", "Celestiberry", "Moon Mango"}
local mutationOptions = {"Wet", "Gold", "Frozen", "Rainbow", "Choc", "Chilled", "Shocked", "Moonlit", "Bloodlit", "Celestial", "Plasma", "Disco", "Zombified"}
local seedNames = {"Apple", "Banana", "Bamboo", "Blueberry", "Candy Blossom", "Candy Sunflower", "Carrot", "Cactus", "Chocolate Carrot", "Chocolate Sprinkler", "Coconut", "Corn", "Cranberry", "Cucumber", "Cursed Fruit", "Candy Blossom", "Daffodil", "Dragon Fruit", "Durian", "Easter Egg", "Eggplant", "Grape", "Lemon", "Lotus", "Mango", "Mushroom", "Pepper", "Orange Tulip", "Papaya", "Passionfruit", "Peach", "Pear", "Pineapple", "Pumpkin", "Raspberry", "Red Lollipop", "Soul Fruit", "Strawberry", "Tomato", "Venus Fly Trap", "Watermelon", "Cacao", "Beanstalk"}

-- State Variables
local autoBuyEnabled = false
local autoBuyEnabledE = false
local autoFarmEnabled = false
local fastClickEnabled = false
local autoSellEnabled = false
local HarvestEnabled = false
local flyEnabled = false
local noclip = false
local infJump = false
local spamE = false
local enabled = false
local BAnanaDupeE = false
local autoFavoriteEnabled = false
local autoClaimToggle = false
local autoSkipEnabled = false
local AutoPlanting = false
local CurrentlyPlanting = false
local autoMoon = false
local EasterShopBuyEnabled = false
local Autoegg_autoBuyEnabled = false
local Autoegg_firstRun = true
local selectedSeeds = {"Beanstalk", "Pepper", "Cacao"}
local SelectedSeeds = {"Beanstalk", "Pepper", "Cacao"}
local selectedGears = {"Master Sprinkler", "Godly Sprinkler", "Harvest Tool"}
local selectedTwilight = {"Moon Mango", "Celestiberry", "Twilight Crate"}
local EasterShopSelectedItems = {}, {}, {}, {}, EasterShopItems
local selectedMutations = {"Gold", "Frozen", "Rainbow", "Choc", "Chilled", "Shocked", "Moonlit", "Bloodlit", "Celestial"}
local state = {
    selectedMutations = {"Bloodlit", "Celestial", "Disco", "Zombified", "Plasma"},
    espEnabled = false,
    espBillboards = {},
    espHighlights = {},
    webhookUrl = ""
}
local mutationColors = {
    Wet = Color3.fromRGB(0, 0, 255),
    Gold = Color3.fromRGB(255, 215, 0),
    Frozen = Color3.fromRGB(135, 206, 250),
    Rainbow = Color3.fromRGB(255, 255, 255),
    Choc = Color3.fromRGB(139, 69, 19),
    Chilled = Color3.fromRGB(0, 255, 255),
    Shocked = Color3.fromRGB(255, 255, 100),
    Moonlit = Color3.fromRGB(128, 0, 128),
    Bloodlit = Color3.fromRGB(200, 0, 0),
    Celestial = Color3.fromRGB(200, 150, 255)
}

-- Runtime Variables
local farms = {}
local plants = {}
local farmThread, fastClickThread, autoSellThread, HarvestConnection, flightConnection, collectionThread, descendantConnection, connection, claimConnection, BananaDupe
local bodyVelocity, bodyGyro
local promptTracker = {}
local notifiedFruits = {}

lp.PlayerGui.Hud_UI.SideBtns.Spin.Visible = true
lp.PlayerGui.Hud_UI.SideBtns.StarterPack.Visible = true
lp.PlayerGui.Teleport_UI.Frame.Pets.Visible = true
local gearicon = lp.PlayerGui.Teleport_UI.Frame.Gear
gearicon.Visible = true
gearicon.ImageColor3 = Color3.fromRGB(255, 255, 255)

-- Utility Functions
local function parseMoney(moneyStr)
    if not moneyStr then return 0 end
    moneyStr = tostring(moneyStr):gsub("ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¢", ""):gsub(",", ""):gsub(" ", ""):gsub("%$", "")
    local multiplier = 1
    if moneyStr:lower():find("k") then
        multiplier = 1000
        moneyStr = moneyStr:lower():gsub("k", "")
    elseif moneyStr:lower():find("m") then
        multiplier = 1000000
        moneyStr = moneyStr:lower():gsub("m", "")
    end
    return (tonumber(moneyStr) or 0) * multiplier
end

local function getPlayerMoney()
    return parseMoney((shecklesStat and shecklesStat.Value) or 0)
end

local function isInventoryFull()
    return #lp.Backpack:GetChildren() >= 200
end

-- Auto Farm Functions
local function updateFarmData()
    farms = {}
    plants = {}
    for _, farm in pairs(workspace:FindFirstChild("Farm"):GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
            table.insert(farms, farm)
            local plantsFolder = farm.Important:FindFirstChild("Plants_Physical")
            if plantsFolder then
                for _, plantModel in pairs(plantsFolder:GetChildren()) do
                    for _, part in pairs(plantModel:GetDescendants()) do
                        if part:IsA("BasePart") and part:FindFirstChildOfClass("ProximityPrompt") then
                            table.insert(plants, part)
                            break
                        end
                    end
                end
            end
        end
    end
end

local function glitchTeleport(pos)
    if not lp.Character then return end
    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local tween = TweenService:Create(root, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {CFrame=CFrame.new(pos + Vector3.new(0, 5, 0))})
    tween:Play()
end

local function instantFarm()
    if farmThread then task.cancel(farmThread) end
    farmThread = task.spawn(function()
        while autoFarmEnabled do
            while isInventoryFull() do
                if not autoFarmEnabled then return end
                task.wait(1)
            end
            if not autoFarmEnabled then return end
            updateFarmData()
            for _, part in pairs(plants) do
                if not autoFarmEnabled then return end
                if isInventoryFull() then break end
                if part and part.Parent then
                    local prompt = part:FindFirstChildOfClass("ProximityPrompt")
                    if prompt then
                        glitchTeleport(part.Position)
                        task.wait(0.2)
                        for _, farm in pairs(farms) do
                            if not autoFarmEnabled or isInventoryFull() then break end
                            for _, obj in pairs(farm:GetDescendants()) do
                                if obj:IsA("ProximityPrompt") then
                                    local str = tostring(obj.Parent)
                                    if not (str:find("Grow_Sign") or str:find("Core_Part")) then
                                        fireproximityprompt(obj, 1)
                                    end
                                end
                            end
                        end
                        if not autoFarmEnabled then return end
                        task.wait(0.2)
                    end
                end
            end
            if autoFarmEnabled then task.wait(0.1) end
        end
    end)
end

-- Auto Collect Functions
local function isValidPrompt(prompt)
    local parent = prompt.Parent
    if not parent then return false end
    local name = parent.Name:lower()
    return not (name:find("sign") or name:find("core"))
end

local function getNearbyPrompts()
    local nearby = {}
    local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nearby end
    
    for _, farm in pairs(workspace.Farm:GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
            for _, obj in pairs(farm:GetDescendants()) do
                if obj:IsA("ProximityPrompt") and isValidPrompt(obj) then
                    local part = obj.Parent
                    if part:IsA("BasePart") then
                        local dist = (hrp.Position - part.Position).Magnitude
                        if dist <= MAX_DISTANCE then
                            table.insert(nearby, obj)
                        end
                    end
                end
            end
        end
    end
    return nearby
end

local function fastClickFarm()
    if fastClickThread then task.cancel(fastClickThread) end
    fastClickThread = task.spawn(function()
        while fastClickEnabled do
            if isInventoryFull() then
                task.wait(1)
                continue
            end
            local prompts = getNearbyPrompts()
            for _, prompt in pairs(prompts) do
                if not fastClickEnabled then return end
                if isInventoryFull() then break end
                fireproximityprompt(prompt, 1)
                task.wait(CLICK_DELAY)
            end
            task.wait(0.1)
        end
    end)
end

-- Auto Sell Functions
local function sellItems()
    local steven = workspace.NPCS:FindFirstChild("Steven")
    if not steven then return false end
    
    local char = lp.Character
    if not char then return false end
    
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    
    local originalPosition = hrp.CFrame
    hrp.CFrame = steven.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3)
    task.wait(0.5)
    
    for _ = 1, 5 do
        pcall(function()
            ReplicatedStorage.GameEvents.Sell_Inventory:FireServer()
        end)
        task.wait(0.15)
    end
    
    hrp.CFrame = originalPosition
    return true
end

local function FindGarden()
    local farm = workspace:FindFirstChild("Farm")
    if not farm then return nil end
    
    for _, plot in ipairs(farm:GetChildren()) do
        local data = plot:FindFirstChild("Important") and plot.Important:FindFirstChild("Data")
        local owner = data and data:FindFirstChild("Owner")
        if owner and owner.Value == lp.Name then
            return plot
        end
    end
    return nil
end

local function CanHarvest(part)
    local prompt = part:FindFirstChild("ProximityPrompt")
    return prompt and prompt.Enabled
end

local function Harvest()
    if not HarvestEnabled then return end
    if isInventoryFull() then return end
    
    local garden = FindGarden()
    if not garden then return end
    
    local plants = garden:FindFirstChild("Important") and garden.Important:FindFirstChild("Plants_Physical")
    if not plants then return end
    
    for _, plant in ipairs(plants:GetChildren()) do
        if not HarvestEnabled then break end
        local fruits = plant:FindFirstChild("Fruits")
        if fruits then
            for _, fruit in ipairs(fruits:GetChildren()) do
                if not HarvestEnabled then break end
                for _, part in ipairs(fruit:GetChildren()) do
                    if not HarvestEnabled then break end
                    if part:IsA("BasePart") and CanHarvest(part) then
                        local prompt = part.ProximityPrompt
                        local pos = part.Position + Vector3.new(0, 3, 0)
                        if lp.Character and lp.Character.PrimaryPart then
                            lp.Character:SetPrimaryPartCFrame(CFrame.new(pos))
                            task.wait(0.1)
                            if not HarvestEnabled then break end
                            prompt:InputHoldBegin()
                            task.wait(0.1)
                            if not HarvestEnabled then break end
                            prompt:InputHoldEnd()
                            task.wait(0.1)
                        end
                    end
                end
            end
        end
    end
end

local function ToggleHarvest(state)
    if HarvestConnection then
        HarvestConnection:Disconnect()
        HarvestConnection = nil
    end
    HarvestEnabled = state
    if state then
        HarvestConnection = RunService.Heartbeat:Connect(function()
            if HarvestEnabled then
                Harvest()
            else
                HarvestConnection:Disconnect()
                HarvestConnection = nil
            end
        end)
    end
end

local function Fly(state)
    flyEnabled = state
    if flyEnabled then
        local character = lp.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        
        bodyGyro = Instance.new("BodyGyro")
        bodyVelocity = Instance.new("BodyVelocity")
        bodyGyro.P = 9000
        bodyGyro.maxTorque = Vector3.new(8999999488, 8999999488, 8999999488)
        bodyGyro.cframe = character.HumanoidRootPart.CFrame
        bodyGyro.Parent = character.HumanoidRootPart
        
        bodyVelocity.velocity = Vector3.new(0, 0, 0)
        bodyVelocity.maxForce = Vector3.new(8999999488, 8999999488, 8999999488)
        bodyVelocity.Parent = character.HumanoidRootPart
        humanoid.PlatformStand = true
        
        flightConnection = RunService.Heartbeat:Connect(function()
            if not flyEnabled or not character:FindFirstChild("HumanoidRootPart") then
                if flightConnection then flightConnection:Disconnect() end
                return
            end
            
            local cam = workspace.CurrentCamera.CFrame
            local moveVec = Vector3.new()
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveVec = moveVec + cam.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveVec = moveVec - cam.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveVec = moveVec - cam.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveVec = moveVec + cam.RightVector
            end
            
            if moveVec.Magnitude > 0 then
                moveVec = moveVec.Unit * flySpeed
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveVec = moveVec + Vector3.new(0, flySpeed, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveVec = moveVec + Vector3.new(0, -flySpeed, 0)
            end
            
            bodyVelocity.velocity = moveVec
            bodyGyro.cframe = cam
        end)
    else
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        
        local character = lp.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
        
        if flightConnection then
            flightConnection:Disconnect()
            flightConnection = nil
        end
    end
end

local function ToggleNoclip(state)
    noclip = state
end

RunService.Stepped:Connect(function()
    if noclip then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)

local function ToggleInfJump(state)
    infJump = state
end

UserInputService.JumpRequest:Connect(function()
    if infJump and char and char:FindFirstChildOfClass("Humanoid") then
        char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Shop Functions
local function OpenShop()
    local shop = lp.PlayerGui.Seed_Shop
    shop.Enabled = not shop.Enabled
end
local function OpenGearShop()
    local gear = lp.PlayerGui.Gear_Shop
    gear.Enabled = not gear.Enabled
end

local function OpenEaster()
    local easter = lp.PlayerGui.Easter_Shop
    easter.Enabled = not easter.Enabled
end

local function OpenQuest()
    local quest = lp.PlayerGui.DailyQuests_UI
    quest.Enabled = not quest.Enabled
end

local function OpenBloodShop()
    local Bs = lp.PlayerGui.EventShop_UI
    Bs.Enabled = not Bs.Enabled
end

local function OpenCosmetic()
    local Bs = lp.PlayerGui.CosmeticShop_UI
    Bs.Enabled = not Bs.Enabled
end

local function OpenTwilight()
    local Bs = lp.PlayerGui.NightEventShop_UI
    Bs.Enabled = not Bs.Enabled
end

local function OpenTwilightQuest()
    local Bs = lp.PlayerGui.NightQuest_UI
    Bs.Enabled = not Bs.Enabled
end

local function EggShop1()
    fireproximityprompt(workspace.NPCS["Pet Stand"].EggLocations["Common Egg"].ProximityPrompt)
end

local function EggShop2()
    fireproximityprompt(workspace.NPCS["Pet Stand"].EggLocations:GetChildren()[6].ProximityPrompt)
end

local function EggShop3()
    fireproximityprompt(workspace.NPCS["Pet Stand"].EggLocations:GetChildren()[5].ProximityPrompt)
end

-- Auto Buy Egg
local Autoegg_npc = workspace:WaitForChild("NPCS"):WaitForChild("Pet Stand")
local Autoegg_timer = Autoegg_npc.Timer.SurfaceGui:WaitForChild("ResetTimeLabel")
local Autoegg_eggLocations = Autoegg_npc:WaitForChild("EggLocations")
local Autoegg_events = GameEvents

local function Autoegg_safeFirePrompt(prompt)
    if prompt then
        pcall(function()
            fireproximityprompt(prompt)
        end)
    end
end

local function Autoegg_safeFireServer(id)
    pcall(function()
        Autoegg_events:WaitForChild("BuyPetEgg"):FireServer(id)
    end)
end

local function Autoegg_setAlwaysShow()
    for _, obj in ipairs(Autoegg_eggLocations:GetChildren()) do
        for _, child in ipairs(obj:GetDescendants()) do
            if child:IsA("ProximityPrompt") then
                child.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow
            end
        end
    end
end

local function Autoegg_autoBuyEggs()
    if Autoegg_autoBuyEnabled then
        if not Autoegg_firstRun then
            while Autoegg_timer.Text ~= "00:00:00" do
                task.wait(0.1)
            end
            task.wait(3)
        else
            Autoegg_firstRun = false
        end

        if not lp.Character or not lp.Character:FindFirstChild("HumanoidRootPart") then return end
        lp.Character.HumanoidRootPart.CFrame = CFrame.new(-255.12291, 2.99999976, -1.13749218, -0.0163238496, 1.05261321e-07, 0.999866784, -5.92361182e-09, 1, -1.0537206e-07, -0.999866784, -7.64290053e-09, -0.0163238496)

        Autoegg_setAlwaysShow()

        local commonEggPrompt = Autoegg_eggLocations:FindFirstChild("Common Egg")
        if commonEggPrompt then
            Autoegg_safeFirePrompt(commonEggPrompt:FindFirstChild("ProximityPrompt"))
            task.wait(0.3)
            Autoegg_safeFireServer(1)
        end

        local eggSlot6 = Autoegg_eggLocations:GetChildren()[6]
        if eggSlot6 then
            Autoegg_safeFirePrompt(eggSlot6:FindFirstChild("ProximityPrompt"))
            task.wait(0.3)
            Autoegg_safeFireServer(2)
        end

        local eggSlot5 = Autoegg_eggLocations:GetChildren()[5]
        if eggSlot5 then
            Autoegg_safeFirePrompt(eggSlot5:FindFirstChild("ProximityPrompt"))
            task.wait(0.3)
            Autoegg_safeFireServer(3)
        end

        lp.Character.HumanoidRootPart.CFrame = oldCFrame
    end
end
task.spawn(function()
    while true do
        task.wait(0.5)
        if Autoegg_autoBuyEnabled then
            Autoegg_autoBuyEggs()
        end
    end
end)

-- Sell Functions
local function SellAll()
    local steven = workspace.NPCS:FindFirstChild("Steven")
    if steven then
        hrp.CFrame = steven.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        task.wait(0.2)
        GameEvents:WaitForChild("Sell_Inventory"):FireServer()
        
        local farms = workspace:WaitForChild("Farm"):GetChildren()
        for _, farm in pairs(farms) do
            local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
            if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
                local spawn = farm:FindFirstChild("Spawn_Point")
                if spawn then
                    hrp.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)
                    break
                end
            end
        end
    end
end

local function HSell()
    local steven = workspace.NPCS:FindFirstChild("Steven")
    if steven then
        hrp.CFrame = steven.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        task.wait(0.2)
        GameEvents:WaitForChild("Sell_Item"):FireServer()
        
        local farms = workspace:WaitForChild("Farm"):GetChildren()
        for _, farm in pairs(farms) do
            local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
            if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
                local spawn = farm:FindFirstChild("Spawn_Point")
                if spawn then
                    hrp.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)
                    break
                end
            end
        end
    end
end

local function AutoGiveFruitMoon(state)
    autoMoon = state
    task.spawn(function()
        while autoMoon do
            local backpack = lp:FindFirstChild("Backpack")
            local character = lp.Character or lp.CharacterAdded:Wait()
            if backpack and character then
                for _, tool in pairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name, "%[Moonlit%]") then
                        tool.Parent = character
                        task.wait(0.5)
                        for _ = 1, 10 do
                            GameEvents.NightQuestRemoteEvent:FireServer("SubmitHeldPlant")
                        end
                        task.wait(0.5)
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

-- Auto Collect V2 Functions
local function modifyPrompt(prompt, show)
    pcall(function()
        prompt.RequiresLineOfSight = not show
        prompt.Exclusivity = show and Enum.ProximityPromptExclusivity.AlwaysShow or Enum.ProximityPromptExclusivity.One
    end)
end

local function isInsideFarm(part)
    for _, farm in pairs(farms) do
        if part:IsDescendantOf(farm) then
            return true
        end
    end
    return false
end

local function handleNewPrompt(prompt)
    if not prompt:IsA("ProximityPrompt") then return end
    if not isInsideFarm(prompt) then return end
    
    if not promptTracker[prompt] then
        promptTracker[prompt] = {
            originalRequiresLOS = prompt.RequiresLineOfSight,
            originalExclusivity = prompt.Exclusivity
        }
    end
    
    modifyPrompt(prompt, spamE)
    prompt.AncestryChanged:Connect(function(_, parent)
        if parent == nil then
            promptTracker[prompt] = nil
        end
    end)
end
local function OneClickRemove(state)
    enabled = state
    local confirmFrame = lp.PlayerGui:FindFirstChild("ShovelPrompt")
    if confirmFrame and confirmFrame:FindFirstChild("ConfirmFrame") then
        confirmFrame.ConfirmFrame.Visible = not state
    end
end

-- Destroy Sign Function
local function DestroySign()
    for _, farm in pairs(workspace.Farm:GetChildren()) do
        local sign = farm:FindFirstChild("Sign")
        if sign then
            local core = sign:FindFirstChild("Core_Part")
            if core then
                for _, obj in pairs(core:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") then
                        obj:Destroy()
                    end
                end
            end
        end
        
        local growSign = farm:FindFirstChild("Grow_Sign")
        if growSign then
            for _, obj in pairs(growSign:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    obj:Destroy()
                end
            end
        end
    end
end

-- Auto Favorite Functions
local function toolMatchesMutation(toolName)
    for _, mutation in ipairs(selectedMutations) do
        if string.find(toolName, mutation) then
            return true
        end
    end
    return false
end

local function isToolFavorited(tool)
    return tool:GetAttribute("Favorite") or (tool:FindFirstChild("Favorite") and tool.Favorite.Value)
end

local function favoriteToolIfMatches(tool)
    if toolMatchesMutation(tool.Name) and not isToolFavorited(tool) then
        favoriteEvent:FireServer(tool)
        task.wait(0.1)
    end
end

local function processBackpack()
    local backpack = lp:FindFirstChild("Backpack") or lp:WaitForChild("Backpack")
    for _, tool in ipairs(backpack:GetChildren()) do
        favoriteToolIfMatches(tool)
    end
end

local function setupAutoFavorite()
    if connection then connection:Disconnect() end
    local backpack = lp:WaitForChild("Backpack")
    connection = backpack.ChildAdded:Connect(function(tool)
        task.wait(0.1)
        favoriteToolIfMatches(tool)
    end)
    processBackpack()
end

-- Auto Claim Premium Seeds Functions
local function claimPremiumSeed()
    GameEvents.SeedPackGiverEvent:FireServer("ClaimPremiumPack")
end

local function toggleAutoClaim(newState)
    autoClaimToggle = newState
    if claimConnection then
        claimConnection:Disconnect()
        claimConnection = nil
    end
    if autoClaimToggle then
        claimConnection = RunService.Heartbeat:Connect(function()
            claimPremiumSeed()
            task.wait()
        end)
    end
end

-- Auto Open Crate Functions
local function toggleAutoSkip()
    autoSkipEnabled = not autoSkipEnabled
    if autoSkipEnabled then
        task.spawn(function()
            local character = lp.Character
            local backpack = lp:FindFirstChild("Backpack")
            local seedTool
            if backpack then
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool.Name:find("Basic Seed Pack") then
                        seedTool = tool
                        break
                    end
                end
            end
            if seedTool and character then
                seedTool.Parent = character
            end
            
            while autoSkipEnabled do
                local PlayerGui = lp:FindFirstChild("PlayerGui")
                local RollCrate_UI = PlayerGui and PlayerGui:FindFirstChild("RollCrate_UI")
                local character = lp.Character
                local equippedTool = character and character:FindFirstChildOfClass("Tool")
                local holdingSeed = equippedTool and equippedTool.Name:find("Basic Seed Pack")
                
                if RollCrate_UI then
                    if RollCrate_UI.Enabled then
                        local Frame = RollCrate_UI:FindFirstChild("Frame")
                        local Button = Frame and Frame:FindFirstChild("Skip")
                        if Button and Button:IsA("ImageButton") and Button.Visible then
                            GuiService.SelectedObject = Button
                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                        end
                    elseif holdingSeed then
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end
local function ServerHop()
    local servers = {}
    local cursor = nil
    repeat
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        if cursor then url = url .. "&cursor=" .. cursor end
        local data = HttpService:JSONDecode(game:HttpGet(url))
        for _, server in ipairs(data.data) do
            table.insert(servers, server.id)
        end
        cursor = data.nextPageCursor
    until not cursor or #servers > 0
    if #servers == 0 then return end
    TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], lp)
end

-- Auto Plant Functions
local function getPlayerPosition()
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:FindFirstChild("HumanoidRootPart")
    return root and root.Position or Vector3.zero
end

local function getCurrentSeedsInBackpack()
    local result = {}
    for _, tool in ipairs(lp.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local base = tool.Name:match("^(.-) Seed")
            if base and table.find(SelectedSeeds, base) then
                result[#result + 1] = {BaseName = base, Tool = tool}
            end
        end
    end
    return result
end

local function plantEquippedSeed(seedName)
    local pos = getPlayerPosition()
    plantRemote:FireServer(pos, seedName)
end

local function equipTool(tool)
    if not tool or not tool:IsDescendantOf(lp.Backpack) then return end
    pcall(function()
        lp.Character.Humanoid:UnequipTools()
        task.wait(0.1)
        tool.Parent = lp.Character
        while not lp.Character:FindFirstChild(tool.Name) do
            task.wait(0.1)
        end
    end)
end

local function startAutoPlanting()
    if CurrentlyPlanting then return end
    CurrentlyPlanting = true
    task.spawn(function()
        while AutoPlanting do
            local seeds = getCurrentSeedsInBackpack()
            for _, data in ipairs(seeds) do
                local tool = data.Tool
                local seedName = data.BaseName
                if not table.find(SelectedSeeds, seedName) then continue end
                if tool and tool:IsA("Tool") and tool:IsDescendantOf(lp.Backpack) then
                    equipTool(tool)
                    task.wait(0.2)
                    while AutoPlanting and lp.Character:FindFirstChild(tool.Name) do
                        if not table.find(SelectedSeeds, seedName) then break end
                        plantEquippedSeed(seedName)
                        task.wait(0.1)
                    end
                end
            end
            task.wait(0.1)
        end
        CurrentlyPlanting = false
    end)
end

-- Destroy Others Farm Function
local function DestroyOthersFarm()
    local farms = workspace:FindFirstChild("Farm")
    if not farms then return end
    for _, farm in pairs(farms:GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value ~= lp.Name then
            local plants = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Plants_Physical")
            if plants then
                for _, obj in pairs(plants:GetChildren()) do
                    obj:Destroy()
                end
            end
        end
    end
end

-- ESP Functions
local function createESP(fruitModel)
    if state.espBillboards[fruitModel] then
        state.espBillboards[fruitModel]:Destroy()
        state.espBillboards[fruitModel] = nil
    end
    if state.espHighlights[fruitModel] then
        state.espHighlights[fruitModel]:Destroy()
        state.espHighlights[fruitModel] = nil
    end
    if not state.espEnabled then return end
    local activeMutations = {}
    for _, mutation in ipairs(mutationOptions) do
        if table.find(state.selectedMutations, mutation) and fruitModel:GetAttribute(mutation) then
            table.insert(activeMutations, mutation)
        end
    end
    if #activeMutations == 0 then return end
    local text = fruitModel.Name .. " - " .. table.concat(activeMutations, ", ")
    local espColor = mutationColors[activeMutations[1]] or Color3.fromRGB(255, 255, 255)
    local highlight = Instance.new("Highlight")
    highlight.Name = "MutationESP_Highlight"
    highlight.FillTransparency = 1
    highlight.OutlineColor = espColor
    highlight.OutlineTransparency = 0
    highlight.Adornee = fruitModel
    highlight.Parent = fruitModel
    state.espHighlights[fruitModel] = highlight
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "MutationESP"
    billboard.Adornee = fruitModel.PrimaryPart or fruitModel:FindFirstChildWhichIsA("BasePart")
    billboard.Size = UDim2.fromOffset(100, 20)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = true
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.fromScale(1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "{" .. text .. "}"
    textLabel.TextColor3 = espColor
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0.5
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard
    billboard.Parent = fruitModel
    state.espBillboards[fruitModel] = billboard
end
local function updateESP()
    for _, billboard in pairs(state.espBillboards) do
        billboard:Destroy()
    end
    for _, highlight in pairs(state.espHighlights) do
        highlight:Destroy()
    end
    table.clear(state.espBillboards)
    table.clear(state.espHighlights)
    if not state.espEnabled or not workspace:FindFirstChild("Farm") then return end
    local farms = {}
    for _, farm in ipairs(workspace.Farm:GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
            table.insert(farms, farm)
        end
    end
    for _, farm in ipairs(farms) do
        local plantsFolder = farm.Important:FindFirstChild("Plants_Physical")
        if plantsFolder then
            for _, plantModel in ipairs(plantsFolder:GetChildren()) do
                if plantModel:IsA("Model") then
                    local fruitsFolder = plantModel:FindFirstChild("Fruits")
                    if fruitsFolder then
                        for _, fruitModel in ipairs(fruitsFolder:GetChildren()) do
                            if fruitModel:IsA("Model") then
                                createESP(fruitModel)
                            end
                        end
                    end
                end
            end
        end
    end
end

local function updateMutationCounts()
    local mutationCounts = {}
    for _, mutation in pairs(mutationOptions) do
        mutationCounts[mutation] = 0
    end
    local farms = {}
    for _, farm in pairs(workspace.Farm:GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
            table.insert(farms, farm)
        end
    end
    for _, farm in pairs(farms) do
        local plantsFolder = farm.Important:FindFirstChild("Plants_Physical")
        if plantsFolder then
            for _, plantModel in pairs(plantsFolder:GetChildren()) do
                if plantModel:IsA("Model") then
                    local fruitsFolder = plantModel:FindFirstChild("Fruits")
                    if fruitsFolder then
                        for _, fruitModel in pairs(fruitsFolder:GetChildren()) do
                            if fruitModel:IsA("Model") then
                                local fruitId = fruitModel:GetFullName()
                                local mutationsFound = {}
                                for _, mutation in pairs(mutationOptions) do
                                    if fruitModel:GetAttribute(mutation) then
                                        mutationCounts[mutation] = mutationCounts[mutation] + 1
                                        table.insert(mutationsFound, mutation)
                                    end
                                end
                                if #mutationsFound > 0 and not notifiedFruits[fruitId] and state.espEnabled then
                                    notifiedFruits[fruitId] = true
                                    local plantName = plantModel.Name or "Unknown Plant"
                                    sendWebhookNotification(plantName, mutationsFound, lp.Name)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    local countText = ""
    for _, mutation in pairs(mutationOptions) do
        if mutationCounts[mutation] > 0 then
            countText = countText .. mutation .. ": " .. mutationCounts[mutation] .. ", "
        end
    end
    countText = countText:sub(1, -3)
    if countText == "" then countText = "No mutations found" end
    return countText
end

-- Table to track processed mutations (e.g., { [modelPath] = { mutation1 = true, mutation2 = true } })
local processedMutations = {}
local function sendWebhook(data)
    if not data or type(data) ~= "table" then return end
    local HttpService = game:GetService("HttpService")
    local json = HttpService:JSONEncode(data)
    local request = (syn and syn.request) or (http and http.request) or (http_request) or (request)
    if not request then return end
    local success, result = pcall(request, {
        Url = state.webhookUrl,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = json
    })
    if not success then
        warn("Failed to send webhook: " .. tostring(result))
        return false
    end
    if result and result.StatusCode and result.StatusCode >= 200 and result.StatusCode < 300 then
        print("Webhook sent successfully!")
        return true
    else
        warn("Webhook failed with status " .. tostring(result.StatusCode) .. ": " .. tostring(result.Body))
        return false
    end
end

local function sendWebhookNotification(fruitName, mutation, farmName)
    if state.webhookUrl == "" then return end

    local webhookData = {
        content = "",
        embeds = {
            {
                title = "ÃƒÂ°Ã…Â¸Ã…â€™Ã‚Â· Mutation Detected! ÃƒÂ°Ã…Â¸Ã…â€™Ã‚Â·",
                description = string.format("A **%s** mutation was found!", mutation),
                color = 0x00FF00,
                fields = {
                    { name = "Fruit", value = fruitName or "Unknown", inline = true },
                    { name = "Farm", value = farmName or "Unknown", inline = true }
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }
    }

    return sendWebhook(webhookData)
end

-- Function to check farms and send notifications for new mutations
local function checkForMutations()
    if not workspace:FindFirstChild("Farm") or state.webhookUrl == "" or #state.selectedMutations == 0 then return end

    local farms = {}
    for _, farm in ipairs(workspace.Farm:GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
            table.insert(farms, farm)
        end
    end

    for _, farm in ipairs(farms) do
        local plantsFolder = farm.Important:FindFirstChild("Plants_Physical")
        if plantsFolder then
            for _, plantModel in ipairs(plantsFolder:GetChildren()) do plantModel:IsA("Model")
                local fruitsFolder = plantModel:FindFirstChild("Fruits")
                if fruitsFolder then
                    for _, fruitModel in ipairs(fruitsFolder:GetChildren()) do fruitModel:IsA("Model")
                        -- Create a unique identifier for this fruit model (e.g., full path)
                        local modelPath = fruitModel:GetFullName()

                        -- Initialize processed mutations for this model if not exists
                        if not processedMutations[modelPath] then
                            processedMutations[modelPath] = {}
                        end

                        -- Check for selected mutations
                        for _, mutation in ipairs(state.selectedMutations) do
                            if fruitModel:GetAttribute(mutation) == true then
                                -- Check if this mutation was already processed
                                if not processedMutations[modelPath][mutation] then
                                    -- Mark as processed
                                    processedMutations[modelPath][mutation] = true
                                    -- Send webhook notification for new mutation
                                    sendWebhookNotification(
                                        plantModel.Name,
                                        mutation,
                                        farm.Name
                                    )
                                    -- Optional: Add a short delay to avoid rate limits
                                    wait(0.5) -- Adjust based on Discord's rate limit (e.g., 30 req/min)
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    -- Optional: Clean up processed mutations for models that no longer exist
    for modelPath in pairs(processedMutations) do
        if not game:GetService("Workspace"):FindFirstChild(modelPath) then
            processedMutations[modelPath] = nil
        end
    end
end

-------- UI -------- 
local KaiUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/Beta_Kai_Scripts/refs/heads/main/Beta.lua"))()
local Window = KaiUI:CreateWindow({
    Title = "Apex OT | Grow a Garden",
    SubTitle = "by Apex Team | (discord.gg/VrJx432MB5)",
    TabWidth = 149,
    Size = UDim2.fromOffset(540, 375),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--------------------------- TABS ------------------------------
local MainTab = Window:AddTab({ Title = "Main", Icon = "home" })
local EventTab = Window:AddTab({ Title = "Event", Icon = "swords" })
local ShopTab = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" })
local PlayerTab = Window:AddTab({ Title = "Player", Icon = "user" })
local VisualTab = Window:AddTab({ Title = "Visual", Icon = "eye" })
local MiscTab = Window:AddTab({ Title = "Misc", Icon = "settings" })

----------- MAIN TAB -------------
MainTab:AddSection("Main Farm")
local FarmV1 = MainTab:AddToggle("FarmV1", {
    Title = "Auto Farm [ V1 ]",
    Description = "",
    Default = false,
    Callback = function(state) 
      autoFarmEnabled = state 
      if state then 
        instantFarm() 
      else if farmThread then 
          task.cancel(farmThread) farmThread = nil 
        end 
      end 
    end })

local FarmV2 = MainTab:AddToggle("FarmV2", {
    Title = "Auto Farm [ V2 ]",
    Description = "",
    Default = false,
    Callback = ToggleHarvest 
  })

local CollectV1 = MainTab:AddToggle("CollectV1", {
    Title = "Auto Collect",
    Description = "",
    Default = false,
    Callback = function(state) 
      fastClickEnabled = state 
      if state then 
        fastClickFarm() 
      else if fastClickThread then
        task.cancel(fastClickThread) 
        fastClickThread = nil 
        end 
      end 
    end 
  })

--[[local CollectV2 = MainTab:AddToggle("CollectV2", {
    Title = "Auto Collect [ V2 ]",
    Description "OPTIMIZED",
    Default = false, 
    Callback = function(Value)
    spamE = Value
    updateFarmData()
    for _, farm in pairs(farms) do for _, obj in ipairs(farm:GetDescendants()) do if obj:IsA("ProximityPrompt") then handleNewPrompt(obj) end end end
    if spamE then
        collectionThread = task.spawn(function()
            while spamE and task.wait(0.1) do
                if not isInventoryFull() then
                    local char = lp.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if root then
                        for prompt, _ in pairs(promptTracker) do
                            if prompt:IsA("ProximityPrompt") and prompt.Enabled and prompt.KeyboardKeyCode == Enum.KeyCode.E then
                                local targetPos
                                local parent = prompt.Parent
                                if parent:IsA("BasePart") then targetPos = parent.Position
                                elseif parent:IsA("Model") and parent:FindFirstChild("HumanoidRootPart") then targetPos = parent.HumanoidRootPart.Position end
                                if targetPos and (root.Position - targetPos).Magnitude <= RANGE then pcall(function() fireproximityprompt(prompt, 1, true) end) end
                            end
                        end
                    end
                end
            end
        end)
    else
        for prompt, data in pairs(promptTracker) do if prompt:IsA("ProximityPrompt") then pcall(function() prompt.RequiresLineOfSight = data.originalRequiresLOS prompt.Exclusivity = data.originalExclusivity end) end end
        if collectionThread then task.cancel(collectionThread) collectionThread = nil end
    end
end })
]]

 --descendantConnection = workspace.DescendantAdded:Connect(function(obj) if obj:IsA("ProximityPrompt") and isInsideFarm(obj) then handleNewPrompt(obj) end end)
local SellToggle = MainTab:AddToggle("SellToggle", {
    Title = "Auto Sell",
    Description = "Automatically sells when inventory is FULL.",
    Default = false,
    Callback = function(Value)
    autoSellEnabled = Value
    if autoSellEnabled then
        autoSellThread = task.spawn(function() while autoSellEnabled and task.wait(1) do if isInventoryFull() then sellItems() end end end)
    elseif autoSellThread then task.cancel(autoSellThread) end
end 
    })

MainTab:AddSection("Mutations")

local ignoredMutations = {"Celestial"} -- Table to store selected mutations to ignore
local ignoreMutationsEnabled = false -- Toggle for ignoring mutations
local allPromptsDisabled = false -- Toggle for disabling all prompts

-- Function to update ProximityPrompts for a single fruit
local function updateFruitPrompts(fruitModel)
    if not fruitModel:IsA("Model") then return end
    for _, obj in ipairs(fruitModel:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            local shouldDisable = allPromptsDisabled
            if not allPromptsDisabled and ignoreMutationsEnabled then
                for _, mutation in ipairs(ignoredMutations) do
                    if fruitModel:GetAttribute(mutation) == true then
                        shouldDisable = true
                        break
                    end
                end
            end
            obj.Enabled = not shouldDisable
        end
    end
end

-- Function to update all ProximityPrompts in owned farms
local function updatePromptsForMutations()
    local farms = {}
    if not Workspace:FindFirstChild("Farm") then return end
    
    for _, farm in ipairs(Workspace.Farm:GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
            table.insert(farms, farm)
        end
    end
    
    for _, farm in ipairs(farms) do
        local plantsFolder = farm.Important:FindFirstChild("Plants_Physical")
        if plantsFolder then
            for _, plantModel in ipairs(plantsFolder:GetChildren()) do
                if plantModel:IsA("Model") then
                    local fruitsFolder = plantModel:FindFirstChild("Fruits")
                    if fruitsFolder then
                        for _, fruitModel in ipairs(fruitsFolder:GetChildren()) do
                            updateFruitPrompts(fruitModel)
                        end
                    end
                end
            end
        end
    end
end

-- Monitor new fruits being added
local function setupFruitMonitoring()
    if not Workspace:FindFirstChild("Farm") then return end
    for _, farm in ipairs(Workspace.Farm:GetChildren()) do
        local data = farm:FindFirstChild("Important") and farm.Important:FindFirstChild("Data")
        if data and data:FindFirstChild("Owner") and data.Owner.Value == lp.Name then
            local plantsFolder = farm.Important:FindFirstChild("Plants_Physical")
            if plantsFolder then
                plantsFolder.ChildAdded:Connect(function(plantModel)
                    if plantModel:IsA("Model") then
                        local fruitsFolder = plantModel:WaitForChild("Fruits", 5)
                        if fruitsFolder then
                            fruitsFolder.ChildAdded:Connect(function(fruitModel)
                                updateFruitPrompts(fruitModel)
                            end)
                            -- Update existing fruits in the new plant
                            for _, fruitModel in ipairs(fruitsFolder:GetChildren()) do
                                updateFruitPrompts(fruitModel)
                            end
                        end
                    end
                end)
            end
        end
    end
end

-- Initialize monitoring
setupFruitMonitoring()

-- Re-run monitoring setup when Farm or its children change
Workspace.Farm.ChildAdded:Connect(function()
    setupFruitMonitoring()
end)

local ExcludeMutation = MainTab:AddDropdown("ExcludeMutation", {
        Title = "Ignore Mutation",
        Description = "You can select multiple values.",
        Values = mutationOptions,
        Multi = true,
        Default = {},
        Callback = function(selectedOptions)
         ignoredMutations = selectedOptions
        updatePromptsForMutations()
    end
    })

local IgnoreMutation = MainTab:AddToggle("IgnoreMutation", {
    Title = "Ignore Selected Mutation",
    Description = "",
    Default = false,
    Callback = function(state)
        ignoreMutationsEnabled = state
        updatePromptsForMutations()
    end
  })

--------------- EVENT TAB ----------------
local section = EventTab:AddSection("🐝 BEE EVENT | HONEY")
local ativo = false

EventTab:AddToggle("Auto Trade Machine", {
    Title = "Auto Trade Pollinated",
    Description = "Equips only Pollinated items and interacts with machine",
    Default = false,
    Callback = function(toggle)
        ativo = toggle
        if not toggle then return end

        task.spawn(function()
            local player = game:GetService("Players").LocalPlayer
            local rs = game:GetService("ReplicatedStorage")

            local function temPollinated(nome)
                return nome:lower():find("pollinated") ~= nil
            end

            while ativo do
                local char = player.Character or player.CharacterAdded:Wait()
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                local mochila = player:FindFirstChild("Backpack")
                local itens = {}

                for _, container in ipairs({char, mochila}) do
                    if container then
                        for _, item in ipairs(container:GetChildren()) do
                            if item:IsA("Tool") and temPollinated(item.Name) then
                                table.insert(itens, item)
                            end
                        end
                    end
                end

                for _, item in ipairs(itens) do
                    if not ativo then return end

                    humanoid:EquipTool(item)
                    task.wait(0.1)

                    ufav()
                    rs.GameEvents.HoneyMachineService_RE:FireServer("MachineInteract")

                    local tempo = tick()
                    while ativo and char:FindFirstChildOfClass("Tool") == item do
                        if tick() - tempo >= 2 then
                            rs.GameEvents.HoneyMachineService_RE:FireServer("MachineInteract")
                            tempo = tick()
                        end
                        task.wait(0.5)
                    end
                end

                task.wait(0.5)
            end
        end)
    end
})

EventTab:AddButton({
    Title = "Open Honey Shop UI",
    Description = "CLICK THIS IF YOU'LL GONNA CLOSE THE HONEY SHOP UI",
    Callback = function()
        local ui = game:GetService("Players").LocalPlayer.PlayerGui.HoneyEventShop_UI
        if ui then
            ui.Enabled = not ui.Enabled
            print("Honey Shop UI:", ui.Enabled and "Ativada" or "Desativada")
        end
    end
})

local byallBee = { "Flower Seed Pack", "Nectarine", "Hive Fruit", "Honey Sprinkler", "Bee Egg", "Bee Crate", "Honey Comb", "Bee Chair", "Honey Torch", "Honey Walkway" }
local buyBee = game:GetService("ReplicatedStorage").GameEvents.BuyEventShopStock
local selectedBees = {}
local bsb = false

function byallbeefc()
    for i = 1, 25 do
        for _, bee in ipairs(selectedBees) do
            local args = {
                [1] = bee
            }
            game:GetService("ReplicatedStorage").GameEvents.BuyEventShopStock:FireServer(unpack(args))
            task.wait()
        end
    end
end

local section = EventTab:AddSection("Bee Shop")

local dropdownBee = EventTab:AddDropdown("DropdownSeed", {
    Title = "Select Items in Bee Shop",
    Description = "",
    Values = byallBee,
    Multi = true,
    Default = {},
})

dropdownBee:OnChanged(function(Value)
    selectedBees = {}
    for v, state in pairs(Value) do
        if state then
            table.insert(selectedBees, v)
        end
    end
end)

task.spawn(function()
    local lastMinute = -1
    while true do
        local minutos = os.date("*t").min
        if minutos ~= lastMinute then
            lastMinute = minutos

            if bsb then
                byallbeefc()
            end
        end
        task.wait(1)
    end
end)

EventTab:AddToggle("", {
    Title = "Buy Selected Item",
    Description = "Buys a selected bee item.",
    Default = false,
    Callback = function(Value)
        bsb = Value
    end
})
