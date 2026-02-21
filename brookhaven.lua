---- LINE: 3000+
---- LAST EDITED

print("Apex OT executed! expect 2s to load fully.")
print("Detecting the game...")
print("Game Detected! [ BROOKHAVEN RP ]")
print("Detecting your executor...")
print("...")
print("...")
print("...")
print("Executor has been detected! Go to Info Tab to see what executor are you using.")
print("Join: discord.gg/wDMPK3QAmY")
print("Found some bugs? Just reset your character or report it to our community server.")

-- Services / Service nganiiii~
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local lp = Players.LocalPlayer


-- Function that creates the loading screen and returns a promise
local function createLoadingScreen()
    local promise = {}
    promise.completed = false
    promise.connection = nil
    
    -- Remove GUI antiga se existir
    pcall(function()
        if CoreGui:FindFirstChild("LoadingScreen") then
            CoreGui.LoadingScreen:Destroy()
        end
    end)

    -- Cria a UI de carregamento
    local gui = Instance.new("ScreenGui")
    gui.Name = "LoadingScreen"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = CoreGui
    pcall(function() syn.protect_gui(gui) end)

    local frame = Instance.new("Frame")
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Parent = gui

    local image = Instance.new("ImageLabel")
    image.Size = UDim2.new(0, 300, 0, 300)
    image.Position = UDim2.new(0.5, -150, 0.35, -150)
    image.BackgroundTransparency = 1
    image.Image = "rbxassetid://93787935669608"
    image.Parent = frame

    local nameText = Instance.new("TextLabel")
    nameText.Size = UDim2.new(1, 0, 0, 40)
    nameText.Position = UDim2.new(0, 0, 0.65, 0)
    nameText.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameText.TextStrokeTransparency = 0.3
    nameText.BackgroundTransparency = 1
    nameText.Font = Enum.Font.FredokaOne
    nameText.TextScaled = true
    nameText.Text = "VERIFYING: "..lp.Name.." | LOADING..."
    nameText.Parent = frame

    local barBG = Instance.new("Frame")
    barBG.Size = UDim2.new(0.6, 0, 0.03, 0)
    barBG.Position = UDim2.new(0.2, 0, 0.8, 0)
    barBG.BackgroundColor3 = Color3.new(1, 1, 1)
    barBG.BorderSizePixel = 0
    barBG.Parent = frame

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.new(0.7, 0.2, 0.6)
    bar.BorderSizePixel = 0
    bar.Parent = barBG

    -- Animação da barra de carregamento
    local tween = TweenService:Create(
        bar,
        TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(1, 0, 1, 0)}
    )
    tween:Play()

    -- Função para limpar a UI
    local function cleanup()
        if gui then
            gui:Destroy()
        end
        if promise.connection then
            promise.connection:Disconnect()
        end
    end

    -- Após a barra carregar, faz o fade out e destrói a UI
    promise.connection = tween.Completed:Connect(function()
        -- Fade out suave da UI
        TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        TweenService:Create(barBG, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        TweenService:Create(bar, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        TweenService:Create(image, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        TweenService:Create(nameText, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        
        -- Aguarda o fade out terminar
        task.delay(1.2, function()
            -- Toca som de conclusão
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://8486683243"
            sound.Volume = 0.5
            sound.PlayOnRemove = true
            sound.Parent = workspace
            sound:Destroy()
            
            -- Exibe a notificação de boas-vindas
            StarterGui:SetCore("SendNotification", {
                Title = "APEX ON TOP",
                Text = "Welcome to APEX OT! ",
                Duration = 5
            })
            
            -- Marca como concluído e limpa
            promise.completed = true
            cleanup()
        end)
    end)
    
    return promise
end

-- Função para esperar até que a promise seja resolvida
local function waitForPromise(promise)
    while not promise.completed do
        task.wait()
    end
end

-- Uso:
local loadingPromise = createLoadingScreen()

-- Aqui você coloca o código que deve esperar até que o loading termine
waitForPromise(loadingPromise)

-- SEU CÓDIGO ABAIXO AQUI
print("----------------------------------------------------------")
print("Loading complete! Now running the script...")
print("Loaded successfully! Enjoy using our script!")

-- ... resto do seu código ...

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo170/ui_source/refs/heads/main/redzhub.ui.luau"))()

local Window = redzlib:MakeWindow({
    Title = "APEX OT | BROOKHAVEN RP",
    SubTitle = "by Kai and Apex Team ",
    SaveFolder = ""
  })

  Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://73830511104990", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

----------------- THEME ----------------


-------------------- LOCAL TABS ------------------
local Tab1 = Window:MakeTab({"Info", "info"})
local Tab15 = Window:MakeTab({"Server", "box"})
local Tab14 = Window:MakeTab({"Updates", "hammer"})
local Tab2= Window:MakeTab({"Player", "user"})
local Tab3 = Window:MakeTab({"Avatar", "shirt"})
local Tab4 = Window:MakeTab({"House", "Home"})
local Tab5 = Window:MakeTab({"Car", "Car"})
local Tab12 = Window:MakeTab({"Teleport", "locate"})
local Tab6 = Window:MakeTab({"RGB", "brush"})
local Tab13 = Window:MakeTab({"Visual", "star"})
local Tab7 = Window:MakeTab({"Music", "music"})    
--local Tab8 = Window:MakeTab({"Music", "music"}) 
local Tab9 = Window:MakeTab({"Troll", "skull"}) 
local Tab10 = Window:MakeTab({"Empty", "window"})
local Tab11 = Window:MakeTab({"More Scripts", "scroll"})

-------- TAB SUMMARY ------------
--[[
Tab1 = Info
Tab2 = Player
Tab3 = Avatar 
Tab4 = House
Tab5 = Car
Tab6 = RGB
Tab7 = Custom Music
Tab8 = Music
Tab9 = Troll
Tab10 = Lag Server
Tab11 = More Scripts 
Tab12 = Teleport
Tab13 = Visual
Tab14 = Updates Log
Tab15 = Server

]]


--------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 1: credits === --
---------------------------------------------------------------------------------------------------------------------------------
Tab1:AddSection({"APEX TEAM"})

Tab1:AddDiscordInvite({
    Name = "APEX OT | COMMUNITY",
    Description = "Join to our discord community for more updates!",
    Logo = "",
    Invite = "https://discord.gg/VrJx432MB5",
		print("discord invite copied successfully.")
})

Tab1:AddSection({"KAI TEAM"})

Tab1:AddDiscordInvite({
    Name = "KAI HUB | COMMUNITY",
    Description = "Join to Kai Hub Community!",
    Logo = "",
    Invite = "https://discord.gg/wDMPK3QAmY",
		print("discord invite copied successfully.")
})
  
Tab1:AddSection({"Executor Info"})
local function detectExecutor()
    if identifyexecutor then
        return identifyexecutor()
    elseif syn then
        return "Synapse X"
    elseif KRNL_LOADED then
        return "KRNL"
    elseif is_sirhurt_closure then
        return "SirHurt"
    elseif pebc_execute then
        return "ProtoSmasher"
    elseif getexecutorname then
        return getexecutorname()
    else
        return "Executor Unknown"
    end
end

local executorName = detectExecutor()

local Paragraph = Tab1:AddParagraph({"💻 Executor", executorName})

local Section = Tab1:AddSection({"APEX OT: version 1.2"})

local Paragraph = Tab1:AddParagraph({"🔨 Developer", "Takgoo \n APEX TEAM"})

  
 --[[ Tab1:AddButton({
    Name = " - Copiar @ do TikTok",
    Callback = function()
      setclipboard("@lolytauwu") -- Copia o @
      setclipboard("https://www.tiktok.com/@lolytauwu?_t=ZM-8wFjhRHkmOd&_r=1") -- Copia o link também, se quiser só o @, remova esta linha
      
    end
  })
]]

-----------------------------------------------
                     -- === Tab 2(15) === --
-------------------------------------------------
Tab15:AddSection({"Server Information"})
Tab15:AddParagraph({"Server Job Id", game.JobId ~= "" and game.JobId or "Job ID not available."})
Tab15:AddButton({
	Name = "Copy Job Id",
	Callback = function()
        if tick() - lastCopyTime >= copyCooldown then
            lastCopyTime = tick()
            setclipboard(tostring(game.JobId))
            print("JobId Copied!")
        else
            print("Please try again in a moment!")
	
        end
    end
})
Tab15:AddSection({"Server Menu [ SNEAK PEAK ]"})
Tab15:AddTextBox({
	Name = "Job Id Input",
	PlaceholderText = "Input",
	Callback = function(Value)
         getgenv().Job = Value
		end
	})
Tab15:AddButton({
	Name = "Join Server", 	
	Callback = function()
        if tick() - lastTeleportTime >= teleportCooldown then
            lastTeleportTime = tick()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, getgenv().Job, game.Players.LocalPlayer)        
        end
		end
	})

Tab15:AddButton({
	Name = "Server Hop",
	Callback = function()
		Hop()
	end
	})
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end        
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end        
        local num = 0
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)            
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait(0.1)
                    pcall(function()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(1)
                    break
                end
            end
        end
    end
    function Teleport() 
        while true do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
            wait(2)
        end
    end
    Teleport()
end
Tab15:AddButton({
    Name = "Rejoin [ BETA ]",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

 ---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 2: Fun === --
-----------------------------------------------------------------------------------------------------------------------------------



local Section = Tab2:AddSection({"Player"})


local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local selectedPlayerName = nil
local headsitActive = false

local function headsitOnPlayer(targetPlayer)
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then
        warn("Headless target player or character.")
        return false
    end
    local targetHead = targetPlayer.Character.Head
    local localRoot = character:FindFirstChild("HumanoidRootPart")
    if not localRoot then
        warn("Your character does not have HumanoidRootPart.")
        return false
    end

    localRoot.CFrame = targetHead.CFrame * CFrame.new(0, 2.2, 0)

    for _, v in pairs(localRoot:GetChildren()) do
        if v:IsA("WeldConstraint") then
            v:Destroy()
        end
    end

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = localRoot
    weld.Part1 = targetHead
    weld.Parent = localRoot

    if humanoid then
        humanoid.Sit = true
    end

    print("Headsit activated " .. targetPlayer.Name)
    return true
end

local function removeHeadsit()
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local localRoot = character:FindFirstChild("HumanoidRootPart")
    if localRoot then
        for _, v in pairs(localRoot:GetChildren()) do
            if v:IsA("WeldConstraint") then
                v:Destroy()
            end
        end
    end
    if humanoid then
        humanoid.Sit = false
    end

    print("Headsit deactivated")
end

-- Função para encontrar jogador por nome parcial
local function findPlayerByPartialName(partial)
    partial = partial:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Name:lower():sub(1, #partial) == partial then
            return player
        end
    end
    return nil
end

-- Notificação com imagem do jogador
local function notifyPlayerSelected(player)
    local StarterGui = game:GetService("StarterGui")
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, _ = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)

    StarterGui:SetCore("SendNotification", {
        Title = "Selected Player",
        Text = player.Name .. " was selected!",
        Icon = content,
        Duration = 5
    })
end

-- TextBox para digitar nome do player
Tab2:AddTextBox({
    Name = "Player Name",
    Description = "",
    PlaceholderText = "ex: yourname123",
    Callback = function(Value)
        local foundPlayer = findPlayerByPartialName(Value)
        if foundPlayer then
            selectedPlayerName = foundPlayer.Name
            notifyPlayerSelected(foundPlayer)
        else
            warn("No player found with that name.")
        end
    end
})

-- Botão para ativar/desativar headsit
-- Botão para ativar/desativar headsit (versão simplificada)
Tab2:AddButton({"Activate Headsit", function()
    if not selectedPlayerName then
    
        return
    end

    if not headsitActive then
        local target = Players:FindFirstChild(selectedPlayerName)
        if target and headsitOnPlayer(target) then
            headsitActive = true
        end
    else
        removeHeadsit()
        headsitActive = false
    end
end})



Tab2:AddSection({"Movement"})
Tab2:AddSlider({
    Name = "Walkspeed",
    Increase = 1,
    MinValue = 16,
    MaxValue = 999,
    Default = 16,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end
 })
 
 Tab2:AddSlider({
    Name = "Jump Power",
    Increase = 1,
    MinValue = 50,
    MaxValue = 500,
    Default = 50,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if humanoid then
            humanoid.JumpPower = Value
        end
    end
 })
 
 Tab2:AddSlider({
    Name = "Gravity",
    Increase = 1,
    MinValue = 0,
    MaxValue = 10000,
    Default = 196.2,
    Callback = function(Value)
        game.Workspace.Gravity = Value
    end
 })
 
 local InfiniteJumpEnabled = false
 
 game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
       local character = game.Players.LocalPlayer.Character
       if character and character:FindFirstChild("Humanoid") then
          character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
       end
    end
 end)

 Tab2:AddButton({
    Name = "Reset Movement Settings",
    Description = "Resets back your Walkspeed, Jump Power, Gravity to default.",
    Callback = function()
        -- Resetar Speed
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16 -- Valor padrão do Speed
            humanoid.JumpPower = 50 -- Valor padrão do JumpPower
        end
        
        -- Resetar Gravity
        game.Workspace.Gravity = 196.2 -- Valor padrão da gravidade
        
        -- Desativar Infinite Jump
        InfiniteJumpEnabled = false
    end
})
 
 Tab2:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
       InfiniteJumpEnabled = Value
    end
 })

 local UltimateNoclip = {
    Enabled = false,
    Connections = {},
    SoccerBalls = {}
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- Função para controle de colisões do jogador
local function managePlayerCollisions(character)
    if not character then return end
    
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not UltimateNoclip.Enabled
            part.Anchored = false
        end
    end
end

-- Sistema anti-void melhorado
local function voidProtection(rootPart)
    if rootPart.Position.Y < -500 then
        local safeCFrame = CFrame.new(0, 100, 0)
        local rayParams = RaycastParams.new()
        rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
        
        local result = Workspace:Raycast(rootPart.Position, Vector3.new(0, 500, 0), rayParams)
        rootPart.CFrame = result and CFrame.new(result.Position + Vector3.new(0, 5, 0)) or safeCFrame
    end
end

-- Controle das bolas de futebol
local function manageSoccerBalls()
    local soccerFolder = Workspace:FindFirstChild("Com", true)
                      and Workspace.Com:FindFirstChild("001_SoccerBalls")
    
    if soccerFolder then
        -- Atualiza bolas existentes
        for _, ball in ipairs(soccerFolder:GetChildren()) do
            if ball.Name:match("^Soccer") then
                pcall(function()
                    ball.CanCollide = not UltimateNoclip.Enabled
                    ball.Anchored = UltimateNoclip.Enabled
                end)
                UltimateNoclip.SoccerBalls[ball] = true
            end
        end
        
        -- Monitora novas bolas
        if not UltimateNoclip.Connections.BallAdded then
            UltimateNoclip.Connections.BallAdded = soccerFolder.ChildAdded:Connect(function(ball)
                if ball.Name:match("^Soccer") then
                    task.wait(0.3)
                    pcall(function()
                        ball.CanCollide = not UltimateNoclip.Enabled
                        ball.Anchored = UltimateNoclip.Enabled
                    end)
                end
            end)
        end
    end
end

-- Loop principal do sistema
local function mainLoop()
    UltimateNoclip.Connections.Heartbeat = RunService.Heartbeat:Connect(function()
        local character = LocalPlayer.Character
        
        -- Controle do jogador
        if character then
            managePlayerCollisions(character)
            
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                voidProtection(rootPart)
            end
        end
        
        -- Atualiza bolas a cada 2 segundos
        if tick() % 2 < 0.1 then
            manageSoccerBalls()
        end
    end)
end

-- Configuração do toggle
local NoclipToggle = Tab2:AddToggle({
    Name = "No Clip",
    Description = "",
    Default = false
})

NoclipToggle:Callback(function(state)
    UltimateNoclip.Enabled = state
    
    if state then
        -- Inicia sistemas
        mainLoop()
        manageSoccerBalls()
        
        -- Configura respawn
        UltimateNoclip.Connections.CharAdded = LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.5)
            managePlayerCollisions(LocalPlayer.Character)
        end)
    else
        -- Desativa tudo
        for _, conn in pairs(UltimateNoclip.Connections) do
            conn:Disconnect()
        end
        
        -- Restaura colisões
        if LocalPlayer.Character then
            managePlayerCollisions(LocalPlayer.Character)
        end
        
        -- Restaura bolas
        for ball in pairs(UltimateNoclip.SoccerBalls) do
            if ball.Parent then
                pcall(function()
                    ball.CanCollide = true
                    ball.Anchored = false
                end)
            end
        end
    end
end)
-------------------------------------------------------------------------------
-- Toggle para Anti-Sit
local antiSitConnection = nil
local antiSitEnabled = false

Tab2:AddToggle({
    Name = "Anti-Sit",
    Description = "Prevents the player from sitting down",
    Default = false,
    Callback = function(state)
        antiSitEnabled = state
        local LocalPlayer = game:GetService("Players").LocalPlayer

        if state then
            local function applyAntiSit(character)
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Sit = false
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if antiSitConnection then
                        antiSitConnection:Disconnect()
                    end
                    antiSitConnection = humanoid.Seated:Connect(function(isSeated)
                        if isSeated then
                            humanoid.Sit = false
                            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                        end
                    end)
                end
            end

            if LocalPlayer.Character then
                applyAntiSit(LocalPlayer.Character)
            end

            local characterAddedConnection
            characterAddedConnection = LocalPlayer.CharacterAdded:Connect(function(character)
                if not antiSitEnabled then
                    characterAddedConnection:Disconnect()
                    return
                end
                local humanoid = character:WaitForChild("Humanoid", 5)
                if humanoid then
                    applyAntiSit(character)
                end
            end)
        else
            if antiSitConnection then
                antiSitConnection:Disconnect()
                antiSitConnection = nil
            end

            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end
        end
    end
})

-- Serviços
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Variáveis
local billboardGuis = {}
local connections = {}
local espEnabled = false
local selectedColor = "RGB Suave"

-- Botão para Fly GUI
Tab2:AddButton({
    Name = "Fly",
    Description = "Loads a universal fly GUI",
    Callback = function()
        local success, _ = pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-gui-v3-30439"))()
        end)

        game.StarterGui:SetCore("SendNotification", {
            Title = success and "Success!" or "Error!",
            Text = success and "Fly GUI Loaded!" or "Fly GUI can't be loaded.",
            Duration = 5
        })
    end
})

Tab2:AddSection({"Spam Chat"})
local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration and tcs.ChatInputBarConfiguration.TargetTextChannel

function sendchat(msg)
    if not msg or msg == "" then return end
    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
        end)
        if not success then
            warn("Error sending chat: " .. err)
        end
    elseif chat then
        local success, err = pcall(function()
            chat:SendAsync(msg)
        end)
        if not success then
            warn("Error sending chat: " .. err)
        end
    end
end

Tab2:AddParagraph({"❗NOTICE!", "In order to use this functions, your account must be verified in Roblox Chat!"})
Tab2:AddTextBox({
    Name = "Enter Text",
    PlaceholderText = "ex: Spammm!",
    Callback = function(text)
        TextSave = text
    end
})

Tab2:AddButton({
    Name = "Send Chat",
    Callback = function()
        sendchat(TextSave)
    end
})

getgenv().ChaosHubEnviarDelay = 1

Tab2:AddSlider({
    Name = "Spam Chat Delay",
    Min = 0.4,
    Max = 10,
    Default = 1,
    Increment = 0.1,
    Callback = function(Value)
        getgenv().ChaosHubEnviarDelay = Value
    end
})

Tab2:AddToggle({
    Name = "Spam Chat",
    Default = false,
    Flag = "Spawn de textos",
    Callback = function(Value)
        getgenv().ChaosHubSpawnText = Value
        while getgenv().ChaosHubSpawnText do
            sendchat(TextSave)
            task.wait(getgenv().ChaosHubEnviarDelay)
        end
    end
})

Tab2:AddButton({
    Name = "Spam Chat V2",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rServer: Error")
        else 
            print("Spam Chat has been spammed!")
    end
end
})

Tab2:AddButton({
    Name = "Clear Chat",
    Callback = function()
        if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rServer: Chat Cleared")
        else 
            print("Chat has been cleared!")
    end
end
})

local Section = Tab2:AddSection({"ESP"})


-- Dropdown de cor
Tab2:AddDropdown({
    Name = "ESP Color",
    Default = "RGB ",
    Options = {
        "RGB", "White", "Black", "Red",
        "Green", "Blue", "Yellow", "Rose", "Purple"
    },
    Callback = function(value)
        selectedColor = value
    end
})

-- Função para obter a cor
local function getESPColor()
    if selectedColor == "RGB" then
        local h = (tick() % 5) / 5
        return Color3.fromHSV(h, 1, 1)
    elseif selectedColor == "Black" then
        return Color3.fromRGB(0, 0, 0)
    elseif selectedColor == "White" then
        return Color3.fromRGB(255, 255, 255)
    elseif selectedColor == "Red" then
        return Color3.fromRGB(255, 0, 0)
    elseif selectedColor == "Green" then
        return Color3.fromRGB(0, 255, 0)
    elseif selectedColor == "Blue" then
        return Color3.fromRGB(0, 170, 255)
    elseif selectedColor == "Yellow" then
        return Color3.fromRGB(255, 255, 0)
    elseif selectedColor == "Rose" then
        return Color3.fromRGB(255, 105, 180)
    elseif selectedColor == "Purple" then
        return Color3.fromRGB(128, 0, 128)
    end
    return Color3.new(1, 1, 1)
end

-- Função para criar o ESP
local function updateESP(player)
    if player == Players.LocalPlayer then return end
    if not espEnabled then return end

    local character = player.Character
    if character then
        local head = character:FindFirstChild("Head")
        if head then
            if billboardGuis[player] then
                billboardGuis[player]:Destroy()
            end

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP_Billboard"
            billboard.Parent = head
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true

            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "TextLabel"
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextStrokeTransparency = 0.5
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 12
            textLabel.Text = player.Name .. " | " .. player.AccountAge .. " days"
            textLabel.TextColor3 = getESPColor()

            billboardGuis[player] = billboard
        end
    end
end

-- Função para remover o ESP
local function removeESP(player)
    if billboardGuis[player] then
        billboardGuis[player]:Destroy()
        billboardGuis[player] = nil
    end
end

-- Toggle de ativação do ESP
local Toggle1 = Tab2:AddToggle({
    Name = "Activate ESP",
    Description = "Shows the players current position and account info.",
    Default = false
})
Toggle1:Callback(function(value)
    espEnabled = value

    if espEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            updateESP(player)
        end

        local updateConnection = RunService.Heartbeat:Connect(function()
            for _, player in pairs(Players:GetPlayers()) do
                updateESP(player)
            end
            if selectedColor == "RGB" then
                for _, player in pairs(Players:GetPlayers()) do
                    local gui = billboardGuis[player]
                    if gui and gui:FindFirstChild("TextLabel") then
                        gui.TextLabel.TextColor3 = getESPColor()
                    end
                end
            end
        end)
        table.insert(connections, updateConnection)

        local playerAdded = Players.PlayerAdded:Connect(function(player)
            updateESP(player)
            local charConn = player.CharacterAdded:Connect(function()
                updateESP(player)
            end)
            table.insert(connections, charConn)
        end)
        table.insert(connections, playerAdded)

        local playerRemoving = Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end)
        table.insert(connections, playerRemoving)

    else
        for _, player in pairs(Players:GetPlayers()) do
            removeESP(player)
        end
        for _, conn in pairs(connections) do
            conn:Disconnect()
        end
        connections = {}
        billboardGuis = {}
    end
end)

----------------------------------------------------------------------------------------------------------------------------------
                                                         -- Tab3:  Avatar Editor--
----------------------------------------------------------------------------------------------------------------------------------

local Section = Tab3:AddSection({"Copy Avatar"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local valor_do_nome_do_joagdor
local Target = nil

local function GetPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local Dropdown = Tab3:AddDropdown({
    Name = "Player List",
    Description = "",
    Options = GetPlayerNames(),
    Default = "",
    Flag = "player list",
    Callback = function(playername)
        valor_do_nome_do_joagdor = playername
        Target = playername -- Conectar o dropdown ao Copy Avatar
    end
})

local function UptadePlayers()
    Dropdown:Set(GetPlayerNames())
end

UptadePlayers()

Tab3:AddButton({"Update Player's List", function()
    UptadePlayers()
end})

Players.PlayerAdded:Connect(UptadePlayers)
Players.PlayerRemoving:Connect(UptadePlayers)

Tab3:AddButton({
    Name = "Copy Avatar [BETA]",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                -- RESETAR LOCALPLAYER
                local LDesc = LHumanoid:GetAppliedDescription()

                -- Remover acessórios, roupas e face atuais
                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                -- Enviar partes do corpo
                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                -- Nome, bio e cor
                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})

------------------------------------------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"3D Clothing"})


local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Namespace para evitar conflitos
local AvatarManager = {}
AvatarManager.ReplicatedStorage = ReplicatedStorage

-- Função para exibir notificação
function AvatarManager:MostrarNotificacao(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Notice",
            Text = mensagem,
            Duration = 5
        })
    end)
end

-- Tabela de avatares
AvatarManager.Avatares = {
    { Nome = "Manga Cat", ID = 124948425515124 },
    { Nome = "Tung Tung Sahur", ID = 117098257036480 },
    { Nome = "Tralalelo Tralala", ID = 99459753608381 },
    { Nome = "Ballerina Cappuccina", ID = 72961448671499 },
    { Nome = "Mini Potato", ID = 108351763963304 },
    { Nome = "Mini Pizza", ID = 1624395 },
    { Nome = "Monstro S.A", ID = 123609977175226 },
    { Nome = "Trenzinho", ID = 80468697076178 },
    { Nome = "Dino", ID = 11941741105 },
    { Nome = "Pou", ID = 15742966010  },
    { Nome = "Coco/boxt@", ID = 77013984520332  },
    { Nome = "Coelho", ID = 71797333686800  },
    { Nome = "Hipopótamo", ID = 73215892129281 },
    { Nome = "Ratatuli", ID = 108557570415453 },
    { Nome = "Hen", ID = 71251793812515 },
    { Nome = "Peppa pig", ID = 92979204778377 },
    { Nome = "Penguin", ID = 94944293759578 },
    { Nome = "Sid", ID = 87442757321244 },
    { Nome = "Big Puga", ID = 111436158728716 },
    { Nome = "SHREK CURSED", ID = 120960401202173 },
    { Nome = "Big Mosquito", ID = 108052868536435 },
    { Nome = "Noob Reversed", ID = 106596990206151 },
    { Nome = "Duck", ID = 135132836238349 },
    { Nome = "Cachorro Chihuahua", ID = 18656467256 },
    { Nome = "Cat v1", ID = 18994959003 },
    { Nome = "Cat v2 ", ID = 77506186615650 },
    { Nome = "Impostor", ID = 18234669337 },
    { Nome = "Simon yellow", ID = 75183593514657 },
    { Nome = "Simon blue", ID = 76155710249925 }
}
-- Function to get avatar names for dropdown
function AvatarManager:GetAvatarNames()
    local nomes = {}
    for _, avatar in ipairs(self.Avatares) do
        table.insert(nomes, avatar.Nome)
    end
    return nomes
end

-- Function to equip the avatar
function AvatarManager:EquiparAvatar(avatarName)
    for _, avatar in ipairs(self.Avatares) do
        if avatar.Nome == avatarName then
            local args = { avatar.ID }
            local success, result = pcall(function()
                return self.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
            end)
            if success then
                self:MostrarNotificacao("Avatar " .. avatarName .. " equipped successfully!")
            else
                self:MostrarNotificacao("Failed to equip avatar " .. avatarName .. "!")
            end
            return
        end
    end
    self:MostrarNotificacao("Avatar " .. avatarName .. " not found!")
end

-- Tab3:  Avatar Option
-- Dropdown for avatars
local AvatarDropdown = Tab3:AddDropdown({
    Name = "3D Accessories",
    Description = "Select to equip",
    Default = nil,
    Options = AvatarManager:GetAvatarNames(),
    Callback = function(avatarSelecionado)
        _G.SelectedAvatar = avatarSelecionado
    end
})

-- Botão para equipar avatar
Tab3:AddButton({
    Name = "Equip 3D Accessory",
    Description = "Equip selected accessory",
    Callback = function()
        if not _G.SelectedAvatar or _G.SelectedAvatar == "" then
            AvatarManager:MostrarNotificacao("Nenhum avatar selecionado!")
            return
        end
        AvatarManager:EquiparAvatar(_G.SelectedAvatar)
    end
})

-------------------------------------------------------------------------------------------------------------------------
local Section = Tab3:AddSection({"Avatar Editor"})
-- Botão para equipar partes do corpo

Tab3:AddParagraph({
    Title = "⚠️ WARNING! THIS WILL RESET YOUR AVATAR!!",
    Content = ""
})

Tab3:AddButton({
	Name = "Mini Pizza",
	Callback = function()
	local args = {
	  {
		120556508760512, -- Right Leg
		92371100239477,  -- Left Leg
		93120543600736,  -- Right Arm
		136851648817779, -- Left Arm
		123914106816549, -- Torso
		138263644378487  -- Head
				}
			}
	game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("All body parts equipped!")
    end
	})
-- Cria um botão para equipar todas as partes do corpo
Tab3:AddButton({
    Name = "Mini REPO",
    Callback = function()
        local args = {
            {
                117101023704825, -- Right Leg
                125767940563838,  -- Left Leg
                137301494386930,  -- Right Arm
                87357384184710,  --  Left Arm
                133391239416999, -- Torso
                111818794467824   -- Head
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("All body parts equipped!")
    end
})

---------------------------------------------------------------------------------------------------

Tab3:AddButton({
    Name = "Mini Stallion",
    Callback = function()
        local args = {
            {
                124355047456535, -- Right Leg
                120507500641962,  -- Left Leg
                82273782655463,  -- Braço Direito
                113625313757230,  -- Braço Esquerdo
                109182039511426, -- Torso
                0   -- Head
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("All body parts equipped!")
    end
})

---------------------------------------------------------------------------------------------------

Tab3:AddButton({
    Name = "Stick",
    Callback = function()
        local args = {
            {
                14731384498, -- Perna Direita
                14731377938,  -- Perna Esquerda
                14731377894,  -- Braço Direito
                14731377875,  -- Braço Esquerdo
                14731377941, -- Torso
                14731382899   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("All body parts equipped!")
    end
})

---------------------------------------------------------------------------------------------------

Tab3:AddButton({
    Name = "Chunky-Bug",
    Callback = function()
        local args = {
            {
                15527827600, -- Perna Direita
                15527827578,  -- Perna Esquerda
                15527831669,  -- Braço Direito
                15527836067,  -- Braço Esquerdo
                15527827184, -- Torso
                15527827599   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("Todas as partes do corpo equipadas!")
    end
})

---------------------------------------------------------------------------------------------------

Tab3:AddButton({
    Name = "Cursed-Spider",
    Callback = function()
        local args = {
            {
                134555168634906, -- Perna Direita
                100269043793774,  -- Perna Esquerda
                125607053187319,  -- Braço Direito
                122504853343598,  -- Braço Esquerdo
                95907982259204, -- Torso
                91289185840375   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("All body parts equipped!")
    end
})

---------------------------------------------------------------------------------------------------

Tab3:AddButton({
    Name = "Possessed-Horror",
    Callback = function()
        local args = {
            {
                122800511983371, -- Perna Direita
                132465361516275,  -- Perna Esquerda
                125155800236527,  -- Braço Direito
                83070163355072,  -- Braço Esquerdo
                102906187256945, -- Torso
                78311422507297   -- Cabeça
            }
        }
        game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("ChangeCharacterBody")
            :InvokeServer(unpack(args))
        print("All body parts equipped!")
    end
})

Tab3:AddParagraph({
    Title = "MORE FUN FUNCTION NEXT UPDATE!",
    Content = "TINATAMAD NA KASI AKO — DEVELOPER"
})

---------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab4: House === --
---------------------------------------------------------------------------------------------------------------------------------

-- Variáveis globais
local isUnbanActive = false
local SelectHouse = nil
local NoclipDoor = nil

-- Função para obter lista de casas
local function getHouseList()
    local Tabela = {}
    local lots = workspace:FindFirstChild("001_Lots")
    if lots then
        for _, House in ipairs(lots:GetChildren()) do
            if House.Name ~= "For Sale" and House:IsA("Model") then
                table.insert(Tabela, House.Name)
            end
        end
    end
    return Tabela
end

-- Dropdown para selecionar casas
pcall(function()
    Tab4:AddDropdown({
        Name = "Select Players' House",
        Options = getHouseList(),
        Default = "...",
        Callback = function(Value)
            SelectHouse = Value
            if NoclipDoor then
                NoclipDoor:Set(false)
            end
            print("House Selected: " .. tostring(Value))
        end
    })
end)

-- Função para atualizar a lista de casas
local function DropdownHouseUpdate()
    local Tabela = getHouseList()
    print("DropdownHouseUpdate called. Houses found:", #Tabela)
    pcall(function()
        Tab4:ClearDropdown("Select House") -- Try clearing dropdown if supported
        Tab4:AddDropdown({
            Name = "Select House",
            Options = Tabela,
            Default = "...",
            Callback = function(Value)
                SelectHouse = Value
                if NoclipDoor then
                    NoclipDoor:Set(false)
                end
            end
        })
    end)
end

-- Inicializar dropdown
pcall(DropdownHouseUpdate)

-- Botão para atualizar lista de casas
pcall(function()
    Tab4:AddButton({
        Name = "Update House List",
        Callback = function()
            print("House list are now updated! Live houses will be shown in the dropdown list. UYYYY PHILIPPINES!")
            pcall(DropdownHouseUpdate)
        end
    })
end)

-- Botão para teleportar para casa
pcall(function()
    Tab4:AddButton({
        Name = "Teleport to House",
	Description = "Teleports to selected house.",
        Callback = function()
            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
            if House and game.Players.LocalPlayer.Character then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(House.WorldPivot.Position)
            else
                print("Casa não encontrada: " .. tostring(SelectHouse))
            end
        end
    })
end)

Tab4:AddSection({"Troll Houses"})
Tab4:AddParagraph({"⚠️ If bugs occurs, please reset your character.", "if bugs isn't able to be fixed by resetting character, try to report it on our community server."
})

-- Botão para remover ban de todas as casas
Tab4:AddButton({
    Name = "Remove Ban House",
    Description = "Remove all bans on houses.",
    Callback = function()
        local successCount = 0
        local failCount = 0
        for i = 1, 37 do
            local bannedBlockName = "BannedBlock" .. i
            local bannedBlock = Workspace:FindFirstChild(bannedBlockName, true)
            if bannedBlock then
                local success, _ = pcall(function()
                    bannedBlock:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        for _, house in pairs(Workspace:GetDescendants()) do
            if house.Name:match("BannedBlock") then
                local success, _ = pcall(function()
                    house:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        if successCount > 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "SUCCESS!",
                Text = "Bans has been removed! " .. successCount .. " house!",
                Duration = 5
            })
        end
        if failCount > 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Failed!",
                Text = "Failed to remove bans from " .. failCount .. " house.",
                Duration = 5
            })
        end
        if successCount == 0 and failCount == 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Hey!",
                Text = "No ban house records found.",
                Duration = 5
            })
        end
    end
})

-- Toggle para Auto Unban
pcall(function()
    Tab4:AddToggle({
        Name = "Auto Unban Houses",
	Description = "⚠️ THIS IS CURRENTLY BUGGED AND NOT WORKING PROPERLY.",
        Default = false,
        Callback = function(state)
            isUnbanActive = state
            if isUnbanActive then
                print("Auto Unban Activated")
                spawn(startAutoUnban)
            else
                print("Auto Unban Deactivated")
            end
        end
    })
end)

function startAutoUnban()
    while isUnbanActive do
        pcall(function()
            for _, v in pairs(game:GetService("Workspace"):WaitForChild("001_Lots"):GetDescendants()) do
                if v.Name:match("^BannedBlock%d+$") then
                    v:Destroy()
                end
            end
        end)
        task.wait(1)
    end
end

Tab4:AddParagraph({"We recommend to turn on No Clip function in Player Movement Section.", "ONLY IF REMOVE BAN HOUSE IS NOT WORKING!"
})



---------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab 5: Car === --
---------------------------------------------------------------------------------------------------------------------------------

local Section = Tab5:AddSection({"All"})
Tab5:AddParagraph({"READ THIS!", "If the troll cars don't work, maybe someone is in the driver's seat of the car, which is why it doesn't work."})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Namespace para evitar conflitos
local TeleportCarro = {}
TeleportCarro.Players = Players
TeleportCarro.Workspace = Workspace
TeleportCarro.LocalPlayer = LocalPlayer
TeleportCarro.Camera = Camera

-- Função para exibir notificação
function TeleportCarro:MostrarNotificacao(mensagem)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "NOTICE!",
            Text = mensagem,
            Duration = 5
        })
    end)
end

-- Função para desativar/ativar dano de queda
function TeleportCarro:ToggleFallDamage(disable)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return false end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if disable then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
        return true
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        return false
    end
end

-- Função para teleportar o jogador para o assento do carro
function TeleportCarro:TeleportToSeat(seat, car)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
        self:MostrarNotificacao("Character not found!")
        return false
    end
    local humanoid = self.LocalPlayer.Character.Humanoid
    local rootPart = self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        self:MostrarNotificacao("Character root part not found!")
        return false
    end

    humanoid.Sit = false
    task.wait(0.1)

    rootPart.CFrame = seat.CFrame + Vector3.new(0, 5, 0)
    task.wait(0.1)

    seat:Sit(humanoid)
    task.wait(0.5)
    return humanoid.SeatPart == seat
end

-- Função para teleportar o carro para o void com delay
function TeleportCarro:TeleportToVoid(car)
    if not car then
        self:MostrarNotificacao("Invalid vehicle!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:MostrarNotificacao("Main part of vehicle not found!")
            return
        end
    end
    local voidPosition = Vector3.new(0, -1000, 0)
    car:SetPrimaryPartCFrame(CFrame.new(voidPosition))
    task.wait(0.5)
end

-- Função para teleportar o carro para a posição do jogador com delay
function TeleportCarro:TeleportToPlayer(car, playerPos)
    if not car then
        self:MostrarNotificacao("Invalid vehicle!")
        return
    end
    if not car.PrimaryPart then
        local body = car:FindFirstChild("Body", true) or car:FindFirstChild("Chassis", true)
        if body and body:IsA("BasePart") then
            car.PrimaryPart = body
        else
            self:MostrarNotificacao("Main part of vehicle not found!")
            return
        end
    end
    local targetPos = playerPos + Vector3.new(5, 0, 5)
    car:SetPrimaryPartCFrame(CFrame.new(targetPos))
    task.wait(0.5)
end

-- Função para sair do carro e voltar à posição original
function TeleportCarro:ExitCarAndReturn(originalPos)
    if not self.LocalPlayer.Character or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then return end
    local humanoid = self.LocalPlayer.Character.Humanoid
    if humanoid.SeatPart then
        humanoid.Sit = false
    end
    task.wait(0.1)
    if originalPos then
        self.LocalPlayer.Character:PivotTo(CFrame.new(originalPos))
    end
end

-- Função para atualizar a lista de carros no dropdown
function TeleportCarro:AtualizarListaCarros()
    local pastaVeiculos = self.Workspace:FindFirstChild("Vehicles")
    local listaCarros = {}
    
    if pastaVeiculos then
        for _, carro in ipairs(pastaVeiculos:GetChildren()) do
            if carro.Name:match("Car$") then
                table.insert(listaCarros, carro.Name)
            end
        end
    end
    
    return listaCarros
end

-- Parágrafo
--[[Tab5:AddParagraph({
    Title = "",
    Content = ""
})
]]
-- Toggle para matar todos os carros
Tab5:AddToggle({
    Name = "Troll All Cars",
    Description = "Teleports cars to the void",
    Default = false,
    Callback = function(state)
        local originalPosition
        local teleportActive = state
        local fallDamageDisabled = false

        if state then
            if self.LocalPlayer.Character and self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                originalPosition = self.LocalPlayer.Character.HumanoidRootPart.Position
            else
                TeleportCarro:MostrarNotificacao("Character not found!")
                return
            end

            fallDamageDisabled = TeleportCarro:ToggleFallDamage(true)

            spawn(function()
                local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
                if not vehiclesFolder then
                    TeleportCarro:MostrarNotificacao("Vehicle folder not found!")
                    return
                end

                local cars = {}
                for _, car in ipairs(vehiclesFolder:GetChildren()) do
                    if car.Name:match("Car$") then
                        table.insert(cars, car)
                    end
                end

                for _, car in ipairs(cars) do
                    if not teleportActive then break end

                    local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
                    if vehicleSeat and vehicleSeat.Occupant == nil then
                        local success = TeleportCarro:TeleportToSeat(vehicleSeat, car)
                        if success then
                            TeleportCarro:TeleportToVoid(car)
                            TeleportCarro:ExitCarAndReturn(originalPosition)
                            task.wait(1)
                        end
                    end
                end

                if teleportActive then
                    teleportActive = false
                    TeleportCarro:ToggleFallDamage(false)
                end
            end)
        else
            teleportActive = false
            TeleportCarro:ToggleFallDamage(false)
        end
    end
})

local Section = Tab5:AddSection({"Other Car Functions"})

-- Criar o dropdown
local Dropdown = Tab5:AddDropdown({
    Name = "Select Player's Car",
    Description = "Select a player's car",
    Default = nil,
    Options = TeleportCarro:AtualizarListaCarros(),
    Callback = function(carroSelecionado)
        _G.SelectedVehicle = carroSelecionado
    end
})

-- Toggle para ver a câmera do carro selecionado
Tab5:AddToggle({
    Name = "FOV of Selected Car",
    Description = "Focus the camera on the selected car.",
    Default = false,
    Callback = function(state)
        if state then
            if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
                TeleportCarro:MostrarNotificacao("No car selected!")
                return
            end

            local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
            if not vehiclesFolder then
                TeleportCarro:MostrarNotificacao("Vehicle folder not found!")
                return
            end

            local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
            if not vehicle then
                TeleportCarro:MostrarNotificacao("Selected car not found!")
                return
            end

            local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
            if not vehicleSeat then
                TeleportCarro:MostrarNotificacao("Car seat not found!")
                return
            end

            -- Salvar o estado original da câmera
            TeleportCarro.OriginalCameraSubject = TeleportCarro.Camera.CameraSubject
            TeleportCarro.OriginalCameraType = TeleportCarro.Camera.CameraType

            -- Ajustar a câmera para o assento do carro, mesmo se ocupado
            TeleportCarro.Camera.CameraSubject = vehicleSeat
            TeleportCarro.Camera.CameraType = Enum.CameraType.Follow
            TeleportCarro:MostrarNotificacao("Camera adjusted to the car " .. _G.SelectedVehicle .. "!")
        else
            -- Restaurar a câmera ao estado original
            if TeleportCarro.OriginalCameraSubject then
                TeleportCarro.Camera.CameraSubject = TeleportCarro.OriginalCameraSubject
                TeleportCarro.Camera.CameraType = TeleportCarro.OriginalCameraType or Enum.CameraType.Custom
                TeleportCarro:MostrarNotificacao("Camera restored to normal!")
                TeleportCarro.OriginalCameraSubject = nil
                TeleportCarro.OriginalCameraType = nil
            end
        end
    end
})

-- Atualizar o dropdown dinamicamente
TeleportCarro.Workspace:WaitForChild("Vehicles").ChildAdded:Connect(function()
    Dropdown:Set(TeleportCarro:AtualizarListaCarros())
end)
TeleportCarro.Workspace:WaitForChild("Vehicles").ChildRemoved:Connect(function()
    Dropdown:Set(TeleportCarro:AtualizarListaCarros())
end)

local Section = Tab5:AddSection({"Menu"})

-- Botão para destruir carro selecionado
Tab5:AddButton({
    Name = "Troll Selected Car",
    Description = "Teleports the selected car to the void",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            TeleportCarro:MostrarNotificacao("No car selected!")
            return
        end

        local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            TeleportCarro:MostrarNotificacao("Vehicle folder not found!")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            TeleportCarro:MostrarNotificacao("Selected car not found!")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            TeleportCarro:MostrarNotificacao("Car seat not found!")
            return
        end

        if vehicleSeat.Occupant then
            TeleportCarro:MostrarNotificacao("The kill car was not possible, there is someone sitting in the driver's seat!")
            return
        end

        local originalPos
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
            TeleportCarro:MostrarNotificacao("Player character not found!")
            return
        end

        local isFallDamageOff = TeleportCarro:ToggleFallDamage(true)
        local success = TeleportCarro:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            TeleportCarro:TeleportToVoid(vehicle)
            TeleportCarro:MostrarNotificacao("Car " .. _G.SelectedVehicle .. " was teleported to the void!")
            TeleportCarro:ExitCarAndReturn(originalPos)
        else
            TeleportCarro:MostrarNotificacao("Failed to sit in the car!")
        end
        TeleportCarro:ToggleFallDamage(false)
    end
})

-- Botão para trazer carro selecionado
Tab5:AddButton({
    Name = "Bring Selected Car",
    Description = "Teleports the selected car to your position",
    Callback = function()
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
            TeleportCarro:MostrarNotificacao("No car selected!")
            return
        end

        local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            TeleportCarro:MostrarNotificacao("Vehicle folder not found!")
            return
        end

        local vehicle = vehiclesFolder:FindFirstChild(_G.SelectedVehicle)
        if not vehicle then
            TeleportCarro:MostrarNotificacao("Selected car not found!")
            return
        end

        local vehicleSeat = vehicle:FindFirstChildWhichIsA("VehicleSeat", true)
        if not vehicleSeat then
            TeleportCarro:MostrarNotificacao("Car seat not found!")
            return
        end

        if vehicleSeat.Occupant then
            TeleportCarro:MostrarNotificacao("Car teleportation failed, there is someone sitting in the driver's seat!")
            return
        end

        local originalPos
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
            TeleportCarro:MostrarNotificacao("Player character not found!")
            return
        end

        local isFallDamageOff = TeleportCarro:ToggleFallDamage(true)
        local success = TeleportCarro:TeleportToSeat(vehicleSeat, vehicle)
        if success then
            TeleportCarro:TeleportToPlayer(vehicle, originalPos)
            TeleportCarro:MostrarNotificacao("Car " .. _G.SelectedVehicle .. " was teleported to you!")
            TeleportCarro:ExitCarAndReturn(originalPos)
        else
            TeleportCarro:MostrarNotificacao("Failed to sit in the car!")
        end
        TeleportCarro:ToggleFallDamage(false)
    end
})

-- Botão para trazer todos os carros
Tab5:AddButton({
    Name = "Bring All Cars",
    Description = "Teleports all cars on the server to your position",
    Callback = function()
        local originalPos
        if TeleportCarro.LocalPlayer.Character and TeleportCarro.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            originalPos = TeleportCarro.LocalPlayer.Character.HumanoidRootPart.Position
        else
            TeleportCarro:MostrarNotificacao("Player character not found!")
            return
        end

        local vehiclesFolder = TeleportCarro.Workspace:FindFirstChild("Vehicles")
        if not vehiclesFolder then
            TeleportCarro:MostrarNotificacao("Vehicle folder not found!")
            return
        end

        local isFallDamageOff = TeleportCarro:ToggleFallDamage(true)
        local cars = {}
        for _, car in ipairs(vehiclesFolder:GetChildren()) do
            if car.Name:match("Car$") then
                table.insert(cars, car)
            end
        end

        for _, car in ipairs(cars) do
            local vehicleSeat = car:FindFirstChildWhichIsA("VehicleSeat", true)
            if vehicleSeat and vehicleSeat.Occupant == nil then
                local success = TeleportCarro:TeleportToSeat(vehicleSeat, car)
                if success then
                    TeleportCarro:TeleportToPlayer(car, originalPos)
                    TeleportCarro:ExitCarAndReturn(originalPos)
                    TeleportCarro:MostrarNotificacao("Car " .. car.Name .. " was teleported to you!")
                    task.wait(1)
                else
                    TeleportCarro:MostrarNotificacao("Failed to sit in the car " .. car.Name .. "!")
                end
            else
                if vehicleSeat then
                    TeleportCarro:MostrarNotificacao("Car " .. car.Name .. " ignored: someone is in the driver's seat!")
                else
                    TeleportCarro:MostrarNotificacao("Car " .. car.Name .. " ignored: seat not found!")
                end
            end
        end

        TeleportCarro:ToggleFallDamage(false)
        if #cars == 0 then
            TeleportCarro:MostrarNotificacao("No car available to teleport!")
        end
    end
})

-- Manter o estado de dano de queda ao recarregar o personagem
local fallDamageDisabled = false
TeleportCarro.LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    if fallDamageDisabled then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid.PlatformStand = false
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
    end
end)

Tab5:AddSection({"Spawn Car"})
local carList = {
    "SchoolBus", "SmartCar", "FarmTruck", "Cadillac", "Excavator",
    "Jeep", "NascarTruck", "TowTruck", "Snowplow", "MilitaryTruck",
    "Tank", "Limo", "FireTruck"
}

local spamCarsActive = false

local function spawnCar(carName)
    local args = {
        [1] = "PickingCar",
        [2] = carName
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end

Tab5:AddToggle({
    Name = "Spam Cars",
    Description = "spawns a random car super fast",
    Default = false,
    Callback = function(state)
        spamCarsActive = state
        if spamCarsActive then
            task.spawn(function()
                while spamCarsActive do
                    for _, carName in ipairs(carList) do
                        if not spamCarsActive then break end
                        spawnCar(carName)
                        wait(0.4)
                    end
                end
            end)
        end
    end
})

---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 6: RGB === --
---------------------------------------------------------------------------------------------------------------------------------

local Section = Tab6:AddSection({"RGB"})




-- Velocidade controlada pelo slider (quanto maior, mais rápido)
local rgbSpeed = 1

Tab6:AddSlider({
    Name = "RGB Speed",
    Description = "Increase the speed of the RGB effect",
    Min = 1,
    Max = 5,
    Increase = 1,
    Default = 2,
    Callback = function(Value)
        rgbSpeed = Value
    end
})

-- Função para criar cor RGB suave com HSV
local function getRainbowColor(speedMultiplier)
    local h = (tick() * speedMultiplier % 5) / 5 -- gira o hue suavemente de 0 a 1
    return Color3.fromHSV(h, 1, 1)
end

-- Função para disparar eventos
local function fireServer(eventName, args)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
    if event and event:FindFirstChild(eventName) then
        pcall(function()
            event[eventName]:FireServer(unpack(args))
        end)
    end
end

local Section = Tab6:AddSection({"Avatar | RGB"})

-- Nome + Bio RGB  juntos
local nameBioRGBActive = false
Tab6:AddToggle({
    Name = "Avatar Name + Bio RGB",
    Description = "Enables RGB on Avatar Name & Bio",
    Default = false,
    Callback = function(state)
        nameBioRGBActive = state
        if state then
            task.spawn(function()
                while nameBioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1RPNam1eColo1r", { "PickingRPNameColor", color })
                    fireServer("1RPNam1eColo1r", { "PickingRPBioColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})

--[[local isNameActive = false
local isBioActive = false

Tab6:AddToggle({
    Name = "Avatar Name RGB",
    Description = "Avatar Name Color is rainbow.",
    Default = false,
    Callback = function(value)
        isNameActive = value
        print(value and "Avatar Name RGB activated" or "Avatar Name RGB deactivated")
    end
})

Tab:AddToggle({
    Name = "Avatar Bio RGB",
    Description = "",
    Default = false,
    Callback = function(value)
        isBioActive = value
        print(value and "Avatar Bio RGB activated" or "Avatar Bio RGB deactivated")
    end
})


local vibrantColors = {
    Color3.fromRGB(255, 0, 0),   -- Vermelho
    Color3.fromRGB(0, 255, 0),   -- Verde
    Color3.fromRGB(0, 0, 255),   -- Azul
    Color3.fromRGB(255, 255, 0), -- Amarelo
    Color3.fromRGB(255, 0, 255), -- Magenta
    Color3.fromRGB(0, 255, 255), -- Ciano
    Color3.fromRGB(255, 165, 0), -- Laranja
    Color3.fromRGB(128, 0, 128), -- Roxo
    Color3.fromRGB(255, 20, 147) -- Rosa choque
}

spawn(function()
    while true do
        if isNameActive then
            local randomColor = vibrantColors[math.random(#vibrantColors)]
            local args = {
                [1] = "PickingRPNameColor",
                [2] = randomColor
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
        end
        wait(0.7)
    end
end)

spawn(function()
    while true do
        if isBioActive then
            local randomColor = vibrantColors[math.random(#vibrantColors)]
            local args = {
                [1] = "PickingRPBioColor",
                [2] = randomColor
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
        end
        wait(0.7)
    end
end)
]]

local ToggleCorpo = Tab6:AddToggle({
    Name = "RGB Body",
    Description = "RGB on Body",
    Default = false
})
ToggleCorpo:Callback(function(Value)
    getgenv().rgbCorpo = Value
    task.spawn(function()
        while getgenv().rgbCorpo do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            if remote and remote:FindFirstChild("ChangeBodyColor") then
                pcall(function()
                    remote.ChangeBodyColor:FireServer({
                        BrickColor.new(getRainbowColor(rgbSpeed))
                    })
                end)
            end
            task.wait(0.1)
        end
    end)
end)



local ToggleCabelo = Tab6:AddToggle({
    Name = "RGB Hair",
    Description = "RGB in hair",
    Default = false
})
ToggleCabelo:Callback(function(Value)
    getgenv().rgbCabelo = Value
    task.spawn(function()
        while getgenv().rgbCabelo do
            fireServer("1Max1y", {
                "ChangeHairColor2",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.5)
        end
    end)
end)



local Section = Tab6:AddSection({"Vehicles & Houses"})



local ToggleCasa = Tab6:AddToggle({
    Name = "RGB House",
    Description = "RGB in house, must be closer to house to perform action.",
    Default = false
})
ToggleCasa:Callback(function(Value)
    getgenv().rgbCasa = Value
    task.spawn(function()
        while getgenv().rgbCasa do
            fireServer("1Player1sHous1e", {
                "ColorPickHouse",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)


-- Carro RGB 
local carRGBActive = false
Tab6:AddToggle({
    Name = "RGB Car (Premium)",
    Description = "Changes the color of the car with continuous RGB. May cause kick if not Premium!",
    Default = false,
    Callback = function(state)
        carRGBActive = state
        if state then
            task.spawn(function()
                while carRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    fireServer("1Player1sCa1r", { "PickingCarColor", color })
                    task.wait(0.03)
                end
            end)
        end
    end
})


local ToggleBicicleta = Tab6:AddToggle({
    Name = "RGB Bicycle",
    Description = "RGB in Bicycle",
    Default = false
})
ToggleBicicleta:Callback(function(Value)
    getgenv().rgbBicicleta = Value
    task.spawn(function()
        while getgenv().rgbBicicleta do
            fireServer("1Player1sCa1r", {
                "NoMotorColor",
                getRainbowColor(rgbSpeed)
            })
            task.wait(0.1)
        end
    end)
end)



local Section = Tab6:AddSection({"Items & Tools"})


-- NOVO TOGGLE: Rádio RGB
local radioRGBActive = false
Tab6:AddToggle({
    Name = "RGB Radio",
    Description = "Changes the color of the radio with continuous RGB",
    Default = false,
    Callback = function(state)
        radioRGBActive = state
        if state then
            task.spawn(function()
                while radioRGBActive and LocalPlayer.Character do
                    local color = getRainbowColor(rgbSpeed)
                    local success, remote = pcall(function()
                        return LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ToolGui"):WaitForChild("ToolSettings"):WaitForChild("Settings"):WaitForChild("PropsColor"):WaitForChild("SetColor")
                    end)
                    if success and remote then
                        pcall(function()
                            remote:FireServer(color)
                        end)
                    end
                    task.wait(0.03)
                end
            end)
        end
    end
})

local ToggleMegafone = Tab6:AddToggle({
    Name = "RGB Megaphone",
    Description = "RGB on the megaphone",
    Default = false
})
ToggleMegafone:Callback(function(Value)
    getgenv().rgbMegafone = Value
    task.spawn(function()
        while getgenv().rgbMegafone do
            local color = getRainbowColor(rgbSpeed)
            local gui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
            if gui then
                local btn = gui:FindFirstChild("ToolGui")
                if btn then
                    local settings = btn:FindFirstChild("ToolSettings")
                    if settings then
                        local props = settings:FindFirstChild("Settings"):FindFirstChild("PropsColor")
                        if props and props:FindFirstChild("SetColor") then
                            pcall(function()
                                props.SetColor:FireServer(color)
                            end)
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)

local ToggleRosquinha = Tab6:AddToggle({
    Name = "RGB Donut",
    Description = "RGB on a donut",
    Default = false
})
ToggleRosquinha:Callback(function(Value)
    getgenv().rgbRosquinha = Value
    task.spawn(function()
        while getgenv().rgbRosquinha do
            local color = getRainbowColor(rgbSpeed)
            local gui = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
            if gui then
                local btn = gui:FindFirstChild("ToolGui")
                if btn then
                    local settings = btn:FindFirstChild("ToolSettings")
                    if settings then
                        local props = settings:FindFirstChild("Settings"):FindFirstChild("PropsColor")
                        if props and props:FindFirstChild("SetColor") then
                            pcall(function()
                                props.SetColor:FireServer(color)
                            end)
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end)

Tab6:AddParagraph({"Suggestions", "If you have any suggestions about RGB, feel free to share it on our Discord Community!"})


---------------------------------------------------------------------------------------------------------------------------------
                                                -- === Tab 7: Music All === --
---------------------------------------------------------------------------------------------------------------------------------
Tab7:AddSection({"NOTICE!"})
Tab7:AddParagraph({
    Title = "⚠️ Meme Sound contains a little sus audio."
})
Tab7:AddParagraph({
    Title = "⚠️ Loud Sound contains a super loud sound, be careful when playing it!"
})
Tab7:AddParagraph({
    Title = "⚠️ Sounds can be heard by all user in the server."
})
Tab7:AddSection({"Global Audio/Sound"})
local loopAtivo = false
local InputID = ""

Tab7:AddTextBox({
    Name = "Audio ID",
    Description = "Enter the ID of the sound you want to play",
    Default = "",
    PlaceholderText = "Example: 1234567890",
    ClearTextOnFocus = true,
    Callback = function(text)
        InputID = tonumber(text)
    end
})

local function fireServer(eventName, args)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild(eventName)
    if event then
        pcall(function()
            event:FireServer(unpack(args))
        end)
    end
end

Tab7:AddButton({
    Name = "Play Sound",
    Description = "Click to play the inserted music",
    Callback = function()
        if InputID then
            fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
            local globalSound = Instance.new("Sound", Workspace)
            globalSound.SoundId = "rbxassetid://" .. InputID
            globalSound.Looped = false
            globalSound:Play()
            task.wait(30)
            globalSound:Destroy()
        end
    end
})

Tab7:AddToggle({
    Name = "Loop",
    Description = "Activate to loop the selected sound",
    Default = false,
    Callback = function(state)
        loopAtivo = state
        if loopAtivo then
            spawn(function()
                while loopAtivo do
                    if InputID then
                        fireServer("1Gu1nSound1s", {Workspace, InputID, 1})
                        local globalSound = Instance.new("Sound", Workspace)
                        globalSound.SoundId = "rbxassetid://" .. InputID
                        globalSound.Looped = false
                        globalSound:Play()
                        task.spawn(function()
                            task.wait(3)
                            globalSound:Destroy()
                        end)
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

Tab7:AddSection({"Meme Sound"})
-- Dropdowns para Tab6
local function createSoundDropdown(title, musicOptions, defaultOption)
    local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" and music.id ~= "4354908569" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

    local selectedSoundID = nil
    local currentVolume = 1
    local currentPitch = 1

    local function playSound(soundId, volume, pitch)
        fireServer("1Gu1nSound1s", {Workspace, soundId, volume})
        local globalSound = Instance.new("Sound")
        globalSound.Parent = Workspace
        globalSound.SoundId = "rbxassetid://" .. soundId
        globalSound.Volume = volume
        globalSound.Pitch = pitch
        globalSound.Looped = false
        globalSound:Play()
        task.spawn(function()
            task.wait(10)
            globalSound:Destroy()
        end)
    end

    Tab7:AddDropdown({
        Name = "Select a Sound",
        Description = "Choose a sound to play on the server",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
            if selectedSound and categoryMap[selectedSound] then
                selectedSoundID = categoryMap[selectedSound].id
            else
                selectedSoundID = nil
            end
        end
    })

    Tab7:AddButton({
        Name = title,
        Description = "",
        Callback = function()
            if selectedSoundID then
                playSound(selectedSoundID, currentVolume, currentPitch)
            end
        end
    })

    local dropdownLoopActive = false
    Tab7:AddToggle({
        Name = "Loop",
        Description = "Loop the selected sound",
        Default = false,
        Callback = function(state)
            dropdownLoopActive = state
            if state then
                task.spawn(function()
                    while dropdownLoopActive do
                        if selectedSoundID then
                            playSound(selectedSoundID, currentVolume, currentPitch)
                        end
                        task.wait(2)
                    end
                end)
            end
        end
    })
end

-- Dropdown "Memes"
createSoundDropdown("Play Selected Meme Sound", {
    ["Memes"] = {
        {name = "pankapakan", id = "122547522269143"}, 
       
        {name = "Ultra fast Moan", id = "128863565301778"},
        {name = "VAIII GOZAAAAAA", id = "116293771329297"},
        {name = "GOZIIIIIEEEEE", id = "93462644278510"},
        {name = "Hommmm ", id = "133135656929513"},
        {name = "moan 1", id = "105263704862377"},
        {name = "moan 2", id = "92186909873950"},
        {name = "sus", id = "128137573022197"},
        {name = "strange moan", id = "131219411501419"},
        {name = "kawai moan", id = "100409245129170"},
        {name = "Yaaaaahhhh~~", id = "88332347208779"},
        {name = "yamete kudasai", id = "108494476595033"},
        {name = "ruby chann haii...", id = "134640594695384"},
        {name = "Loly Moan", id = "119277017538197"},
         {name = "ai poison", id = "115870718113313"},
         {name = "chegachega SUS", id = "77405864184828"},
         {name = "uwu", id = "76820720070248"},
         {name = "ai meu cuzin", id = "130714479795369"},
         {name = "girl audio 2", id = "84207358477461"},
        {name = "Hoo ze da manga", id = "106624090319571"},
        {name = "ai alexandre de moraes", id = "107261471941570"},
        {name = "haaii meme", id = "120006672159037"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
 
    


        {name = "GokGokGokGok", id = "103262503950995"},
        {name = "Toma jack", id = "132603645477541"},
        {name = "Toma jackV2", id = "100446887985203"},
        {name = "Toma jackV3", id = "97476487963273"},
        {name = "ifood", id = "133843750864059"},
        {name = "pelo geito ela ta querendo ram", id = "94395705857835"},
        {name = "lula vai todo mundo", id = "136804576009416"},
        {name = "coringa", id = "84663543883498"},
        {name = "shoope", id = "8747441609"},
        {name = "quenojo", id = "103440368630269"},
        {name = "sai dai lava prato", id = "101232400175829"},
        {name = "se e loko numconpeça", id = "78442476709262"},
        {name = "mita sequer que eu too uma", id = "94889439372168"},
        {name = "Today I will be your wife and you", id = "90844637105538"},
        {name = "Deita aqui eu mandei vc deitar sirens", id = "100291188941582"},
        {name = "miau", id = "131804436682424"},
        {name = "skibidi", id = "128771670035179"},
        {name = "BIRULEIBI", id = "121569761604968"},
        {name = "biseabesjnjkasnakjsndjkafb", id = "133106998846260"},
        {name = "vai corinthians!!....", id = "127012936767471"},
        {name = "my sigman", id = "103431815659907"},
        {name = "mama", id = "106850066985594"},
        {name = "OMG", id = "73349649774476"},
        {name = "aahhh plankton meme", id = "95982351322190"},
        {name = "CHINABOY", id = "84403553163931"},
        {name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470"},
        
        {name = "Sai d3sgraç@", id = "106973692977609"},
        
        {name = "opa salve tudo bem?", id = "80870678096428"},
        {name = "OLHA O CARRO DO DANONE", id = "110493863773948"},
        {name = "Nãoooo, Nãoooo, Nãooo!!!!!", id = "95825536480898"},
        {name = "UM PÉ DE SIRIGUELA KK", id = "112804043442210"},
        {name = "e o carro da pamonha", id = "94951629392683"},
        {name = "BOM DIAAAAAAAAAA", id = "136579844511260"},
        {name = "ai-meu-chiclete", id = "92911732806153"},
        {name = "posso te ligar ou tua mulher...", id = "103211341252816"},
        {name = "Boa chi joga muito cara", id = "110707564387669"},
        {name = "Oqueee meme", id = "120092799810101"},
        {name = "kkk muito fei", id = "79241074803021"},
        {name = "lula cade o ze gotinha", id = "86012585992725"},
        {name = "morreu", id = "8872409975"},
        {name = "a-pia-ta-cheia-de-louca", id = "98076927129047"},
        {name = "Mahito killSong", id = "128669424001766"},
        {name = "Sucumba", id = "7946300950"},
        {name = "nem clicou o thurzin", id = "84428355313544"},
        {name = "fiui OLHA MENSAGEM", id = "121668429878811"},
        {name = "tooomeee", id = "128319664118768"},
        {name = "risada de ladrao", id = "133065882609605"},
        {name = "And PIX still nothing", id = "113831443375212"},
        {name = "I'm not doing anything 2x", id = "89093085290586"},
        {name = "Eli likes", id = "105012436535315"},
        {name = "a three-legged horse?", id = "8164241439"},
        {name = "voces sao um bado de fdp", id = "8232773326"},
        {name = "HAHA I TROLLED YOU!", id = "7021794555"},
        {name = "Rick Roll w/ twist", id = "7992960012"},
        {name = "FERRARI", id = "153619739"},
        {name = "Rick Rolled", id = "736341259"},
        {name = "Fart", id = "6695903063"},
        {name = "SPEEDRUN", id = "7774708196"},
        {name = "SUIIIIII~", id = "7681560017"},
        {name = "spongebob", id = "8904888220"},
        {name = "BONK", id = "4164190231"},
        {name = "Squid Game (game 1)", id = "7535587224"},
        {name = "", id = ""},
        {name = "", id = ""},
        
        

        {name = "Calaboca Kenga", id = "86494561679259"},
        {name = "alvincut", id = "88788640194373"},
        {name = "e a risada faz como?", id = "140713372459057"},
        {name = "voce deve se m@t4", id = "100227426848009"},
        {name = "receba", id = "94142662616215"},
        {name = "UUIIII", id = "73210569653520"},
        



        {name = "sai", id = "121169949217007"},
        {name = "risada boa dms", id = "127589011971759"},
        {name = "wooden leg vacillation", id = "106809680656199"},
        {name = "gomo gomo no!!!", id = "137067472449625"},
        {name = "arroto", id = "140203378050178"},
        {name = "iraaaa", id = "136752451575091"},
        {name = "Don't think too highly of yourself", id = "101588606280167"},
       
        {name = "WhatsApp notification V1", id = "107004225739474"},
        {name = "WhatsApp notification V2", id = "18850631582"},
        {name = "Samsung V1", id = "123767635061073"},
        {name = "Samsung V2", id = "96579234730244"}, 
        {name = "Shiiii", id = "120566727202986"},
        {name = "ai_tomaa miku", id = "139770074770361"},
        {name = "Miku Miku", id = "72812231495047"},
        {name = "kuru kuru", id = "122465710753374"},
        {name = "PM ROCAM", id = "96161547081609"},
        {name = "cavalo!!", id = "78871573440184"},
        {name = "deixa os garoto brinca", id = "80291355054807"},
        {name = "flameeeengo", id = "137774355552052"},
        {name = "sai do mei satnas", id = "127944706557246"},
        {name = "namoral agora e a hora", id = "120677947987369"},
        {name = "n pode me chutar pq seu celebro e burro", id = "82284055473737"},
        {name = "vc ta fudido vou te pegar", id = "120214772725166"},
        {name = "deley", id = "102906880476838"},
        {name = "Tu e um beta", id = "130233956349541"},
        {name = "Porfavor n tira eu nao", id = "85321374020324"},
        {name = "Olá beleza vc pode me dá muitos", id = "74235334504693"},
        {name = "Discord Notification", id = "122662798976905"},
        {name = "rojao apito", id = "6549021381"},
        {name = "off", id = "1778829098"},
        {name = "Kazuma kazuma", id = "127954653962405"},
        {name = "sometourado", id = "123592956882621"},
        {name = "Estouradoespad", id = "136179020015211"},
        {name = "Alaku bommm", id = "110796593805268"},
        {name = "busss", id = "139841197791567"},
        {name = "Estourado wItb", id = "137478052262430"},
        {name = "sla", id = "116672405522828"},
        {name = "HA HA HA HA", id = "138236682866721"}
    }
}, "pankapakan")



local Section = Tab7:AddSection({"Loud Sound"})

-- Dropdown "Efeito/Terror"
createSoundDropdown("Play Selected Loud Sound", {
    ["efeito/terror"] = {
        {name = "jumpscare", id = "91784486966761"},
        {name = "Buong Bansa [ WALANG PAKE ]", id = "5807190725"},
        {name = "n se preocupe", id = "87041057113780"},
        {name = "eles estao todos mortos", id = "70605158718179"},

        {name = "Scream Burst", id = "7520729342"},
        {name = "Scream Fear", id = "113029085566978"},
        {name = "Nuke Siren v1", id = "9067330158"},
        {name = "Nuclear Siren v2", id = "675587093"},
        {name = "School Alert", id = "6607047008"},
        {name = "Loud Siren Alert", id = "8379374771"},
        {name = "Nuclear Siren v3", id = "6766811806"},
        {name = "Alarm estourAAAA...", id = "93354528379052"},
        {name = "MegaMan Alarm", id = "1442382907"},
        {name = "Alarm Brookhaven Bank", id = "1526192493"},
        {name = "John Laugh", id = "6882766712"},
        {name = "Flight Laugh", id = "1569053161"},
        {name = "Timmer Shiawase", id = "5409360995"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},



        {name = "Alert Malaysia", id = "7714172940"},
        {name = "Laughter", id = "79191730206814"},
        {name = "Hahahah", id = "90096947219465"},
        {name = "scream", id = "314568939"},
        {name = "Terrified meme scream", id = "5853668794"},
        {name = "Sonic.exe Scream Effect", id = "146563959"},
        {name = "Demon Scream", id = "2738830850"},
        {name = "SCP-096 Scream (raging)", id = "343430735"},
        {name = "Nightmare Yelling Bursts", id = "9125713501"},
        {name = "HORROR SCREAM 07", id = "9043345732"},
        {name = "Female Scream Woman Screams", id = "9114397912"},
        {name = "Scream1", id = "1319496541"},
        {name = "Scream2", id = "199978176"},
        {name = "scary maze scream", id = "270145703"},
        {name = "SammyClassicSonicFan's Scream", id = "143942090"},
        {name = "FNAF 2 Death Scream", id = "1572549161"},
        {name = "cod zombie scream", id = "8566359672"},
        {name = "Slendytubbies- CaveTubby Scream", id = "1482639185"},
        {name = "FNAF 2 Death Scream", id = "5537531920"},
        {name = "HORROR SCREAM 15", id = "9043346574"},
        {name = "Jumpscare Scream", id = "6150329916"},
        {name = "FNaF: Security Breach", id = "2050522547"},
        {name = "llllllll", id = "5029269312"},
        {name = "LOUD jumpscare", id = "7236490488"},
        {name = "fnaf", id = "6982454389"},
        {name = "Pinkamena Jumpscare 1", id = "192334186"},
        {name = "Ennard Jumpscare 2", id = "629526707"},
        {name = "to sla fear dino", id = "125506416092123"},
        {name = "Backrooms Bacteria Pitfalls ", id = "81325342128575"},
        
        {name = "error Infinite", id = "3893790326"},
        {name = "Screaming Meme", id = "107732411055226"},
        {name = "Jumpscare - SCP CB", id = "97098997494905"},
        {name = "mirror jumpscare", id = "80005164589425"},
        {name = "PTLD-39 Jumpscare", id = "5581462381"},
        {name = "jumpscare:Play()", id = "121519648044128"},
        {name = "mimic jumpscare", id = "91998575878959"},
        {name = "DOORS Glitch Jumpscare Sound", id = "96377507894391"},
        {name = "FNAS 4 Nightmare Mario", id = "99804224106385"},
        {name = "Death House I Jumpscare Sound", id = "8151488745"},
        {name = "Shinky Jumpscare", id = "123447772144411"},
        {name = "FNaTI Jumpscare Oblitus casa", id = "18338717319"},
        {name = "fnaf jumpscare loadmode", id = "18911896588"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "jumpscare")



---------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab 8: Troll Music === --
---------------------------------------------------------------------------------------------------------------------------------
--[[
local function tocarMusica(id)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Rádio (ToolMusicText)
    local argsRadio = {
        [1] = "ToolMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent"):FireServer(unpack(argsRadio))
    
    -- Casa (PickHouseMusicText)
    local argsCasa = {
        [1] = "PickHouseMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(argsCasa))

    -- Carro (PickingCarMusicText)
    local argsCarro = {
        [1] = "PickingCarMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack(argsCarro))

    -- Scooter (PickingScooterMusicText)
    local argsScooter = {
        [1] = "PickingScooterMusicText",
        [2] = id
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(argsScooter))
end

local function isValidMusicId(value)
    return value and value ~= "" and value ~= "Option 1" and not value:match("novas musica adds") and not value:match("musica brasil") and not value:match("musica do meu interece") and not value:match("musica dls por elas") and not value:match("meme abaixo") and not value:match("estourada")
end

Tab8:AddTextBox({
    Name = "Song ID",
    PlaceholderText = "Enter the ID",
    Callback = function(value)
        if value and value ~= "" then
            tocarMusica(tostring(value))
        end
    end
})

-- Dropdowns para Tab8
local function createMusicDropdown(title, musicOptions, defaultOption)
    local musicNames = {}
    local categoryMap = {}
    for category, sounds in pairs(musicOptions) do
        for _, music in ipairs(sounds) do
            if music.name ~= "" then
                table.insert(musicNames, music.name)
                categoryMap[music.name] = {id = music.id, category = category}
            end
        end
    end

    local function playMusic(soundId)
        tocarMusica(tostring(soundId)) -- Usa a função tocarMusica para tocar em todos os contextos
    end

    Tab8:AddDropdown({
        Name = "Select Sound",
        Description = "all",
        Default = defaultOption,
        Multi = false,
        Options = musicNames,
        Callback = function(selectedSound)
            if selectedSound and categoryMap[selectedSound] then
                local soundId = categoryMap[selectedSound].id
                if soundId and soundId ~= "" and soundId ~= "4354908569" then
                    playMusic(soundId)
                end
            end
        end
    })
end

-- Dropdown "Forró"
createMusicDropdown("Forró", {
    ["forro"] = {
        {name = "forró is already tired", id = "74812784884330"},
        {name = "lenbro ate hoje", id = "71531533552899"},
        {name = "escolha certa", id = "107088620814881"},
        {name = "forró da rezenha", id = "120973520531216"},
        {name = "forró dudu", id = "74404168179733"},
        {name = "forró sao joao", id = "106364874935196"},
        {name = "forró engraçado paia", id = "76524290482399"},
        {name = "100% forro vaquejada", id = "92295159623916"},
        
        {name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470"},
        {name = "PARA NÃO ESQUECER QUEM SOMOS", id = "88937498361674"},
        {name = "Uno zero", id = "112959083808887"},
        {name = "Iate do neymar", id = "135738534706063"},
        {name = "Batidao na aldeia", id = "79953696595578"},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Músicas e Memes Aleatório"
createMusicDropdown("Músicas e Memes Aleatório", {
    ["forro"] = {
        {name = "ANXIETY (Amapiano Re-fix)", id = "101483901475189"}, 
        {name = "Meu corpo, minhas regras", id = "127587901595282"},
        {name = "$$$$gg$$$$gg", id = "137471775091253"},
        {name = "Megalovania but its only the melodies", id = "104500091160463"},
        {name = "androphono strikes back", id = "78312089943968"},
        {name = "Bamm Bamm", id = "128730685516895"},
        {name = "chupa cabra", id = "132890273173295"},
        {name = "longe de mais", id = "124478512057763"},
        {name = "Garoto de Copacabana", id = "135648634110254"},
        {name = "CELL!", id = "117634275895085"},
        {name = "Boa vibe em Ubatuba", id = "139059061493558"},
        {name = "SLIP AWAY", id = "126152928520174"},
        {name = "Alone in Motion", id = "122379348696948"},
        {name = "Fade Away", id = "81002139735874"},
        {name = "Wounds & Wishes", id = "109347979566607"},
        {name = "Ascensão do Monarca", id = "101864243033211"},
        {name = "carro do ovo", id = "3148329638"},
        {name = "ingles bus (fling ou kill bus)", id = "123268013026823"},
        {name = "MIKU MIKU HATSUNE", id = "112783541496955"},
        {name = "Five Nights at Freddy's", id = "110733765539890"},
        {name = "Rat Dance", id = "133496635668044"},
        {name = "Escalando a Seleção Brasileira para a Copa", id = "116546457407236"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Funk"
createMusicDropdown("Funk", {
    ["Funk"] = {
        {name = "sua mulher funk", id = "90844637105538"},
        {name = "fuga na viatura", id = "131891110268352"},
        {name = "funkphonk fumando verde", id = "112143944982807"},
        {name = "cauma xmara", id = "95664293972405"},
        {name = "que que sharke", id = "129546408528391"},
        {name = "Il Cacto Hipopotamo FUNK", id = "104491656009142"},
        {name = "Espressora Signora FUNK", id = "123394392737234"},
        {name = "trippi troop funk", id = "73049389767013"},
        {name = "bombini funkphonk", id = "88814770244609"},
        {name = "pre treino", id = "136869502216760"},
        {name = "CVRL", id = "124244582950595"},
        {name = "batida Brega Violino (Beat Brega Funk)", id = "99399643204701"},
        {name = "Dança do Canguru (Pke Gaz1nh)", id = "86876136192157"},
        {name = "espere 30segundos!! Ondas sonoras", id = "127757321382838"},
        {name = "MONTAGEM ARABIANA (Pke Gaz1nh)", id = "78076624091098"},
        {name = "Manda o papo (NGI)", id = "132642647937688"},
        {name = "Viver bem", id = "82805460494325"},
        {name = "Faixa estronda", id = "121187736532042"},
        {name = "Ritmo Pixelado", id = "93928823862203"},
        {name = "Viagem Sonora", id = "79349174602261"},
        {name = "Melodia Virtual", id = "139147474886402"},
        {name = "Melodia Serena", id = "97011217688307"},
        {name = "SENTA", id = "124085422276732"},
        {name = "TUNG TUNG TUNG TUNG SAHUR PHONK BRASILEIRO", id = "120353876640055"},
        {name = "crazy-lol", id = "106958630419629"},
        {name = "V7", id = "80348640826643"},
        {name = "UIUAH", id = "82894376737849"},
        {name = "meta ritmo", id = "110091098283354"},
        {name = "CAPPUCCINO ASSASSINO (SPEDUP)", id = "132733033157915"},
        {name = "haha (NGI)", id = "122114766584918"},
        {name = "DO PO", id = "114207745067816"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

-- Dropdown "Phonk"
createMusicDropdown("Phonk", {
    ["phonk"] = {
        {name = "wyles", id = "85385155970460"},
        {name = "phonk kawai", id = "91502410121438"},
        {name = "querendo da a bucet@", id = "72720721570850"},
        {name = "vem no pocpoc", id = "102333419023382"},
        {name = "tatiu wim", id = "122871512353520"},
        {name = "novinha sapeca", id = "111668097052966"},
        {name = "novinha representa", id = "93786060174790"},
        {name = "phonk1", id = "77501611905348"},
        {name = "phonk2", id = "126887144190812"},
        {name = "phonk osadia", id = "88033569921555"},
        {name = "phonk sarra", id = "132436320685732"},
        {name = "relaionamento sem crush", id = "105832154444494"},
        {name = "phonk3", id = "90323407842935"},
        {name = "novinha dançapanpa", id = "132245626038510"},
        {name = "phonk sexoagreçivo", id = "111995323199676"},
        {name = "phonk4", id = "115016589376700"},
        {name = "phonk5", id = "118740708757685"},
        {name = "phonk6", id = "139435437308948"},
        {name = "phonk chapaquente", id = "109189438638906"},
        {name = "phonk rajada", id = "105126065014034"},
        {name = "rede globo", id = "138487820505005"},
        {name = "phonk indiano", id = "87968531262747"},
        {name = "vapo do vapo", id = "106317184644394"},
        {name = "tutatatutata", id = "112068892721408"},
        {name = "phonk slower", id = "122852029094656"},
        {name = "phonk9", id = "91760524161503"},
        {name = "phonk10", id = "73140398421340"},
        {name = "phonk11", id = "137962454483542"},
        {name = "phonk12", id = "84733736048142"},
        {name = "phonk13", id = "106322173003761"},
        {name = "phonk14", id = "94604796823780"},
        {name = "phonk15", id = "118063577904953"},
        {name = "phonk16", id = "115567432786512"},
        {name = "phonk toq", id = "71304501822029"},
        {name = "phonk hey", id = "132218979961283"},
        {name = "phonk17", id = "102708912256857"},
        {name = "phonk18", id = "140642559093189"},
        {name = "phonk neve", id = "13530439660"},
        {name = "phonk19", id = "87863924786534"},
        {name = "phonk20", id = "133135085604736"},
        {name = "phonk lento", id = "97258811783169"},
        {name = "phonk21", id = "92308400487695"},
        {name = "tipo wym", id = "88064647826500"},
        {name = "estouradassa1", id = "92175624643620"},
        {name = "estouradassa2", id = "108099943758978"},
        {name = "Naaaaa", id = "109784877184952"},
        {name = "trem", id = "114608169341947"},
        {name = "eoropa", id = "111346133543699"},
        {name = "atimosphekika", id = "77857496821844"},
        {name = "phonk ALL THE TIME", id = "123809083385992"},
        {name = "Lifelong Memory", id = "81929101024622"},
        {name = "Automotivo Blondie (Pke Gaz1nh)", id = "74564219749776"},
        {name = "สวัสดีคนไทย v2", id =  "118225359190317"},
        {name = "MTG TU VAI SENTAR (Pke Gaz1nh)", id = "115317874112657"},
        {name = "SARRA FUNK", id = "96249826607044"},
        {name = "Catuquanvan", id = "88038595663211"},
        {name = "F-D-1 (slowed)", id = "124958445624871"},
        {name = "Sucessagem", id = "88551699463723"},
        {name = "ILOVE phonksla", id = "82148953715595"},
        {name = "SPEED SLIDE", id = "118959437310311"},
        {name = "TOMA FUNK PHONK", id = "126291069838831"},
        {name = "PASSO BEM SOLTO X NEW JAZZ", id = "122706595087279"},
        {name = "MONTAGEM BIONICA DIAMANTE", id = "122338822665007"},
        {name = "BALA SELVAGEM!", id = "96180057167470"},
        {name = "Luz <3", id = "74281337525581"},
        {name = "COMO TU", id = "86928685812280"},
        {name = "MONTAGEM SOLAR TROPICANO (SPEED UP)", id = "116461681407294"},
        {name = "MONTAGEM SOLAR TROPICANO (SLOWED)", id = "109308273341422"},
        {name = "YO DE TI", id = "125181345407169"},
        {name = "Beauty, (Phonk), Super sped up", id = "71123357599630"},
        {name = "MONTAGEM BOOMBOX DO MALA FUNK", id = "86537505028256"},
        {name = "BRAZIL DO FUNK", id = "133498554139200"},
        {name = "BRR BRR PATAPIM FUNK", id = "117170901476451"},
        {name = "MONTAGEM TERRA BELA FUNK", id = "134770548505933"},
        {name = "FUNK DO RAVE 1.0", id = "137135395010424"},
        
        {name = " Portao Funk", id = "70900514961735"},
        {name = " Espaço Funk", id = "110519906029322"},
        {name = " FUTABA", id = "91834632690710"},
        {name = " Melódica Explosão De Melodia", id = "98371771055411"},
        {name = " RASGO", id = "98267810117949"},
        {name = " HIPNOTIZA", id = "117668905142866"},
        {name = "CRISTAL NOTURNO", id = "103695219371872"},
        {name = " SKY HIGH", id = "123517126955383"},
        {name = "MIKU top", id = "102771149931910"},
        {name = " ACABU SO FUNK", id = "127870227978818"},
        {name = "CREATIFE FUNK", id = "130525387712209"},
        {name = "GOTH FUNK", id = "97662362226511"},
        {name = "PORTUGESE FUNK", id = "125858109122379"},
        {name = "SUBURBANA", id = "139825057894568"},
        {name = "ESPERA LA NOCHE FUNK", id = "139768056738146"},
        {name = "SIN PERMISO FUNK", id = "92572896648274"},
        {name = "MONTAGEM DACE RAT", id = "98711199754623"},
        {name = " LOVELY FUNK", id = "130633105268814"},
        {name = "STORYMODECOOL", id = "87115976125426"},
        {name = "BLACK COFFEE FUNK", id = "82705137378395"},
        {name = "KOBALT", id = "79381341943021"},
        {name = " andante bacterial", id = "105882833374061"},
        {name = "ANGEL Speed Up", id = "139593870988593"},
        {name = "LUTA ÉPICA", id = "73966367524216"},
        {name = "MALDITA", id = "133814632960968"},
        {name = "DA ZONA NTJ VERSON", id = "105770593501071"},
        {name = "HIPNOTIZA", id = "132015050363205"},
        {name = "MIDZUKI speed up", id = "129151948619922"},
        
        {name = "movimenta funk", id = "114994598691121"},
        {name = "CRISTAL", id = "103445348511856"},
        {name = "Letero funkphonk", id = "99409598156364"},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""},
        {name = "", id = ""}
    }
}, "Option 1")

Tab8:AddButton({
    Name = "Stop Music",
    Description = "Stops all music",
    Callback = function()
        tocarMusica("")
    end
})


]]

---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 9: troll === --
-----------------------------------------------------------------------------------------------------------------------------------
local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local selectedPlayer = nil
local isFollowingKill = false
local isFollowingPull = false
local running = false
local connection = nil
local flingConnection = nil
local originalPosition = nil
local savedPosition = nil
local originalProperties = {}
local selectedKillPullMethod = nil
local selectedFlingMethod = nil
local soccerBall = nil
local couch = nil
local isSpectating = false
local spectatedPlayer = nil
local characterConnection = nil
local flingToggle = nil

local SetNetworkOwnerEvent = Instance.new("RemoteEvent")
SetNetworkOwnerEvent.Name = "SetNetworkOwnerEvent_" .. tostring(math.random(1000, 9999))
SetNetworkOwnerEvent.Parent = ReplicatedStorage

local serverScriptCode = [[
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local event = ReplicatedStorage:WaitForChild("]] .. SetNetworkOwnerEvent.Name .. [[")
    
    event.OnServerEvent:Connect(function(player, part, networkOwner)
        if part and part:IsA("BasePart") then
            pcall(function()
                part:SetNetworkOwner(networkOwner)
                part.Anchored = false
                part.CanCollide = true
                part.CanTouch = true
            end)
        end
    end)
]]

pcall(function()
    loadstring(serverScriptCode)()
end)

local function disableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = true
    end
end

local function enableCarClient()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local carClient = backpack:FindFirstChild("CarClient")
    if carClient and carClient:IsA("LocalScript") then
        carClient.Disabled = false
    end
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local function updateDropdown(dropdown, spectateToggle)
    pcall(function()
        local currentValue = dropdown:Get()
        local playerNames = getPlayerNames()
        dropdown:Set(playerNames) -- Usando :Set como solicitado
        if currentValue and not table.find(playerNames, currentValue) then
            dropdown:Set("")
            selectedPlayer = nil
            if isSpectating then
                stopSpectating()
                if spectateToggle then
                    pcall(function() spectateToggle:Set(false) end)
                end
            end
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() connection = nil end
                if flingConnection then flingConnection:Disconnect() flingConnection = nil end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
        elseif currentValue and table.find(playerNames, currentValue) then
            dropdown:Set(currentValue) -- Mantém seleção se jogador ainda está no jogo
        end
    end)
end





local function spectatePlayer(playerName)
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and targetPlayer ~= LocalPlayer then
        spectatedPlayer = targetPlayer
        isSpectating = true

        local function updateCamera()
            if not isSpectating or not spectatedPlayer then return end
            if spectatedPlayer.Character and spectatedPlayer.Character:FindFirstChild("Humanoid") then
                Workspace.CurrentCamera.CameraSubject = spectatedPlayer.Character.Humanoid
            else
                Workspace.CurrentCamera.CameraSubject = nil
            end
        end

        updateCamera()




        characterConnection = RunService.Heartbeat:Connect(function()
            if not isSpectating then
                characterConnection:Disconnect()
                characterConnection = nil
                return
            end
            pcall(updateCamera)
        end)

        spectatedPlayer.CharacterAdded:Connect(function()
            if isSpectating then updateCamera() end
        end)
    else
        isSpectating = false
        spectatedPlayer = nil
    end
end

local function stopSpectating()
    if characterConnection then
        characterConnection:Disconnect()
        characterConnection = nil
    end

    isSpectating = false
    spectatedPlayer = nil

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    else
        Workspace.CurrentCamera.CameraSubject = nil
        Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
end

-- Função para teletransportar para o jogador selecionado (com ancoragem segura)
local function teleportToPlayer(playerName)
    local targetPlayer = Players:FindFirstChild(playerName)
    if targetPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if not myHRP or not myHumanoid then
            print("Your character is not fully charged for teleportation.")
            return
        end

        -- Zerar a física do personagem antes do teleporte
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
                part.Anchored = true -- Ancorar temporariamente para evitar movimento
            end
        end

        -- Teleportar para a posição do jogador-alvo
        local success, errorMessage = pcall(function()
            myHRP.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 2, 0)) -- Leve elevação para evitar colisão com o chão
        end)
        if not success then
            warn("Error: " .. tostring(errorMessage))
            return
        end

        -- Garantir que o Humanoid saia do estado sentado ou voando
        myHumanoid.Sit = false
        myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        -- Aguardar 0,5 segundos com o personagem ancorado
        task.wait(0.5)

        -- Desancorar todas as partes do personagem e restaurar física
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end

        print("Teletransportado para o jogador: " .. playerName .. " com ancoragem segura.")
    else
        print("Jogador ou personagem não encontrado para teletransporte.")
    end
end

LocalPlayer.CharacterAdded:Connect(function(character)
    if isSpectating then
        stopSpectating()
        pcall(function() SpectateToggleTab10:Set(false) end)
    end
end)

local valor_do_nome_do_joagdor

local DropdownPlayerTab2 = Tab9:AddDropdown({
    Name = "Select Player",
    Description = "Choose a player to kill, pull, view or fling",
    Default = "",
    Multi = false,
    Options = getPlayerNames(),
    Flag = "player list",
    Callback = function(selectedPlayerName)
        valor_do_nome_do_joagdor = selectedPlayerName
        if selectedPlayerName == "" or selectedPlayerName == nil then
            selectedPlayer = nil
            if running or isFollowingKill or isFollowingPull then
                running = false
                isFollowingKill = false
                isFollowingPull = false
                if connection then connection:Disconnect() end
                if flingConnection then flingConnection:Disconnect() end
                if flingToggle then pcall(function() flingToggle:Set(false) end) end
            end
            if isSpectating then stopSpectating() end
        else
            selectedPlayer = Players:FindFirstChild(selectedPlayerName)
            if isSpectating then
                stopSpectating()
                spectatePlayer(selectedPlayerName)
            end
        end
    end
})

function UptadePlayers()
    local playerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name ~= LocalPlayer.Name then
            table.insert(playerNames, player.Name)
        end
    end
    DropdownPlayerTab2:Set(playerNames)
end

Tab9:AddButton({"Update List", function()
    UptadePlayers()
end})

UptadePlayers()


Tab9:AddButton({
    Title = "Teleport to Player",
    Desc = "Teleports your character to selected player's position.",
    Callback = function()
        local selectedPlayerName = valor_do_nome_do_joagdor
        if selectedPlayerName and selectedPlayerName ~= "" then
            local success, errorMessage = pcall(teleportToPlayer, selectedPlayerName)
            if not success then
                warn("Erro ao teletransportar: " .. tostring(errorMessage))
            end
        else
            print("Selecione um jogador antes de teletransportar.")
        end
    end
})

local SpectateToggleTab10 = Tab9:AddToggle({
    Name = "Spectate Player",
    Description = "Toggles display of selected player on/off",
    Default = false,
    Callback = function(state)
        if state then
            if selectedPlayer then
                pcall(spectatePlayer, selectedPlayer.Name)
            else
                SpectateToggleTab10:Set(false)
            end
        else
            pcall(stopSpectating)
        end
    end
})

-- Remoção automática de jogadores que saem
Players.PlayerRemoving:Connect(function(player)
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
    if selectedPlayer == player then
        selectedPlayer = nil
        if isSpectating then stopSpectating() end
        if running then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            if flingToggle then flingToggle:Set(false) end
        end
        SpectateToggleTab10:Set(false)
        DropdownPlayerTab2:Set("")
    end
end)

-- Atualização automática quando um novo jogador entra
Players.PlayerAdded:Connect(function()
    task.wait(1) -- pequeno delay para garantir que o jogador esteja pronto
    updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)
end)

-- Inicializa o dropdown
updateDropdown(DropdownPlayerTab2, SpectateToggleTab10)


local Section = Tab9:AddSection({"Kill"})

local DropdownKillPullMethod = Tab9:AddDropdown({
    Name = "Select Method",
    Description = "Choose a Method",
    Options = {"Sofa", "Bus"},
    Callback = function(value)
        selectedKillPullMethod = value
    end
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com sofa--
------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function equipSofa()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local sofa = backpack:FindFirstChild("Couch") or LocalPlayer.Character:FindFirstChild("Couch")
    if not sofa then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            sofa = backpack:FindFirstChild("Couch")
            task.wait()
        until sofa or task.wait(5)
        if not sofa then return false end
    end
    if sofa.Parent ~= LocalPlayer.Character then
        sofa.Parent = LocalPlayer.Character
    end
    return true
end

local function killWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingKill = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end

local function pullWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    if not equipSofa() then return end
    isFollowingPull = true
    originalPosition = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
end

----------------------------------------------------------------------------
                                                   --fling com onibus--
----------------------------------------------------------------------------


local function killWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local lastUpdate = tick()
    local updateInterval = 0.05
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        local targetCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
        local newTargetHRP = targetCharacter:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetCharacter:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then return end
        if not myHRP or not humanoid then running = false return end
        if tick() - lastUpdate < updateInterval then return end
        lastUpdate = tick()
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
        end
    end)
end

local followConnection
if followConnection then followConnection:Disconnect() end
followConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        pcall(function()
            local targetPosition = selectedPlayer.Character.HumanoidRootPart.Position
            LocalPlayer.Character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
    end
end)

local sitCheckConnection
if sitCheckConnection then sitCheckConnection:Disconnect() end
sitCheckConnection = RunService.Heartbeat:Connect(function()
    if (isFollowingKill or isFollowingPull) and selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Humanoid") then
        pcall(function()
            if selectedPlayer.Character.Humanoid.Sit then
                if isFollowingKill then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
                        task.wait(0.5)
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer("PickingTools", "Couch")
                        task.wait(1)
                    end
                end
                isFollowingKill = false
                isFollowingPull = false
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and originalPosition then
                    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                    if myHRP then
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end
                    originalPosition = nil
                end
            end
        end)
    end
end)

Tab9:AddButton({
    Name = "Auto Kill",
    Description = "Starts killing with the selected method",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod then return end
        if selectedKillPullMethod == "Sofá" then
            killWithSofa(selectedPlayer)
        elseif selectedKillPullMethod == "Ônibus" then
            killWithBus(selectedPlayer)
        end
    end
})

Tab9:AddButton({
    Name = "Auto Pull",
    Description = "Starts pulling with the selected method",
    Callback = function()
        if isFollowingKill or isFollowingPull or running then return end
        if not selectedPlayer or not selectedKillPullMethod or selectedKillPullMethod ~= "Sofá" then return end
        pullWithSofa(selectedPlayer)
    end
})

Tab9:AddButton({
    Name = "Stop Movement [ KILL/PULL ]",
    Description = "For the kill or pull movement",
    Callback = function()
        isFollowingKill = false
        isFollowingPull = false
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        local myHumanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
        for _, seat in ipairs(Workspace:GetDescendants()) do
            if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
        end
        if originalPosition then
            local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHRP then
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(originalPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end
            originalPosition = nil
        end

        disableCarClient()

        local args = { [1] = "DeleteAllVehicles" }
        pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
        end)
    end
})

local Section = Tab9:AddSection({"Fling"})

local DropdownFlingMethod = Tab9:AddDropdown({
    Name = "Select Fling Method",
    Description = "Choose the method to apply fling",
    Options = {"Sofá", "Ônibus", "Bola", "Bola V2", "Barco", "Caminhão"},
    Callback = function(value)
        selectedFlingMethod = value
    end
})


----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com sofa--
----------------------------------------------------------------------------------------------------------------------------------------------------------

local function flingWithSofa(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then
        return
    end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then
        return
    end
    savedPosition = myHRP.Position
    if not equipSofa() then return end
    task.wait(0.5)
    couch = character:FindFirstChild("Couch")
    if not couch then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if (obj.Name == "Couch" or obj.Name == "Couch" .. LocalPlayer.Name) and (obj:IsA("BasePart") or obj:IsA("Tool")) then
                couch = obj
                break
            end
        end
    end
    if not couch then
        return
    end
    if couch:IsA("BasePart") then
        originalProperties = {
            Anchored = couch.Anchored,
            CanCollide = couch.CanCollide,
            CanTouch = couch.CanTouch
        }
        couch.Anchored = false
        couch.CanCollide = true
        couch.CanTouch = true
        pcall(function() couch:SetNetworkOwner(nil) end)
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
    local startTime = tick()
    local walkFlingInstance = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then
            running = false
            return
        end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then
            running = false
            return
        end
        if not myHRP or not humanoid then
            running = false
            return
        end
        pcall(function()
            local targetPosition = newTargetHRP.Position
            character:SetPrimaryPartCFrame(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        if newTargetHumanoid.Sit or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    pcall(function() part:SetNetworkOwner(nil) end)
                end
            end
            walkFlingInstance = Instance.new("BodyVelocity")
            walkFlingInstance.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstance.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstance.Parent = myHRP
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16))
                myHRP.Anchored = false
            end)
            local spinStart = tick()
            local spinConnection
            spinConnection = RunService.Heartbeat:Connect(function()
                if tick() - spinStart >= 0.5 then
                    spinConnection:Disconnect()
                    return
                end
                pcall(function()
                    character:SetPrimaryPartCFrame(
                        myHRP.CFrame * CFrame.Angles(
                            math.rad(Workspace.DistributedGameTime * 12000),
                            math.rad(Workspace.DistributedGameTime * 15000),
                            math.rad(Workspace.DistributedGameTime * 18000)
                        )
                    )
                end)
            end)
            task.wait(0.5)
            local args = { [1] = "PlayerWantsToDeleteTool", [2] = "Couch" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
            end)
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end)
            if walkFlingInstance then
                walkFlingInstance:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            if flingToggle then
                flingToggle:SetValue(false)
            end
        end
    end)
end


---------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com bola--
---------------------------------------------------------------------------------------------------------------------------------------------------------

local function equipBola()
    local backpack = LocalPlayer:WaitForChild("Backpack")
    local bola = backpack:FindFirstChild("SoccerBall") or LocalPlayer.Character:FindFirstChild("SoccerBall")
    if not bola then
        local args = { [1] = "PickingTools", [2] = "SoccerBall" }
        local success = pcall(function()
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        end)
        if not success then return false end
        repeat
            bola = backpack:FindFirstChild("SoccerBall")
            task.wait()
        until bola or task.wait(5)
        if not bola then return false end
    end
    if bola.Parent ~= LocalPlayer.Character then
        bola.Parent = LocalPlayer.Character
    end
    return true
end

local function flingWithBall(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then part.CanCollide = false end
    end
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        humanoid.Sit = false
    end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = true end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeDown", 4)
    end)
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp or not hum or not myHRP then return end
        local moveDir = hum.MoveDirection
        local isStill = moveDir.Magnitude < 0.1
        local isSitting = hum.Sit
        if isSitting then
            local y = math.sin(tick() * 50) * 2
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75 + y, 0))
        elseif isStill then
            local z = math.sin(tick() * 50) * 3
            soccerBall.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 0.75, z))
        else
            local offset = moveDir.Unit * math.clamp(hrp.Velocity.Magnitude * 0.15, 5, 12)
            soccerBall.CFrame = CFrame.new(hrp.Position + offset + Vector3.new(0, 0.75, 0))
        end
        myHRP.CFrame = CFrame.new(soccerBall.Position + Vector3.new(0, 1, 0))
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                  --fling bola v2--
------------------------------------------------------------------------------------------------------------------------------------------------------------


local function flingWithBallV2(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    if not workspaceCom then return end
    local soccerBalls = workspaceCom:FindFirstChild("001_SoccerBalls")
    if not soccerBalls then return end
    soccerBall = soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    savedPosition = myHRP.Position
    running = true
    local lastFlingTime = 0
    connection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local hum = targetPlayer.Character:FindFirstChild("Humanoid")
        if not hrp or not hum then return end
        local speed = hrp.Velocity.Magnitude
        local isMoving = hum.MoveDirection.Magnitude > 0.05
        local isJumping = hum:GetState() == Enum.HumanoidStateType.Jumping
        local offset
        if isMoving or isJumping then
            local extra = math.clamp(speed / 1.5, 6, 15)
            offset = hrp.CFrame.LookVector * extra + Vector3.new(0, 1, 0)
        else
            local wave = math.sin(tick() * 25) * 4
            local side = math.cos(tick() * 20) * 1.5
            offset = Vector3.new(side, 1, wave)
        end
        pcall(function()
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
        end)
    end)
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running or not targetPlayer.Character then return end
        local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local dist = (soccerBall.Position - hrp.Position).Magnitude
        if dist < 4 and tick() - lastFlingTime > 0.4 then
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
            fling.Parent = hrp
            task.delay(0.3, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end
    end)
end




-----------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com ônibus--
-----------------------------------------------------------------------------------------------------------------------------------------------------


local function flingWithBus(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    args = { [1] = "PickingCar", [2] = "SchoolBus" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local busName = LocalPlayer.Name .. "Car"
    local bus = vehiclesFolder:FindFirstChild(busName)
    if not bus then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(bus:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    local walkFlingInstancePlayer = nil
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            bus:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(bus:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            flingConnection:Disconnect()
            flingConnection = nil
            pcall(function()
                bus:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)

            walkFlingInstancePlayer = Instance.new("BodyVelocity")
            walkFlingInstancePlayer.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            walkFlingInstancePlayer.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
            walkFlingInstancePlayer.Parent = myHRP
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if walkFlingInstancePlayer then
                walkFlingInstancePlayer:Destroy()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------
                                                   --fling com barco--
-----------------------------------------------------------------------------------------------------------------------------------------------------------

local function flingWithBoat(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3359.52, -5.05, -501.94))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.4)
    args = { [1] = "PickingBoat", [2] = "MilitaryBoatFree" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1.5)
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local boatName = LocalPlayer.Name .. "Car"
    local boat = vehiclesFolder:FindFirstChild(boatName)
    if not boat then return end
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(-3358.85, 5.25, -521.95))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit
    for _, part in ipairs(boat:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)
    local startTime = tick()
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end
        local offset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        pcall(function()
            local targetPosition = newTargetHRP.Position + offset
            boat:PivotTo(
                CFrame.new(targetPosition) * CFrame.Angles(
                    math.rad(Workspace.DistributedGameTime * 12000),
                    math.rad(Workspace.DistributedGameTime * 15000),
                    math.rad(Workspace.DistributedGameTime * 18000)
                )
            )
        end)
        local playerSeated = false
        for _, seat in ipairs(boat:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end
        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end
            pcall(function()
                boat:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
            end)
            task.wait(0.5)

            disableCarClient()

            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)
            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end
            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end
            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)
            if flingToggle then flingToggle:Set(false) end
        end
    end)
end



------------------------------------------------------------------------------------------------------------------------------------------------
                                      --fling com caminhão--
------------------------------------------------------------------------------------------------------------------------------------------------


local function flingWithTruck(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not LocalPlayer.Character then return end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not myHRP then return end
    savedPosition = myHRP.Position

    -- Teletransporta para a posição inicial do ônibus para invocar o caminhão
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
    end)
    task.wait(0.5)

    -- Desativa o cliente de carro para evitar interferências
    disableCarClient()

    -- Deleta qualquer veículo existente
    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)

    -- Invoca o caminhão (Semi) usando o comando fornecido
    args = { [1] = "PickingCar", [2] = "Semi" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(1)

    -- Encontra o caminhão invocado
    local vehiclesFolder = Workspace:FindFirstChild("Vehicles")
    if not vehiclesFolder then return end
    local truckName = LocalPlayer.Name .. "Car"
    local truck = vehiclesFolder:FindFirstChild(truckName)
    if not truck then return end

    -- Teletransporta para a posição do assento do caminhão
    pcall(function()
        myHRP.Anchored = true
        myHRP.CFrame = CFrame.new(Vector3.new(1176.56, 79.90, -1166.65))
        task.wait(0.2)
        myHRP.Velocity = Vector3.zero
        myHRP.RotVelocity = Vector3.zero
        myHRP.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.Seated)
    end)

    -- Espera o jogador sentar no caminhão
    local sitStart = tick()
    repeat
        task.wait()
        if tick() - sitStart > 10 then return end
    until humanoid.Sit

    -- Desativa a colisão das partes do caminhão e define a posse de rede
    for _, part in ipairs(truck:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
            pcall(function() part:SetNetworkOwner(nil) end)
        end
    end

    -- Inicia o processo de fling
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running then return end
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end)

    local startTime = tick()
    local lastFlingTime = 0
    flingConnection = RunService.Heartbeat:Connect(function()
        if not running then return end
        if not targetPlayer or not targetPlayer.Character then running = false return end
        local newTargetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local newTargetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if not newTargetHRP or not newTargetHumanoid then running = false return end
        if not myHRP or not humanoid then running = false return end

        -- Encontra a parte Trailer para o fling
        local trailer = truck:FindFirstChild("Body") and truck.Body:FindFirstChild("Trailer")
        if not trailer then return end

        -- Faz o trailer se mover para cima e para baixo muito rapidamente
        local verticalOffset = math.sin(tick() * 30) * 5 -- Oscila entre -5 e 5 unidades na vertical, ainda mais rápido
        pcall(function()
            local targetPosition = newTargetHRP.Position + Vector3.new(0, verticalOffset, 0)
            trailer:PivotTo(CFrame.new(targetPosition)) -- Apenas movimento vertical, sem rotação
        end)

        -- Verifica a distância entre o trailer e o jogador-alvo para aplicar o fling
        local dist = (trailer.Position - newTargetHRP.Position).Magnitude
        if dist < 5 and tick() - lastFlingTime > 0.4 then -- Aplica o fling se o jogador estiver a menos de 5 unidades
            lastFlingTime = tick()
            for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
            -- Aplica um fling extremamente forte
            local fling = Instance.new("BodyVelocity")
            fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            fling.Velocity = Vector3.new(math.random(-10, 10), 50, math.random(-10, 10)).Unit * 10000000 + Vector3.new(0, 5000000, 0)
            fling.Parent = newTargetHRP
            task.delay(0.5, function()
                fling:Destroy()
                for _, part in ipairs(targetPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end)
        end

        -- Para o fling se o jogador-alvo estiver sentado ou após 10 segundos
        local playerSeated = false
        for _, seat in ipairs(truck:GetDescendants()) do
            if (seat:IsA("Seat") or seat:IsA("VehicleSeat")) and seat.Name ~= "VehicleSeat" then
                if seat.Occupant == newTargetHumanoid then
                    playerSeated = true
                    break
                end
            end
        end

        if playerSeated or tick() - startTime > 10 then
            running = false
            if connection then connection:Disconnect() connection = nil end
            if flingConnection then flingConnection:Disconnect() flingConnection = nil end

            -- Teletransporta o caminhão para uma posição fora do mapa
            pcall(function()
                truck:PivotTo(CFrame.new(Vector3.new(-59599.73, 2040070.50, -293391.16)))
            end)
            task.wait(0.5)

            -- Limpeza: Deleta o caminhão e reseta o jogador
            disableCarClient()
            local args = { [1] = "DeleteAllVehicles" }
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            end)

            if character then
                local myHRP = character:FindFirstChild("HumanoidRootPart")
                if myHRP and savedPosition then
                    pcall(function()
                        myHRP.Anchored = true
                        myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                        task.wait(0.2)
                        myHRP.Velocity = Vector3.zero
                        myHRP.RotVelocity = Vector3.zero
                        myHRP.Anchored = false
                        if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
                    end)
                end
            end

            if character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
            end

            local myHumanoid = character and character:FindFirstChild("Humanoid")
            if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
            for _, seat in ipairs(Workspace:GetDescendants()) do
                if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
            end
            pcall(function()
                ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
            end)

            if flingToggle then flingToggle:Set(false) end
        end
    end)
end



------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------



local function stopFling()
    running = false
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if flingConnection then
        flingConnection:Disconnect()
        flingConnection = nil
    end
    if soccerBall then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    if couch and couch:IsA("BasePart") then
        couch.Anchored = originalProperties.Anchored
        couch.CanCollide = originalProperties.CanCollide
        couch.CanTouch = originalProperties.CanTouch
    end

    disableCarClient()

    local args = { [1] = "DeleteAllVehicles" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
    end)
    task.wait(0.2)
    local character = LocalPlayer.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
    end
    local myHumanoid = character and character:FindFirstChild("Humanoid")
    if myHumanoid then myHumanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end
    for _, seat in ipairs(Workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then seat.Disabled = false end
    end
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer("CharacterSizeUp", 1)
    end)
    if savedPosition then
        local myHRP = character and character:FindFirstChild("HumanoidRootPart")
        if myHRP then
            pcall(function()
                myHRP.Anchored = true
                myHRP.CFrame = CFrame.new(savedPosition + Vector3.new(0, 5, 0))
                task.wait(0.2)
                myHRP.Velocity = Vector3.zero
                myHRP.RotVelocity = Vector3.zero
                myHRP.Anchored = false
                if myHumanoid then myHumanoid:ChangeState(Enum.HumanoidStateType.GettingUp) end
            end)
        end
    end
end

 
                
flingToggle = Tab9:AddToggle({
    Name = "Activate Fling",
    Description = "Enables or disables fling with the selected method",
    Default = false,
    Callback = function(state)
        if state then
            if isFollowingKill or isFollowingPull or running then
                flingToggle:Set(false)
                return
            end
            if selectedFlingMethod == "Sofá" then
                flingWithSofa(selectedPlayer)
            elseif selectedFlingMethod == "Bola" then
                flingWithBall(selectedPlayer)
            elseif selectedFlingMethod == "Bola V2" then
                flingWithBallV2(selectedPlayer)
            elseif selectedFlingMethod == "Barco" then
                flingWithBoat(selectedPlayer)
            elseif selectedFlingMethod == "Caminhão" then
                flingWithTruck(selectedPlayer)
            elseif selectedFlingMethod == "Ônibus" then
                flingWithBus(selectedPlayer)
            end
        else
            stopFling()
        end
    end
})


Tab9:AddButton({
    Name = "Auto Fling All V2 [ BETA ]",
    Description = "MUCH BETTER!",
    Callback = function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local cam = workspace.CurrentCamera


    local function ProcessPlayer(target)
        if not target or not target.Character or target == LocalPlayer then return end
        
        local flingActive = true
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if not root or not tRoot then return end
        
        local char = LocalPlayer.Character
        local hum = char:FindFirstChildOfClass("Humanoid")
        local original = root.CFrame

    
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
        task.wait(0.2)

  
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.3)

        local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
        if tool then
            tool.Parent = char
        end
task.wait(0.1)

game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
task.wait(0.25)

        workspace.FallenPartsDestroyHeight = 0/0

        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlingForce"
        bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = root

        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        hum.PlatformStand = false
        cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

        
 
        task.spawn(function()
            local angle = 0
            local parts = {root}
            while flingActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
                local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                if tHum.Sit then break end
                angle += 50

                for _, part in ipairs(parts) do
                    local hrp = target.Character.HumanoidRootPart
                    local pos = hrp.Position + hrp.Velocity / 1.5
                    root.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(angle), 0, 0)
                end

                root.Velocity = Vector3.new(9e8, 9e8, 9e8)
                root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                task.wait()
            end

         
            flingActive = false
            bv:Destroy()
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            hum.PlatformStand = false
            root.CFrame = original
            cam.CameraSubject = hum

            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.Velocity = Vector3.zero
                    p.RotVelocity = Vector3.zero
                end
            end

            hum:UnequipTools()
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        end)
       
        while flingActive do
            task.wait()
        end
    end


    for _, player in ipairs(Players:GetPlayers()) do
        ProcessPlayer(player)
			end
    end
})
local Section = Tab9:AddSection({"ALL"})

-- Variáveis globais no início do Tab2
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

orbitando = false
orbitConn = nil
allFling = false
allConn = nil
currentPlayerList = nil
currentPlayerIndex = nil
lastSwitchTime = nil
allFling2 = false
allConn2 = nil
soccerBall = nil
originalProperties = nil
excludedPlayers = {} -- Tabela para jogadores excluídos dos flings

-- Função auxiliar para obter a foto de perfil do jogador
local function getPlayerThumbnail(userId)
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local success, result = pcall(function()
        return Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    end)
    if success then
        return result
    else
        warn("Erro ao obter thumbnail: " .. tostring(result))
        return nil
    end
end

-- Função auxiliar para encontrar jogador por parte do nome
local function findPlayerByPartialName(partialName)
    partialName = partialName:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name:lower():find(partialName) then
            return plr
        end
    end
    return nil
end

-- Função para exibir notificação
local function showNotification(title, description, icon)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = description,
            Icon = icon or "",
            Duration = 5
        })
    end)
end

-- TextBox para excluir jogador
Tab9:AddTextBox({
    Name = "Whitelist Player",
    Description = "Enter part of the player's name",
    PlaceholderText = "...",
    Callback = function(Value)
        if Value == "" then
            showNotification("No Action", "Enter a name to add a player.", nil)
            return
        end

        local player = findPlayerByPartialName(Value)
        if player then
            -- Verifica se o jogador já está excluído
            for _, excluded in ipairs(excludedPlayers) do
                if excluded == player then
                    showNotification("Player is already on the whitelist", "Player " .. player.Name .. " has already been added.", getPlayerThumbnail(player.UserId))
                    return
                end
            end
            table.insert(excludedPlayers, player)
            local thumbnail = getPlayerThumbnail(player.UserId)
            showNotification("Player added", "Player " .. player.Name .. " was removed from the flings.", thumbnail)
        else
            showNotification("Player Not Found", "No players found with '" .. Value .. "'.", nil)
        end
    end
})

-- Botão para verificar jogadores excluídos
Tab9:AddButton({"Check Excluded Player", function()
    if #excludedPlayers == 0 then
        showNotification("None in the whitelist", "No player is removed from flings.", nil)
        return
    end
    for i, player in ipairs(excludedPlayers) do
        local thumbnail = getPlayerThumbnail(player.UserId)
        showNotification("Player added " .. i, "Player " .. player.Name .. " is removed from the flings.", thumbnail)
        task.wait(0.5) -- Pequeno atraso entre notificações para evitar sobreposição
    end
end})

-- Botão para remover todos os jogadores excluídos
Tab9:AddButton({"Remove Player", function()
    if #excludedPlayers == 0 then
        showNotification("None removed", "No players to remove from whitelist.", nil)
        return
    end
    excludedPlayers = {}
    showNotification("Whitelist Removed", "All players have been removed from the whitelist.", nil)
end})

-- Bola Fling Orbitando
Tab9:AddButton({"Orbiting Fling Ball", function()
    if orbitando then return end
    if not equipBola() then return end
    task.wait(0.5)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = character:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    orbitando = true
    orbitConn = RunService.Heartbeat:Connect(function()
        if not orbitando or not soccerBall or not soccerBall.Parent or not myHRP or not myHRP.Parent or not character or not character.Parent then
            if orbitConn then
                orbitConn:Disconnect()
                orbitConn = nil
            end
            orbitando = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local t = tick() * 10
        local radius = 3
        local offset = Vector3.new(math.cos(t) * radius, -1, math.sin(t) * radius)
        soccerBall.CFrame = CFrame.new(myHRP.Position + offset)
        soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
    end)
end})

-- Fling Bola ALL V1
Tab9:AddButton({"Fling Ball ALL V1", function()
    if allFling then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling = true

    local function getShuffledPlayers()
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        return playerList
    end

    allConn = RunService.Heartbeat:Connect(function()
        if not allFling or not soccerBall or not soccerBall.Parent then
            if allConn then
                allConn:Disconnect()
                allConn = nil
            end
            allFling = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            currentPlayerList = nil
            currentPlayerIndex = nil
            lastSwitchTime = nil
            return
        end

        if not currentPlayerList or #currentPlayerList == 0 then
            currentPlayerList = getShuffledPlayers()
            currentPlayerIndex = 1
            lastSwitchTime = tick()
        end

        if #currentPlayerList == 0 then
            return
        end

        if tick() - lastSwitchTime >= 4 then
            currentPlayerIndex = currentPlayerIndex + 1
            if currentPlayerIndex > #currentPlayerList then
                currentPlayerList = getShuffledPlayers()
                currentPlayerIndex = 1
            end
            lastSwitchTime = tick()
        end

        local target = currentPlayerList[currentPlayerIndex]
        if not target or not target.Character then
            return
        end

        local targetChar = target.Character
        if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
            local hrp = targetChar.HumanoidRootPart
            local humanoid = targetChar.Humanoid
            local velocity = hrp.Velocity
            local speed = velocity.Magnitude
            local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
            local isMoving = humanoid.MoveDirection.Magnitude > 0.05
            local offset
            if isMoving or isJumping then
                local moveDir = hrp.CFrame.LookVector
                local extraDist = math.clamp(speed / 1.5, 6, 18)
                offset = moveDir * extraDist + Vector3.new(0, 1, 0)
            else
                local waveZ = math.sin(tick() * 25) * 4
                local sideX = math.cos(tick() * 20) * 1.5
                offset = Vector3.new(sideX, 1, waveZ)
            end
            soccerBall.CFrame = CFrame.new(hrp.Position + offset)
            soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
            if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                local fling = Instance.new("BodyVelocity")
                fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 500000 + Vector3.new(0, 250000, 0)
                fling.Parent = hrp
                task.delay(0.3, function()
                    fling:Destroy()
                end)
            end
        end
    end)
end})

-- Fling Bola ALL V2
Tab9:AddButton({"Fling Ball ALL V2", function()
    if allFling2 then return end
    if not equipBola() then return end
    task.wait(0.5)
    local args = { [1] = "PlayerWantsToDeleteTool", [2] = "SoccerBall" }
    pcall(function()
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(args))
    end)
    local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
    local soccerBalls = workspaceCom and workspaceCom:FindFirstChild("001_SoccerBalls")
    soccerBall = soccerBalls and soccerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
    if not soccerBall then return end
    originalProperties = {
        Anchored = soccerBall.Anchored,
        CanCollide = soccerBall.CanCollide,
        CanTouch = soccerBall.CanTouch
    }
    soccerBall.Anchored = false
    soccerBall.CanCollide = true
    soccerBall.CanTouch = true
    pcall(function() soccerBall:SetNetworkOwner(nil) end)
    allFling2 = true
    allConn2 = RunService.Heartbeat:Connect(function()
        if not allFling2 or not soccerBall or not soccerBall.Parent then
            if allConn2 then
                allConn2:Disconnect()
                allConn2 = nil
            end
            allFling2 = false
            if soccerBall and originalProperties then
                soccerBall.Anchored = originalProperties.Anchored
                soccerBall.CanCollide = originalProperties.CanCollide
                soccerBall.CanTouch = originalProperties.CanTouch
            end
            soccerBall = nil
            originalProperties = nil
            return
        end
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            local isExcluded = false
            for _, excluded in ipairs(excludedPlayers) do
                if plr == excluded then
                    isExcluded = true
                    break
                end
            end
            if plr ~= LocalPlayer and not isExcluded and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(playerList, plr)
            end
        end
        for i = #playerList, 2, -1 do
            local j = math.random(i)
            playerList[i], playerList[j] = playerList[j], playerList[i]
        end
        for _, target in ipairs(playerList) do
            if not allFling2 then break end
            local targetChar = target.Character
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("Humanoid") then
                local hrp = targetChar.HumanoidRootPart
                local humanoid = targetChar.Humanoid
                local velocity = hrp.Velocity
                local speed = velocity.Magnitude
                local isJumping = humanoid:GetState() == Enum.HumanoidStateType.Jumping
                local isMoving = humanoid.MoveDirection.Magnitude > 0.05
                local offset
                if isMoving or isJumping then
                    local moveDir = hrp.CFrame.LookVector
                    local extraDist = math.clamp(speed / 1.5, 6, 18)
                    offset = moveDir * extraDist + Vector3.new(0, 1, 0)
                else
                    local waveZ = math.sin(tick() * 25) * 4
                    local sideX = math.cos(tick() * 20) * 1.5
                    offset = Vector3.new(sideX, 1, waveZ)
                end
                soccerBall.CFrame = CFrame.new(hrp.Position + offset)
                soccerBall.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
                if (soccerBall.Position - hrp.Position).Magnitude < 4 then
                    local fling = Instance.new("BodyVelocity")
                    fling.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    fling.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit * 1000000 + Vector3.new(0, 1000000, 0)
                    fling.Parent = hrp
                    task.delay(0.3, function()
                        fling:Destroy()
                    end)
                end
            end
            task.wait(0.1)
        end
    end)
end})

-- Parar Tudo
Tab9:AddButton({"Stop Everything", function()
    -- Parar Orbitando
    orbitando = false
    if orbitConn then
        orbitConn:Disconnect()
        orbitConn = nil
    end
    -- Parar Fling ALL V1
    allFling = false
    if allConn then
        allConn:Disconnect()
        allConn = nil
    end
    currentPlayerList = nil
    currentPlayerIndex = nil
    lastSwitchTime = nil
    -- Parar Fling ALL V2
    allFling2 = false
    if allConn2 then
        allConn2:Disconnect()
        allConn2 = nil
    end
    -- Restaurar propriedades da bola
    if soccerBall and originalProperties then
        soccerBall.Anchored = originalProperties.Anchored
        soccerBall.CanCollide = originalProperties.CanCollide
        soccerBall.CanTouch = originalProperties.CanTouch
    end
    soccerBall = nil
    originalProperties = nil
    showNotification("Everything Stopped", "All functions have been disabled.", nil)
end})





---------------------------------------------------------------------------------------------------------------------------------
                                                   -- === Tab 10: lag server === --
---------------------------------------------------------------------------------------------------------------------------------
Tab10:AddSection({"Available SOON"})
Tab10:AddParagraph({"HEY!", "This function is currently unavailable for now."})







----------------------------------------------------------------------------------------------------------------------------------------------
                                               -- === Tab 11: Scripts === --
----------------------------------------------------------------------------------------------------------------------------------------------
Tab11:AddButton({
    Name = "Kai Hub",
    Description = "Universal",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/takgoo31/realtakgoo999/refs/heads/main/universal.lua"))()
    end
})






Tab11:AddButton({
    Name = "Infinite Yield",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Yield.txt"))()
    end
})




Tab11:AddButton({
    Name = "Black Hole",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BringFlingPlayers"))("More Scripts: t.me/arceusxscripts")
    end
})

Tab11:AddButton({
    Name = "System Broken",
    Description = "Universal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end
})




-----------------------------------------------------------------------------------------------------------------------------------------
                                          -- === Tab 12: Teleport === --
-----------------------------------------------------------------------------------------------------------------------------------------




-- Tab12: Teleportes
Tab12:AddSection({"Teleportation"})
local teleportPlayer = game.Players.LocalPlayer
local teleportLocation = "..."      -- Default value
local premiumLocation = "..." -- Default value
local subwayLocation = "..."  -- Default value
local secretLocation = "..."           -- Default Value

local locations = {
    ["Hill"] = Vector3.new(-348.64, 65.94, -458.08),
    ["Main Square"] = Vector3.new(-26.17, 3.48, -0.93),
    ["Bank"] = Vector3.new(1.99, 3.32, 236.65),
    ["Bank Vault"] = Vector3.new(-9.40, 17.86, 267.89),
    ["Police"] = Vector3.new(-120.03, 3.55, 8.58),
    ["Hospital"] = Vector3.new(-303.2, 3.40, 13.74),
    ["City Hall"] = Vector3.new(-354.65, 7.32, -102.16),
    ["Farm"] = Vector3.new(-766.41, 2.92, -61.10),
    ["Market"] = Vector3.new(16.31, 3.32, -107.07),
    ["Grocery"] = Vector3.new(151.05, 3.52, -190.64),
    ["Airport"] = Vector3.new(290.23, 4.32, 42.57),
    ["Hotel"] = Vector3.new(159.10, 3.32, 164.97),
    ["School"] = Vector3.new(-302.11, 3.66, 212.59),
    ["Fire Station"] = Vector3.new(-429.83, 3.46, -99.58),
    ["Solar Panel"] = Vector3.new(409.34, 19.07, 820.19),
    ["Food Mart"] = Vector3.new(141.96, 3.31, -360.09),
    ["Auto Repair Shop"] = Vector3.new(8.32, 2.41, -339.34),
    ["Burger Barn"] = Vector3.new(152.21, 3.41, 55.40),
    ["Club Brooks"] = Vector3.new(-70, 18, -131),
    ["Droneview"] = Vector3.new(-667.03, 249.17, 757.77),
    ["Lake Madison"] = Vector3.new(-222.88, 9.28, 768.09),
    ["Lake Yacht"] = Vector3.new(-133.15, 31.48, 849.56),
    ["Campsite 1"] = Vector3.new(-352.33, 3.06, 555.47),
    ["Campsite 2"] = Vector3.new(-128.29, 3.06, 1064.05),
    ["Seaside 1"] = Vector3.new(55.69, 2.94, -1403.60),
    ["Seaside 2"] = Vector3.new(42.39, 2.94, 1336.14)
}

local premium_locations = {
    ["Police Helicopter"] = Vector3.new(-127.95, 46.34, 34.83)
}

local Subway_TP = {
            ["Blackhawk: Subway"] = Vector3.new(-183.91, -14.99, 354.68),
            ["Crown Pointe: Subway"] = Vector3.new(-238.16, 47.65, -429.55),
            ["Lake Madison: Subway"] = Vector3.new(8.01, -15.05, 1016.47),
            ["Downtown: Subway"] = Vector3.new(23.59, -14.65, 78.88)
}

local Secret_TP = {
	["Secret 1"] = Vector3.new(-6.78, -133.98, 15.02)
}
	
Tab12:AddDropdown({
    Name = "Brookhaven Locations",
    Description = "Select a location to teleport to",
    Default = teleportLocation,
    Multi = false,
    Options = {
        "Hill",
        "Main Square",
        "Bank",
	    "Bank Vault",
        "Police",
        "Hospital",
        "City Hall",
        "Farm",
        "Market",
        "Grocery",
        "Airport",
        "Hotel",
        "School",
        "Fire Station",
        "Solar Panel",
        "Food Mart",
        "Auto Repair Shop",
        "Burger Barn",
        "Club Brooks",
        "Droneview",
        "Lake Madison",
	    "Lake Yacht",
        "Campsite 1",
        "Campsite 2",
        "Seaside 1",
        "Seaside 2"
    },
    Callback = function(value)
        teleportLocation = value
    end
})

Tab12:AddButton({
    Name = "Teleport",
    Description = "Teleports to the selected location",
    Callback = function()
        if teleportPlayer.Character and teleportPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = teleportPlayer.Character.HumanoidRootPart
            local humanoid = teleportPlayer.Character:FindFirstChildOfClass("Humanoid")
            local pos = locations[teleportLocation]
            if pos then
                pcall(function()
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        humanoid.WalkSpeed = 0
                    end
                    humanoidRootPart.Anchored = true
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    task.wait(0.4)
                    humanoidRootPart.Anchored = false
                    if humanoid then
                        humanoid.WalkSpeed = 16
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end)
            end
        end
    end
})

Tab12:AddSection({"Premium Teleport"})

Tab12:AddDropdown({
    Name = "Premium Locations",
    Description = "Select a premium location to teleport to",
    Default = premiumLocation,
    Multi = false,
    Options = {
            "Police Helicopter"
        },
    Callback = function(value)
            premiumLocation = value
        end
    })
        
Tab12:AddButton({
    Name = "Teleport",
    Description = "Teleports to the selected premium location",
    Callback = function()
        if teleportPlayer.Character and teleportPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = teleportPlayer.Character.HumanoidRootPart
            local humanoid = teleportPlayer.Character:FindFirstChildOfClass("Humanoid")
            local pos = premium_locations[premiumLocation]
            if pos then
                pcall(function()
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        humanoid.WalkSpeed = 0
                    end
                    humanoidRootPart.Anchored = true
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    task.wait(0.4)
                    humanoidRootPart.Anchored = false
                    if humanoid then
                        humanoid.WalkSpeed = 16
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end)
            end
        end
    end
})

Tab12:AddSection({"Subway Teleport"})

Tab12:AddDropdown({
        Name = "Subway Locations",
        Description = "Select a subway to teleport to",
        Default = subwayLocation,
        Multi = false,
        Options = {
            "Blackhawk: Subway",
            "Crown Pointe: Subway",
            "Lake Madison: Subway",
            "Downtown: Subway"
        },
        Callback = function(value)
            subwayLocation = value
        end
    })

Tab12:AddButton({
    Name = "Teleport",
    Description = "Teleports to the selected subway location",
    Callback = function()
        if teleportPlayer.Character and teleportPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = teleportPlayer.Character.HumanoidRootPart
            local humanoid = teleportPlayer.Character:FindFirstChildOfClass("Humanoid")
            local pos = Subway_TP[subwayLocation]
            if pos then
                pcall(function()
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        humanoid.WalkSpeed = 0
                    end
                    humanoidRootPart.Anchored = true
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    task.wait(0.4)
                    humanoidRootPart.Anchored = false
                    if humanoid then
                        humanoid.WalkSpeed = 16
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end)
            end
        end
    end
})

Tab12:AddSection({"Secret Teleport"})
Tab12:AddDropdown({
	Name = "Secret Locations",
	Description = "Select a secret location to teleport to",
	Default = secretLocation,
	Multi = false,
	Options = {
		"Secret 1"
	},
	Callback = function(value)
		secretLocation = value
	end
})
Tab12:AddButton({
    Name = "Teleport",
    Description = "Teleports to the selected secret location",
    Callback = function()
        if teleportPlayer.Character and teleportPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = teleportPlayer.Character.HumanoidRootPart
            local humanoid = teleportPlayer.Character:FindFirstChildOfClass("Humanoid")
            local pos = Secret_TP[secretLocation]
            if pos then
                pcall(function()
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                        humanoid.WalkSpeed = 0
                    end
                    humanoidRootPart.Anchored = true
                    humanoidRootPart.CFrame = CFrame.new(pos)
                    task.wait(0.4)
                    humanoidRootPart.Anchored = false
                    if humanoid then
                        humanoid.WalkSpeed = 16
                        humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end)
            end
        end
    end
})
Tab12:AddSection({"Olympics Teleport [ SOON ]"})
--=========================== TAB 13 : VISUAL =======================================
Tab13:AddParagraph({"❗ THIS FUNCTION IS NOT WORKING ANYMORE [ PATCHED ]"})
Tab13:AddParagraph({"This tab will be deleted soon!"})
Tab13:AddParagraph({"🔔 REMINDER!", "THIS VISUAL GAMEPASS FUNCTION MIGHT ONLY WORK ON SOME USERS, PLEASE LET US KNOW IF IT WORKS ON YOUR DEVICE." })
Tab13:AddParagraph({"UPCOMING VISUAL", "House Pool \n MORE!"})

Tab13:AddSection({"Visual Gamepass"})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")

Tab13:AddButton({
    Name = "Car Fire",
    Description = "Activate or deactivate fire on the car when clicked",
    Callback = function()
        -- Track fire toggle state globally
        if _G.fireActive == nil then
            _G.fireActive = false
        end

        _G.fireActive = not _G.fireActive

        if _G.fireActive then
            -- Activate fire
            local args = {"Fire"}
            remoteEvent:FireServer(unpack(args))
            print("Fire activated")
        else
            -- Deactivate fire - if you know the exact command, replace here; else skip or send "Stop"
            local args = {"Stop"}
            remoteEvent:FireServer(unpack(args))
            print("Fire deactivated")
        end
    end
})
-- UI Tab object from your UI library

Tab13:AddButton({
    Name = "Car Speed [ 200 ]",
    Description = "Activate or deactivate speed pass function when clicked",
    Callback = function()
        -- Example toggle behavior on button click:
        -- You can track state externally or toggle each click
        -- Here is a simple toggle state using a local variable
        
        -- Store toggle state outside the function scope
        if _G.speedBoostActive == nil then
            _G.speedBoostActive = false
        end
        
        _G.speedBoostActive = not _G.speedBoostActive
        
        if _G.speedBoostActive then
            -- Activate speed boost
            local args = {"200PlayerGiveSpeed", "200"}
            remoteEvent:FireServer(unpack(args))
            print("Speed boost activated")
        else
            -- Deactivate speed boost
            local args = {"200PlayerGiveSpeed", "0"}
            remoteEvent:FireServer(unpack(args))
            print("Speed boost deactivated")
        end
    end
})

Tab13:AddParagraph({"More function here soon!", "Mag hintay kayo! Nasa school pa 'yung developer oh"})
Tab13:AddParagraph({"If any function didn't work, report directly.", "report agad ya! 'wag ng patumpik-tumpik pa."})

--============================= TAB 14 : UPDATES ======================================--
Tab14:AddSection({""})
Tab14:AddParagraph({"🔔 REMINDER: Latest updates are based on date released."})
Tab14:AddParagraph({"✅ Current Version: 1.3.1"})
Tab14:AddSection({"Updates Logs"})
Tab14:AddParagraph({"📜 Updates [ v1.2 ] - June 13, 2025", "+ New Teleportation \n + Police Station [ Teleport ] \n + Fire Station [ Teleport ] \n + Campsite 1 [ Teleport ] \n + Campsite 2 [ Teleport ] \n + Solar Panel [ Teleport ] \n + Airport [ Teleport ] \n + Motel [ Teleport ] \n + Bank [ Teleport ] \n + Grocery [ Teleport ] \n + Hospital [ Teleport ] \n + Seaside 1 [ Teleport ] \n + Seaside 2 [ Teleport ] \n + City Hall [ Teleport ] \n + Main Square [ Teleport ] \n + Fixed Remove Ban House [ 100% working ] \n + Fixed Meme Sound not playing \n + Fixed Walkspeed Slider \n + Fixed some bugs"})
Tab14:AddParagraph({"📜 Updates [ v1.2.5 ] - June 13, 2025", "+ Added Fly GUI \n + Added No Clip \n + Added Infinite Jump \n + Added ESP RGB \n + Added Anti Sit \n + Added Bring Car \n + Added Troll Selected Car \n + Added Troll All Car \n + Added Fling \n + Added Music [ ID ] \n + Added Copy Avatar \n + Added Troll Players \n + Added Scripts Tab [ UNIVERSALS ] \n + Removed Lag Server [ ISSUES Found ] \n + Removed Some Functions [ ISSUES Found ] \n + Fixed Teleportation \n + Fixed Everything"})
Tab14:AddParagraph({"📜 Updates [ v1.2.7 ] - June 14, 2025", "+ Added Buong Bansa [ Walang Pake ] Meme Sound \n + Added Teleportation \n + Food Mart \n + Auto Shop/Mall \n + Club Brooks \n + Burger Barn \n + Fixed Music Not Playing \n + Fixed Fly Not Loading \n + Fixed Reset Movement Setting \n + Fixed Copy Avatar Not Copying \n + Fixed Equip Accessories Not Equipping \n + Fixed Troll Car Not Finding A Car \n + Fixed Teleport to Player \n + Fixed Updates List [ including player's list ] \n + Fixed ESP super laggy [ FREEZE ] \n + Fixed Fling \n + Fixed RGB changing color"})
Tab14:AddParagraph({"📜 Updates [ v1.2.9 ] - June 18, 2025", "+ Added Reminder in some functions \n + Added New Sound \n + Fixed Troll Selected Car \n + Fixed Bring Selected Car \n + Fixed FOV of Selected Car \n + Fixed Teleportation \n + Fixed Music not playing \n + Fixed Loop Music \n + Fixed Copy Avatar \n + Fixed 3D Clothing \n + Fixed Infinite Jump \n + Fixed Walkspeed \n + Fixed Some Bugs"})
Tab14:AddParagraph({"📜 Updates [ v1.3.0 ] - June 21, 2025", "+ Added Fling All V2 \n + Added Spam Chat \n + Added Spam Chat Delay \n + Added Spam Chat V2 \n + Added Clear Chat \n + Added Ballerina Cappuccina Head Accessory \n + Fixed Script Executing + Fixed Fling + Fixed Premium Teleportation + Fixed some bugs..."})
Tab14:AddParagraph({"📜 Updates [ v1.3.1 ] - June 22, 2025", "+ Secret Teleport \n - Secret ;) \n + New Teleport Location \n + New Tab [ Server ] \n + Displays current server Job Id \n + Copy Current Game Job Id \n + Textbox Input [ Job Id ] \n + Join Server [ Job Id ] \n + Server Hop \n + Rejoin Current Server \n + Fixed RGB Speed \n + Fixed Avatar Name RGB \n + Fixed Avatar Bio RGB \n + Fixed Other RGB [ more stable now! ] \n + Fixed Executor Detecting [ more stable now! ] \n + Fixed Remove Ban House \n + Fixed Copy Avatar \n + Fixed 3D Accessory Equip \n + Fixed some bugs..."})
Tab14:AddParagraph({"📜 Updates [ v1.3.2 ] - February 21, 2026", "+ Fixed Some Bugs \n + Fixed Chat Function \n + Better Stability and Performance"})
--[[ 

THIS IS THE BOTTOM OF THE CODE, CONTACT US FOR MORE FUN FUNCTION! 🙂 

]]


