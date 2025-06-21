local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "CHED 被遗弃 | Forsaken - noe-kemono",
   Icon = 0, 
   LoadingTitle = "Forsaken | Loading",
   LoadingSubtitle = "NOE-Kemono",
   Theme = "Light",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "saver", 
      FileName = "K"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", 
      SaveKey = true, --
      GrabKeyFromSite = false,
      Key = {"Hello"} 
   }
})
local PlayerTab = Window:CreateTab("主要")
local EspTab = Window:CreateTab("绘制")
local ATab = Window:CreateTab("体力")
local ElitoTab = Window:CreateTab("Ellito🍕")
local MTab = Window:CreateTab("美化")
local DiscordTab = Window:CreateTab("信息")
local SettingsTab = Window:CreateTab("设置")
local ActiveSpeedBoost,ActiveAutoUseCoinFlip,ActiveEspSurvivors,ActiveNoStun,ActiveEspKillers,ActiveEspGenerator,ActiveEspItems,ActiveInfiniteStamina,ActiveEspRagdolls,ActiveAutoGenerator,AutoKillSurvivors = false,false,false,false,false,false,false,false,false,false

Rayfield:Notify({
   Title = "检查版本ing…",
   Content = "✅ | V.0.19/V.load =...'vion'...",
   Duration = 2.5,
   Image = "rewind",
})

local function CreateEsp(Char,Color,Text,Parent)
if Char then
local NewHighlight = Instance.new("Highlight",Char)
NewHighlight.OutlineColor = Color NewHighlight.FillColor = Color
end
end

local function KeepEsp(Char)
if Char and Char:FindFirstChildOfClass("Highlight") then
Char:FindFirstChildOfClass("Highlight"):Destroy()
end
end

local EspSurvivorsToggle = EspTab:CreateToggle({
   Name = "绘制幸存者(绿色)",
   CurrentValue = false,
   Flag = "EspSurvivors",
   Callback = function(Value)
  ActiveEspSurvivors = Value task.spawn(function()
while ActiveEspSurvivors do task.spawn(function()
for _,Players in pairs(Game.Workspace.Players.Survivors:GetChildren()) do 
if Players:isA("Model") and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(0,255,0))
end
end
end)
task.wait(0.1)
end for _,Players in pairs(Game.Workspace.Players.Survivors:GetChildren()) do 
if Players:isA("Model") and Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players)
end
end 
 end)
end,
})

local EspKillersToggle = EspTab:CreateToggle({
   Name = "绘制杀手(红色)",
   CurrentValue = false,
   Flag = "EspKiller", 
   Callback = function(Value)
  ActiveEspKillers = Value task.spawn(function()
while ActiveEspKillers do task.spawn(function()
for _,Players in pairs(Game.Workspace.Players.Killers:GetChildren()) do 
if Players:isA("Model") and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(255,0,0))
end
end
end)
task.wait(0.1)
end for _,Players in pairs(Game.Workspace.Players.Killers:GetChildren()) do 
if Players:isA("Model") and Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players)
end
end 
 end)
end,
}) local EspGeneratorToggle = EspTab:CreateToggle({
   Name = "绘制发电机(黄色)",
   CurrentValue = false,
   Flag = "EspGenerator", 
   Callback = function(Value)
  ActiveEspGenerator= Value task.spawn(function()
while ActiveEspGenerator do
if Game.Workspace.Map.Ingame:FindFirstChild("Map") then
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator" and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(255,255,0))
end
end
end
task.wait(0.1) 
end
if Game.Workspace.Map.Ingame:FindFirstChild("Map") then
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator" and not Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players) end
end
end
 end)
end,
})
local EspItemsToggle = EspTab:CreateToggle({
   Name = "绘制物品(蓝色)",
   CurrentValue = false,
   Flag = "EspItems", 
   Callback = function(Value)
  ActiveEspItems= Value task.spawn(function()
while ActiveEspItems do
for _,Players in pairs(Game.Workspace.Map.Ingame:GetChildren()) do 
if Players:isA("Tool")  and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(0,0,255))
end
end
task.wait(0.1) end
for _,Players in pairs(Game.Workspace.Map.Ingame:GetChildren()) do 
if Players:isA("Tool")  and not Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players) end
end
 end)
end,
})

local ValueSpeed = 16
local PlayerSpeedSlider = PlayerTab:CreateSlider({
   Name = "玩家速度(太高容易封)",
   Range = {0, 25},
   Increment = 1,
   Suffix = "Speeds",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
CurrentValue = Value
ValueSpeed = Value
end,  ValueSpeed = CurrentValue,
})

local PlayerActiveModifyingSpeedToggle = PlayerTab:CreateToggle({
   Name = "⬆️ 确定修改",
   CurrentValue = false,
   Flag = "ButtonSpeed", 
   Callback = function(Value)
  ActiveSpeedBoost = Value 
task.spawn(function()
while ActiveSpeedBoost do 
task.spawn(function()
Game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ValueSpeed 
Game.Players.LocalPlayer.Character.Humanoid:SetAttribute("BaseSpeed",ValueSpeed)
end)
task.wait(0.1)
end end)
end,
}) local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
    else
        warn("setclipboard is not supported in this environment.")
    end
end
local DiscordLink = DiscordTab:CreateButton({
   Name = "制作纯缝合",
   Callback = function()
Rayfield:Notify({
   Title = "别搞!",
   Content = "别按我",
   Duration = 2.5,
   Image = "rewind",
})
end,
})
local PlayerActiveAutoGeneratorToggle = PlayerTab:CreateToggle({
   Name = "自动修电机(每次一坤秒)",
   CurrentValue = false,
   Flag = "ButtonAutoGen", 
   Callback = function(Value)
  ActiveAutoGenerator = Value task.spawn(function()
while ActiveAutoGenerator do task.spawn(function()
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator"  then if Players:FindFirstChild("Remotes"):FindFirstChild("RE") then Players:FindFirstChild("Remotes"):FindFirstChild("RE"):FireServer() end
 end
end end)
task.wait(2.5)
end end)
end,
}) 

local PlayerNoStunToggle = PlayerTab:CreateToggle({
   Name = "不会被击晕",
   CurrentValue = false,
   Flag = "NoStunButton",
   Callback = function(Value)
  ActiveNoStun = Value task.spawn(function()
while ActiveNoStun do task.spawn(function()
Game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end)
task.wait(0.001)
end end)
end,
})
local PlayerAutoUseCoinFlipToggle = PlayerTab:CreateToggle({
   Name = "自动翻金币(机会专用)",
   CurrentValue = false,
   Flag = "AutoUseCoinFlipbutton", 
   Callback = function(Value)
  ActiveAutoUseCoinFlip = Value task.spawn(function()
while ActiveAutoUseCoinFlip do task.spawn(function()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.Modules.Network.RemoteEvent -- RemoteEvent 

RemoteEvent:FireServer(
    "UseActorAbility",
    "CoinFlip"
)

end)
task.wait(1)
end end)
end,
})

local PlayerActiveAutoKillSurvivorsToggle = PlayerTab:CreateToggle({
   Name = "自动杀幸存者(小心家里的两位😏)",
   CurrentValue = false,
   Flag = "ButtonAutoKillSurvivors", 
   Callback = function(Value)
  ActiveAutoKillSurvivors = Value task.spawn(function()
while ActiveAutoKillSurvivors do 
task.spawn(function()
for _,Players in pairs(Game.Workspace.Players.Survivors:GetChildren()) do 
if Players:isA("Model") then
Game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Players.HumanoidRootPart.CFrame
task.spawn(function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RemoteEvent = ReplicatedStorage.Modules.Network.RemoteEvent -- RemoteEvent 

RemoteEvent:FireServer(
    "UseActorAbility",
    "Slash"
)

wait(2.5)
end)
end
end
end)
task.wait(0.1)
end end)
end,
}) local Choosed = "nothings"
local DropdownTpGen = PlayerTab:CreateDropdown({
   Name = "选择传送地点",
   Options = {},
   CurrentOption = {"Nothings"},
   MultipleOptions = false,
   Flag = nil,
   Callback = function(Options)   task.spawn(function()
for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator"  then 
if Players:FindFirstChild("GeneratorTP") then 
if Players:FindFirstChild("GeneratorTP").Value == DropdownTpGen.CurrentOption then 
Game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Players.PrimaryPart.CFrame 
end  end 
 end
end  end)
   end,
})
local PlayerRefreshGenButton = PlayerTab:CreateButton({
   Name = "⬆️ 刷新一次",
   Callback = function(Value) local num = 1
task.spawn(function() local GenTable = {} for _,Players in pairs(Game.Workspace.Map.Ingame:FindFirstChild("Map"):GetChildren()) do 
if Players:isA("Model") and Players.name == "Generator"  then table.insert(GenTable,"Generator ".. num) if not  Players:FindFirstChild("GeneratorTP") then task.spawn(function() local NewValue = Instance.new("StringValue",Players) NewValue.Name = "GeneratorTP" NewValue.Value = "Generator "..num end) end num = num +1
 end
end 
    DropdownTpGen:Refresh(GenTable)
end)
end,
})
local EspRagdollsToggle = EspTab:CreateToggle({
   Name = "绘制尸体和召唤傀儡(1×1×1×1)和奴才(c00lkidd)",
   CurrentValue = false,
   Flag = "EspRagdolls", 
   Callback = function(Value)
  ActiveEspRagdolls = Value task.spawn(function()
while ActiveEspRagdolls do task.spawn(function()
for _,Players in pairs(Game.Workspace.Ragdolls:GetChildren()) do 
if Players:isA("Model") and not Players:FindFirstChildOfClass("Highlight") then
CreateEsp(Players,Color3.fromRGB(47,47,47))
end
end
end)
task.wait(0.1)
end for _,Players in pairs(Game.Workspace.Ragdolls:GetChildren()) do 
if Players:isA("Model") and Players:FindFirstChildOfClass("Highlight") then
KeepEsp(Players)
end
end 
 end)
end,
})

local PlayerActiveInfStaminaToggle = ATab:CreateToggle({
   Name = "无限体力(Beta)",
   CurrentValue = false,
   Flag = "ButtonInfiniteStamina", 
   Callback = function(Value)
  ActiveInfiniteStamina = Value task.spawn(function()
while ActiveInfiniteStamina do task.spawn(function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UnreliableRemoteEvent = ReplicatedStorage.Modules.Network.UnreliableRemoteEvent
UnreliableRemoteEvent:FireServer("FootstepPlayed",100)
end)
task.wait(0.00000001)
end end)
end,
})

local SliderInfiniteStamina = ATab:CreateSlider({
   Name = "体力上限",
   Range = {0, 100},
   Increment = 10,
   Suffix = "Bananas",
   CurrentValue = 10,
   Flag = "SliderInfiniteStamina", 
   Callback = function(Value)
   local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local stamina = require(Sprinting)
stamina.MaxStamina = Value
stamina.StaminaLossDisabled = true 
   end,
})

local SliderGainStamina = ATab:CreateSlider({
   Name = "体力回复速度",
   Range = {5, 100},
   Increment = 5,
   Suffix = "Bananas",
   CurrentValue = 5,
   Flag = "SliderGainStamina",
   Callback = function(Value)
      local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local stamina = require(Sprinting)
stamina.StaminaGain = Value
stamina.StaminaLossDisabled = true 
   end,
})

local SliderSpeedStamina = ATab:CreateSlider({
   Name = "奔跑速度",
   Range = {16, 50},
   Increment = 16,
   Suffix = "Bananas",
   CurrentValue = 16,
   Flag = "SliderSpeedStamina", -
   Callback = function(Value)
     local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local stamina = require(Sprinting)
stamina.SprintSpeed = Value
stamina.StaminaLossDisabled = true 
   end,
})

local ButtonUnloadCheat = ElitoTab:CreateButton({
   Name = "变态Ellito(暨披萨，披萨时撸管，ELLIOT 不穿衬衫和裤子)",
   Callback = function()
--make naked elliot
local elliotshirt = game.workspace.Players.Survivors.Elliot.Shirt
if elliotshirt then
    elliotshirt:Destroy()
else
    print("no shirt roblox")
end

local elliotpants = game.workspace.Players.Survivors.Elliot.Pants
if elliotpants then
    elliotpants:Destroy()
else
    print("no pants elliot roblox")
end

local elliotcolor = workspace.Players.Survivors.Elliot["Body Colors"]

elliotcolor.RightLegColor = BrickColor.new("New Yeller")
elliotcolor.LeftLegColor = BrickColor.new("New Yeller")
elliotcolor.TorsoColor = BrickColor.new("New Yeller")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")

if torso then
   
    local ball1 = Instance.new("Part")
    ball1.Material = Enum.Material.Glass
    ball1.Size = Vector3.new(0.4, 0.4, 1.5)
    ball1.Shape = Enum.PartType.Ball
    ball1.Anchored = false
    ball1.CanCollide = false
    ball1.Transparency = 0
    ball1.Color = Color3.fromRGB(255, 255, 0)
    ball1.Name = "AttachedBall1"
    ball1.Parent = torso

    local weld1 = Instance.new("Weld")
    weld1.Part0 = torso
    weld1.Part1 = ball1
    weld1.C0 = CFrame.new(0, -0.8, -1.1) * CFrame.Angles(math.rad(30), 0, 0) 
    weld1.Parent = ball1
    ball1.CFrame = torso.CFrame * weld1.C0

    local ball2 = Instance.new("Part")
    ball2.Material = Enum.Material.Glass
    ball2.Size = Vector3.new(0.5, 0.5, 0.5)
    ball2.Shape = Enum.PartType.Ball
    ball2.Anchored = false
    ball2.CanCollide = false
    ball2.Transparency = 0
    ball2.Color = Color3.fromRGB(255, 0, 181) 
    ball2.Name = "AttachedBall2"
    ball2.Parent = torso

    local weld2 = Instance.new("Weld")
    weld2.Part0 = torso
    weld2.Part1 = ball2
    weld2.C0 = CFrame.new(0, -0.5, -1.6) * CFrame.Angles(math.rad(30), 0, 0) 
    weld2.Parent = ball2
    ball2.CFrame = torso.CFrame * weld2.C0

    print("Attached 2 balls to torso!")
else
    warn("Torso not found!")
end

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function getCharacter()
    return player.Character or player.CharacterAdded:Wait()
end

local function isR15(character)
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    return humanoid and humanoid.RigType == Enum.HumanoidRigType.R15
end

local isPlaying = false
local track = nil

local function playAnimationLoop()
    if isPlaying then return end 
    isPlaying = true

    local character = getCharacter()
    local humanoid = character:WaitForChild("Humanoid")

    if track then
        track:Stop()
        track = nil
    end

    local useR15 = isR15(character)

    local anim = Instance.new("Animation")
    anim.AnimationId = not useR15 and "rbxassetid://72042024" or "rbxassetid://698251653"
    track = humanoid:LoadAnimation(anim)

    track.Looped = true
    track:Play()
    track:AdjustSpeed(useR15 and 0.7 or 0.65)
    track.TimePosition = 0.6

    task.wait(1.5)

    if track then
        track:Stop()
        track = nil
    end

    isPlaying = false
end


UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end 
    if input.KeyCode == Enum.KeyCode.Q then
        playAnimationLoop()
    end
end)

local handpizza = workspace.Players.Survivors.Elliot.Pizza
local meshpizzahand = handpizza:FindFirstChild("Mesh")
meshpizzahand:Destroy()
handpizza.Size = Vector3.new(0, 0, 0)

local runLoopValue = Instance.new("BoolValue")
runLoopValue.Name = "RunPizzaLoop"
runLoopValue.Value = false
runLoopValue.Parent = game.Workspace


local function setLoopActive(active)
    runLoopValue.Value = active
end


delay(3, function()
    setLoopActive(true)
end)


local processedPizzas = {}


while true do
    if runLoopValue.Value == true then
        local mapFolder = game.workspace:FindFirstChild("Map")
        if mapFolder then
            local ingameFolder = mapFolder:FindFirstChild("Ingame")
            if ingameFolder then
                for _, pizzaPart in pairs(ingameFolder:GetChildren()) do
                    
                    if pizzaPart.Name == "Pizza" and not processedPizzas[pizzaPart] then
                        processedPizzas[pizzaPart] = true 
                        print("Processing NEW Pizza part:", pizzaPart)

                        
                        local mesh = pizzaPart:FindFirstChild("Mesh")
                        if mesh then
                            mesh:Destroy()
                            print("Destroyed mesh in pizza:", pizzaPart)
                        else
                            print("No mesh found in pizza:", pizzaPart)
                        end

                        
                        pizzaPart.Shape = Enum.PartType.Block

                       
                        local sphereMesh = Instance.new("SpecialMesh")
                        sphereMesh.MeshType = Enum.MeshType.Sphere
                        sphereMesh.Scale = Vector3.new(1, 0.1, 1)  
                        sphereMesh.Parent = pizzaPart


                       
                        pizzaPart.BrickColor = BrickColor.new("Institutional white")
                    end
                end
            end
        end
    end
    wait() 
end
end,
})

local ButtonUnloadCheat = MTab:CreateButton({
   Name = "变成约翰-多",
   Callback = function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- GUI principal
local blackScreen = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
blackScreen.IgnoreGuiInset = true
blackScreen.ResetOnSpawn = false
blackScreen.Name = "JohnDoeCinematic"

-- Tela preta
local fullBlack = Instance.new("Frame", blackScreen)
fullBlack.Size = UDim2.new(1, 0, 1, 0)
fullBlack.BackgroundColor3 = Color3.new(0, 0, 0)
fullBlack.BorderSizePixel = 0

-- Música
local music = Instance.new("Sound", SoundService)
music.SoundId = "rbxassetid://75370064485301"
music.Volume = 1
music:Play()

-- Após 3 segundos
task.delay(3, function()
	-- Barras superior e inferior
	local topBar = Instance.new("Frame", blackScreen)
	topBar.Size = UDim2.new(1, 0, 0, 0)
	topBar.Position = UDim2.new(0, 0, 0, 0)
	topBar.BackgroundColor3 = Color3.new(0, 0, 0)
	topBar.BorderSizePixel = 0
	topBar.ZIndex = 2

	local bottomBar = Instance.new("Frame", blackScreen)
	bottomBar.Size = UDim2.new(1, 0, 0, 0)
	bottomBar.Position = UDim2.new(0, 0, 1, 0)
	bottomBar.BackgroundColor3 = Color3.new(0, 0, 0)
	bottomBar.BorderSizePixel = 0
	bottomBar.ZIndex = 2

	TweenService:Create(topBar, TweenInfo.new(1), {Size = UDim2.new(1, 0, 0.15, 0)}):Play()
	TweenService:Create(bottomBar, TweenInfo.new(1), {
		Size = UDim2.new(1, 0, 0.15, 0),
		Position = UDim2.new(0, 0, 0.85, 0)
	}):Play()

	-- Esconde tela preta
	fullBlack:Destroy()

	-- Congelar personagem
	local char = player.Character
	if char and char:FindFirstChildOfClass("Humanoid") then
		char:FindFirstChildOfClass("Humanoid").WalkSpeed = 0
		char:FindFirstChildOfClass("Humanoid").JumpPower = 0
	end

	-- Câmera focando no rosto
	local head = char:FindFirstChild("Head")
	if head then
		RunService:BindToRenderStep("LockCamera", Enum.RenderPriority.Camera.Value + 1, function()
			camera.CFrame = CFrame.new(head.Position + head.CFrame.lookVector * 5, head.Position)
		end)
	end

	-- Caixa de fundo com borda
	local box = Instance.new("Frame", blackScreen)
	box.Size = UDim2.new(0.6, 0, 0.18, 0)
	box.Position = UDim2.new(0.2, 0, 0.75, 0)
	box.BackgroundColor3 = Color3.new(0, 0, 0)
	box.BorderColor3 = Color3.new(1, 1, 1)
	box.BorderSizePixel = 3
	box.ZIndex = 3

	-- Texto "the killer is"
	local text1 = Instance.new("TextLabel", box)
	text1.Size = UDim2.new(1, 0, 0.5, 0)
	text1.Position = UDim2.new(0, 0, 0, 0)
	text1.BackgroundTransparency = 1
	text1.Text = "the killer is"
	text1.TextScaled = true
	text1.Font = Enum.Font.GothamBlack
	text1.TextColor3 = Color3.new(1, 1, 1)
	text1.ZIndex = 4

	-- Texto "JOHN DOE"
	local text2 = Instance.new("TextLabel", box)
	text2.Size = UDim2.new(1, 0, 0.5, 0)
	text2.Position = UDim2.new(0, 0, 0.5, 0)
	text2.BackgroundTransparency = 1
	text2.Text = "JOHN DOE"
	text2.TextScaled = true
	text2.Font = Enum.Font.GothamBlack
	text2.TextColor3 = Color3.new(1, 0, 0)
	text2.ZIndex = 4
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local myChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Cria o som
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://105804403990611"
sound.Looped = true
sound.Volume = 5

local currentSegment = nil
local playing = false
local fadeDuration = 0.3  -- Tempo para a transição de volume (em segundos)

-- Função para reduzir o volume (fade out)
function fadeOutSound()
    local startVolume = sound.Volume
    local elapsed = 0

    while elapsed < fadeDuration do
        sound.Volume = startVolume * (1 - elapsed / fadeDuration)
        elapsed = elapsed + 0.1
        task.wait(0.1)
    end
    sound.Volume = 0
end

-- Função para aumentar o volume (fade in)
function fadeInSound()
    sound.Volume = 0
    local targetVolume = 5  -- Volume final após a transição
    local elapsed = 0

    while elapsed < fadeDuration do
        sound.Volume = (elapsed / fadeDuration) * targetVolume
        elapsed = elapsed + 0.1
        task.wait(0.1)
    end
    sound.Volume = targetVolume
end

-- Função para tocar o segmento da música
function playSegment(startTime, endTime)
    if currentSegment == startTime then return end
    currentSegment = startTime

    -- Fazer a transição suave para o próximo segmento
    task.spawn(function()
        if playing then
            -- Espera o fadeOut acabar antes de tocar o novo segmento
            fadeOutSound()
        end

        -- Muda a posição do som e espera o fadeOut terminar antes de continuar
        sound.TimePosition = startTime
        fadeInSound()

        if not sound.IsPlaying then sound:Play() end
        playing = true
    end)
end

-- Função para encontrar o jogador mais próximo
function getNearestPlayer()
    local minDist = math.huge
    local closest = nil

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and myChar:FindFirstChild("HumanoidRootPart") then
            local dist = (myChar.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if dist < minDist then
                minDist = dist
                closest = player
            end
        end
    end
    return closest, minDist
end

task.spawn(function()
    while true do
        myChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local target, dist = getNearestPlayer()

        -- Verifica se o som deve ser pausado ou tocado em diferentes segmentos com base na distância
        if not target or not dist or dist >= 30 then
            if playing then
                fadeOutSound()
                sound:Pause()
                playing = false
                currentSegment = nil
            end
        elseif dist >= 25 and dist < 30 then
            playSegment(0, 9)
        elseif dist >= 20 and dist < 25 then
            playSegment(9, 19)
        elseif dist >= 15 and dist < 20 then
            playSegment(19, 39)
        elseif dist < 15 then
            playSegment(39, sound.TimeLength)
        end

        -- Espera antes de verificar novamente
        task.wait(0.5)
    end
end)


-- Quando a música terminar, limpa tudo
music.Ended:Connect(function()
	local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("JohnDoeCinematic")
	if gui then gui:Destroy() end
	RunService:UnbindFromRenderStep("LockCamera")
	if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
		player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
		player.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
	end
end)

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local podeUsar = true

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E and podeUsar then
        podeUsar = false

        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then return end

        -- Iniciar animação travada
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://204062532"
        local track = humanoid:LoadAnimation(anim)
        track.Looped = false
        track:Play()
        track.TimePosition = 0.7
        track:AdjustSpeed(0)

        local animDescongelada = false
        local fixAnim = RunService.RenderStepped:Connect(function()
            if not animDescongelada and track.IsPlaying then
                track.TimePosition = 0.7
            elseif animDescongelada then
                fixAnim:Disconnect()
            end
        end)

        humanoid.WalkSpeed = 35
        local moveDir = root.CFrame.LookVector
        local startTime = tick()
        local hitAlguem = false
        local cancelado = false

        -- Conexões de toque
        local conns = {}
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                local conn = part.Touched:Connect(function(hit)
                    if cancelado then return end

                    local victim = hit:FindFirstAncestorOfClass("Model")
                    if victim and victim ~= char then
                        local victimHumanoid = victim:FindFirstChildOfClass("Humanoid")
                        if victimHumanoid and victimHumanoid.Health > 0 then
                            victimHumanoid:TakeDamage(100)
                            hitAlguem = true
                            animDescongelada = true
                            track:AdjustSpeed(1)  -- Descongela a animação
                            humanoid.WalkSpeed = 15  -- Para de andar automaticamente
                            cancelado = true -- Impede mais movimento
                            track:Stop()  -- Para a animação
                        end
                    else
                        -- Verifica se é uma parede (não chão)
                        local hitNormal = hit.CFrame.UpVector
                        local vertical = math.abs(hitNormal.Y)
                        if vertical < 0.5 then
                            cancelado = true
                            humanoid:TakeDamage(5)
                            humanoid.WalkSpeed = 15
                            track:Stop()
                            fixAnim:Disconnect()
                            for _, conn in ipairs(conns) do
                                conn:Disconnect()
                            end
                        end
                    end
                end)
                table.insert(conns, conn)
            end
        end

        -- Movimento automático por 5 segundos
        local moveConnection
        moveConnection = RunService.Heartbeat:Connect(function()
            if cancelado then
                moveConnection:Disconnect()
                return
            end
            if tick() - startTime <= 5 then
                root.Velocity = moveDir * humanoid.WalkSpeed
            else
                moveConnection:Disconnect()
                if not hitAlguem then
                    humanoid.WalkSpeed = 15
                    track:Stop()
                    fixAnim:Disconnect()
                end
                for _, conn in ipairs(conns) do
                    conn:Disconnect()
                end
            end
        end)

        -- Resetar botão após 6 segundos
        task.delay(6, function()
            podeUsar = true
        end)
    end
end)


-- Mostrar "I'M FREE FINALLY" quando morrer
local player = game.Players.LocalPlayer

-- Função para conectar ao evento de morte
local function setupDeathMessage(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(function()
        local deathHint = Instance.new("Hint")
        deathHint.Text = "I'M FREE FINALLY"
        deathHint.Parent = game.CoreGui
    end)
end

-- Se o personagem já estiver no jogo, conecta direto
if player.Character then
    setupDeathMessage(player.Character)
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local originalFOV = Camera.FieldOfView
local originalWalkSpeed = 16
local espParts = {}

function createESP(target)
    if target:FindFirstChild("HumanoidRootPart") and not espParts[target] then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = target
        highlight.FillColor = Color3.new(1, 1, 0) -- Amarelo
        highlight.OutlineTransparency = 1
        highlight.FillTransparency = 0.3
        highlight.Parent = target
        espParts[target] = highlight
    end
end

function removeAllESP()
    for _, highlight in pairs(espParts) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    espParts = {}
end

-- Detecta tecla "C"
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.X then
        -- Muda FOV e velocidade
        originalFOV = Camera.FieldOfView
        originalWalkSpeed = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed or 16
        Camera.FieldOfView = 14
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 6
        end

        -- Espera 0.7s
        wait(0.7)

        -- Aplica ESP
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                createESP(player.Character)
            end
        end

        -- Espera 2s e restaura tudo
        wait(2)
        Camera.FieldOfView = originalFOV
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = originalWalkSpeed
        end
        removeAllESP()
    end
end)

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

local musica = Instance.new("Sound")
musica.SoundId = "rbxassetid://12447316439"
musica.Volume = 1
musica.Looped = true
musica.Parent = SoundService

local dono = "KJ_32261"
local jogoFechado = false

-- Conta os jogadores vivos (com Humanoid)
local function contarPlayersVivos()
	local vivos = {}
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
			table.insert(vivos, player)
		end
	end
	return vivos
end

-- Verifica se só restam JJSPLOIT e mais uma pessoa
local function verificarCondicao()
	local vivos = contarPlayersVivos()
	if #vivos == 2 then
		local nomes = {vivos[1].Name, vivos[2].Name}
		if table.find(nomes, dono) then
			if not musica.IsPlaying then
				musica:Play()
			end
			jogoFechado = true
		end
	end
end

-- Remove Humanoid do jogador (impede que jogue)
local function removerHumanoid(player)
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid:Destroy()
	end
end

-- Quando um jogador entra
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		task.wait(1)
		if jogoFechado and player.Name ~= dono then
			removerHumanoid(player)
		end
	end)
end)

-- Quando um jogador sai ou morre, checar condições
Players.PlayerRemoving:Connect(function()
	task.wait(1)
	verificarCondicao()
end)

-- Monitorar mortes
game:GetService("RunService").Heartbeat:Connect(function()
	verificarCondicao()
end)

-- Serviços
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Cria e anima um espinho em uma posição
local function createSpike(position)
    local spike = Instance.new("Part")
    spike.Anchored = true
    spike.Size = Vector3.new(4, 1, 4)
    spike.BrickColor = BrickColor.new("Really black")
    spike.Material = Enum.Material.Metal
    spike.Position = Vector3.new(position.X, 0.5, position.Z)
    spike.CanCollide = true
    spike.Parent = workspace

    local mesh = Instance.new("SpecialMesh", spike)
    mesh.MeshType = Enum.MeshType.Wedge

    -- Mata quem tocar, exceto o jogador local
    spike.Touched:Connect(function(hit)
        local character = hit.Parent
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character:FindFirstChild("Humanoid")
            local touchingPlayer = Players:GetPlayerFromCharacter(character)

            -- Só mata se for outro jogador (não o local)
            if touchingPlayer and touchingPlayer ~= player then
                humanoid.Health = 0
            end
        end
    end)

    -- Animação do espinho subindo
    spawn(function()
        for i = 1, 20 do
            spike.Size = Vector3.new(4, i, 4)
            spike.Position = Vector3.new(position.X, i / 2, position.Z)
            wait(0.02)
        end
    end)
end

-- Cria 10 espinhos em linha, seguindo a direção atual da câmera
local function spawnSpikesDynamic()
    local spacing = 6
    local numSpikes = 30

    spawn(function()
        for i = 1, numSpikes do
            local camCF = camera.CFrame
            local origin = camCF.Position
            local forward = camCF.LookVector.Unit
            local offset = forward * (i * spacing)
            local pos = origin + offset

            createSpike(pos)
            wait(0.1)
        end
    end)
end

-- Quando tecla Z é pressionada, ativa os espinhos
UIS.InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.Z then
        spawnSpikesDynamic()
    end
end)

------------
--John Doe--
------------
-----by-----
--CKbackup--
------------

--Player Stuff--
player = game:GetService("Players").LocalPlayer
chara = player.Character

ch = chara:GetChildren()
for i = 1, #ch do
if ch[i].Name == "Torso" then
ch[i].roblox.Transparency = 1
elseif ch[i].Name == "Head" then
ch[i].face.Transparency = 1
ch[i].Transparency = 1
elseif ch[i].ClassName == "Accessory" or ch[i].ClassName == "Shirt" or ch[i].ClassName == "Pants" or ch[i].ClassName == "ShirtGraphic" then
ch[i]:Destroy()
end
end

chara["Left Arm"].BrickColor = BrickColor.new("Cool yellow")
chara["Right Arm"].BrickColor = BrickColor.new("Cool yellow")
chara["Left Leg"].BrickColor = BrickColor.new("Medium blue")
chara["Right Leg"].BrickColor = BrickColor.new("Medium blue")
chara.Torso.BrickColor = BrickColor.new("Bright yellow")

--Outfit--
New = function(Object, Parent, Name, Data)
	local Object = Instance.new(Object)
	for Index, Value in pairs(Data or {}) do
		Object[Index] = Value
	end
	Object.Parent = Parent
	Object.Name = Name
	return Object
end

function ScatterEff(part)
local eff1 = Instance.new("ParticleEmitter",part)
eff1.Size = NumberSequence.new(.1)
eff1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(.9,0),NumberSequenceKeypoint.new(1,1)})
eff1.LightEmission = 1
eff1.Lifetime = NumberRange.new(1)
eff1.Speed = NumberRange.new(1)
eff1.Rate = 100
eff1.VelocitySpread = 10000
eff1.Texture = "rbxassetid://347504241"
eff1.Color = ColorSequence.new(Color3.new(1,0,0))
local eff2 = Instance.new("ParticleEmitter",part)
eff2.Size = NumberSequence.new(.1)
eff2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(.9,0),NumberSequenceKeypoint.new(1,1)})
eff2.LightEmission = 1
eff2.Lifetime = NumberRange.new(1)
eff2.Speed = NumberRange.new(1)
eff2.Rate = 100
eff2.VelocitySpread = 10000
eff2.Texture = "rbxassetid://347504259"
eff2.Color = ColorSequence.new(Color3.new(1,0,0))
end

function BurningEff(part)
local eff1 = Instance.new("ParticleEmitter",part)
eff1.Size = NumberSequence.new(.1)
eff1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(.2,0),NumberSequenceKeypoint.new(1,1)})
eff1.LightEmission = 1
eff1.Lifetime = NumberRange.new(1)
eff1.Speed = NumberRange.new(0)
eff1.Rate = 100
eff1.Texture = "rbxassetid://347504241"
eff1.Acceleration = Vector3.new(0,10,0)
eff1.Color = ColorSequence.new(Color3.new(1,0,0))
local eff2 = Instance.new("ParticleEmitter",part)
eff2.Size = NumberSequence.new(.1)
eff2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(.2,0),NumberSequenceKeypoint.new(1,1)})
eff2.LightEmission = 1
eff2.Lifetime = NumberRange.new(1)
eff2.Speed = NumberRange.new(0)
eff2.Rate = 100
eff2.Texture = "rbxassetid://347504259"
eff2.Acceleration = Vector3.new(0,10,0)
eff2.Color = ColorSequence.new(Color3.new(1,0,0))
local eff3 = Instance.new("ParticleEmitter",part)
eff3.Size = NumberSequence.new(1)
eff3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})
eff3.LightEmission = 1
eff3.Lifetime = NumberRange.new(1)
eff3.Speed = NumberRange.new(0)
eff3.Rate = 100
eff3.Texture = "rbxasset://textures/particles/fire_main.dds"
eff3.Acceleration = Vector3.new(0,10,0)
eff3.Color = ColorSequence.new(Color3.new(1,0,0))
end

FakeHead = New("Model",chara,"FakeHead",{})
MainPart = New("Part",FakeHead,"MainPart",{FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(2, 1, 1),CFrame = CFrame.new(2.29537678, 7.81603718, 0.746068954, 0.00980896503, 0.00110200304, 0.999957919, -0.000536994543, 1.00000548, -0.00109680078, -0.99994874, -0.0005262224, 0.00980964955),CanCollide = false,TopSurface = Enum.SurfaceType.Smooth,})
Mesh = New("SpecialMesh",MainPart,"Mesh",{Scale = Vector3.new(1.25, 1.25, 1.25),})
face = New("Decal",MainPart,"face",{Texture = "rbxasset://textures/face.png",})
Weld = New("ManualWeld",MainPart,"Weld",{Part0 = MainPart,Part1 = chara.Head,C0 = CFrame.new(0, 0, 0, 0.00980896503, -0.000536994543, -0.99994874, 0.00110200304, 1.00000548, -0.0005262224, 0.999957919, -0.00109680078, 0.00980964955),C1 = CFrame.new(5.96046448e-008, -8.58306885e-006, 0, 0.00980896503, -0.000536994543, -0.99994874, 0.00110200304, 1.00000548, -0.0005262224, 0.999957919, -0.00109680078, 0.00980964955),})
FakeHead.MainPart.BrickColor = BrickColor.new("Cool yellow")
EyeFire = New("Part",FakeHead,"EyeFire",{BrickColor = BrickColor.new("Really red"),Material = Enum.Material.Neon,Size = Vector3.new(0.400000006, 0.200000003, 0.200000003),CFrame = CFrame.new(1.69668579, 8.11665249, 0.640022159, -0.00107900088, 0.999958038, -0.00980941113, -1.0000056, -0.00107390946, 0.000525554642, 0.000515007298, 0.00981007144, 0.999948859),CanCollide = false,Color = Color3.new(1, 0, 0),})
Mesh = New("CylinderMesh",EyeFire,"Mesh",{Offset = Vector3.new(0.0500000007, 0, -0.0399999991),Scale = Vector3.new(1, 0.150000006, 1),})
Weld = New("ManualWeld",EyeFire,"Weld",{Part0 = EyeFire,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.0010790003, -0.999999344, 0.000515000196, 0.999951363, -0.0010738963, 0.00981000345, -0.00980944186, 0.000525560055, 0.99995178),C1 = CFrame.new(0.100008011, 0.300009251, -0.600027919, 0.00980899762, -0.000536999898, -0.99995178, 0.00110200245, 0.999999344, -0.000526215415, 0.999951363, -0.00109678751, 0.00980958249),})
Chest = New("Model",chara,"Chest",{})
MainPart = New("Part",Chest,"MainPart",{Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(2, 2, 1),CFrame = CFrame.new(2.2937007, 6.31611967, 0.746871948, 0.00980956201, 0.00110224239, 0.999954581, -0.000537135813, 1.00000238, -0.00109703222, -0.99995023, -0.000526354474, 0.00981019717),CanCollide = false,LeftSurface = Enum.SurfaceType.Weld,RightSurface = Enum.SurfaceType.Weld,})
Weld = New("ManualWeld",MainPart,"Weld",{Part0 = MainPart,Part1 = chara.Torso,C0 = CFrame.new(0, 0, 0, 0.009809535, -0.000537137908, -0.99994725, 0.00110225554, 1.00000858, -0.000526368851, 0.999961257, -0.00109705783, 0.00981026888),C1 = CFrame.new(5.96046448e-008, -9.05990601e-006, -2.38418579e-007, 0.00980956666, -0.000537143264, -0.99995023, 0.00110225484, 1.00000238, -0.000526361808, 0.999954581, -0.00109704456, 0.00981020182),})
CorruptedPart = New("Part",Chest,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.400000006, 0.800000072, 1),CFrame = CFrame.new(2.28977966, 7.11656427, 1.34486222, -0.00110228383, -0.00980954897, -0.9999578, -1.00000536, 0.000536905834, 0.00109708123, 0.000526248943, 0.99994868, -0.00981033035),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.0011022957, -0.999999225, 0.000526249292, -0.00980958622, 0.000536918582, 0.99995172, -0.999951243, 0.0010970803, -0.00981026702),C1 = CFrame.new(-0.598430753, 0.800122261, 0.00106739998, 0.00980956666, -0.000537143264, -0.99995023, 0.00110225484, 1.00000238, -0.000526361808, 0.999954581, -0.00109704456, 0.00981020182),})
CorruptedPart = New("Part",Chest,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.400000006, 0.400000066, 1),CFrame = CFrame.new(2.29174757, 6.71645212, 1.54485857, -0.00110228383, -0.00980954897, -0.9999578, -1.00000536, 0.000536905834, 0.00109708123, 0.000526248943, 0.99994868, -0.00981033035),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.0011022957, -0.999999225, 0.000526249292, -0.00980958622, 0.000536918582, 0.99995172, -0.999951243, 0.0010970803, -0.00981026702),C1 = CFrame.new(-0.798183441, 0.399908543, 0.00543618202, 0.00980956666, -0.000537143264, -0.99995023, 0.00110225484, 1.00000238, -0.000526361808, 0.999954581, -0.00109704456, 0.00981020182),})
LeftArm = New("Model",chara,"LeftArm",{})
MainPart = New("Part",LeftArm,"MainPart",{Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(1, 2, 1),CFrame = CFrame.new(1.90889204, 6.31596565, 3.24640989, -0.0484240092, -0.0324009918, 0.998301268, -0.00117100019, 0.999474883, 0.0323822871, -0.998826265, 0.000399069104, -0.0484365262),CanCollide = false,})
Weld = New("ManualWeld",MainPart,"Weld",{Part0 = MainPart,Part1 = chara["Left Arm"],C0 = CFrame.new(0, 0, 0, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),C1 = CFrame.new(0, -8.10623169e-006, -2.38418579e-007, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),})
CorruptedPart = New("Part",LeftArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.400000006, 0.200000003),CFrame = CFrame.new(1.48370504, 6.50245714, 2.8663168, -0.048417028, -0.0324150361, 0.998301387, -0.00116700074, 0.999474525, 0.03239654, -0.998826742, 0.000403525919, -0.0484294258),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.048417028, -0.00116700074, -0.998826623, -0.0324150361, 0.999474466, 0.000403525832, 0.998301208, 0.0323965363, -0.0484294109),C1 = CFrame.new(0.400017738, 0.200018406, -0.400015235, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),})
CorruptedPart = New("Part",LeftArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.600000024, 0.200000003),CFrame = CFrame.new(1.51924801, 6.60332775, 3.66543078, -0.048417028, -0.0324150361, 0.998301387, -0.00116700074, 0.999474525, 0.03239654, -0.998826742, 0.000403525919, -0.0484294258),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.048417028, -0.00116700074, -0.998826623, -0.0324150361, 0.999474466, 0.000403525832, 0.998301208, 0.0323965363, -0.0484294109),C1 = CFrame.new(-0.399997473, 0.300003052, -0.399972558, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),})
EffCorruptedPart = New("Part",LeftArm,"EffCorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 1, 1),CFrame = CFrame.new(1.92512023, 5.81624889, 3.24619365, -0.048417028, -0.0324150361, 0.998301387, -0.00116700074, 0.999474525, 0.03239654, -0.998826742, 0.000403525919, -0.0484294258),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",EffCorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",EffCorruptedPart,"Weld",{Part0 = EffCorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.048417028, -0.00116700074, -0.998826623, -0.0324150361, 0.999474466, 0.000403525832, 0.998301208, 0.0323965363, -0.0484294109),C1 = CFrame.new(1.52587891e-005, -0.49998045, 2.90870667e-005, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),})
CorruptedPart = New("Part",LeftArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.800000072, 0.200000003),CFrame = CFrame.new(2.31463432, 6.72918367, 3.62673688, -0.048417028, -0.0324150361, 0.998301387, -0.00116700074, 0.999474525, 0.03239654, -0.998826742, 0.000403525919, -0.0484294258),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.048417028, -0.00116700074, -0.998826623, -0.0324150361, 0.999474466, 0.000403525832, 0.998301208, 0.0323965363, -0.0484294109),C1 = CFrame.new(-0.400012016, 0.400006294, 0.400012136, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),})
CorruptedPart = New("Part",LeftArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(1.50631011, 6.40297413, 3.26581192, -0.048417028, -0.0324150361, 0.998301387, -0.00116700074, 0.999474525, 0.03239654, -0.998826742, 0.000403525919, -0.0484294258),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.048417028, -0.00116700074, -0.998826623, -0.0324150361, 0.999474466, 0.000403525832, 0.998301208, 0.0323965363, -0.0484294109),C1 = CFrame.new(1.3589859e-005, 0.100014687, -0.400020242, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),})
CorruptedPart = New("Part",LeftArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.400000036, 0.200000003),CFrame = CFrame.new(1.92179501, 6.51633835, 3.64602208, -0.048417028, -0.0324150361, 0.998301387, -0.00116700074, 0.999474525, 0.03239654, -0.998826742, 0.000403525919, -0.0484294258),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.048417028, -0.00116700074, -0.998826623, -0.0324150361, 0.999474466, 0.000403525832, 0.998301208, 0.0323965363, -0.0484294109),C1 = CFrame.new(-0.40000248, 0.200008869, 1.37090683e-005, -0.0484240092, -0.00117100019, -0.998826265, -0.0324009918, 0.999474883, 0.000399069104, 0.998301268, 0.0323822871, -0.0484365262),})
BurningEff(EffCorruptedPart)
LeftLeg = New("Model",chara,"LeftLeg",{})
MainPart = New("Part",LeftLeg,"MainPart",{Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(1, 2, 1),CFrame = CFrame.new(2.2865479, 1.31659603, 1.24781799, 0.00980953407, 0.00110225566, 0.999961138, -0.000537137908, 1.00000858, -0.00109705783, -0.99994719, -0.000526368851, 0.00981026888),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,})
Weld = New("ManualWeld",MainPart,"Weld",{Part0 = MainPart,Part1 = chara["Left Leg"],C0 = CFrame.new(0, 0, 0, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),C1 = CFrame.new(0, -8.58306885e-006, -2.38418579e-007, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
EffCorruptedPart = New("Part",LeftLeg,"EffCorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 0.200000048, 1),CFrame = CFrame.new(2.28007793, 0.400032878, 1.25993299, 1.00001979, -3.03611159e-007, -5.47617674e-007, 5.67175448e-007, 1.00001717, -5.60779881e-007, -1.86450779e-006, 9.50574758e-007, 0.99998951),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",EffCorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",EffCorruptedPart,"Weld",{Part0 = EffCorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 1, 5.86369708e-007, -2.15602267e-006, -2.8440752e-007, 0.999998569, 9.76819592e-007, -8.39119252e-007, -5.34477465e-007, 0.999998569),C1 = CFrame.new(-0.0116856098, -0.916567385, -0.00534534454, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
CorruptedPart = New("Part",LeftLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.600000024, 0.200000003),CFrame = CFrame.new(1.88013697, 0.800038397, 0.859943509, 1.00001979, -3.03611159e-007, -5.47617674e-007, 5.67175448e-007, 1.00001717, -5.60779881e-007, -1.86450779e-006, 9.50574758e-007, 0.99998951),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 1, 5.86369708e-007, -2.15602267e-006, -2.8440752e-007, 0.999998569, 9.76819592e-007, -8.39119252e-007, -5.34477465e-007, 0.999998569),C1 = CFrame.new(0.3841483, -0.516796231, -0.40962553, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
CorruptedPart = New("Part",LeftLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.800000012, 0.200000003),CFrame = CFrame.new(2.69002914, 0.915953577, 0.851962805, 0.999971032, 0.0011022269, -0.00980960391, -0.00109704852, 1.00001776, 0.000537177373, 0.00981036108, -0.000526409131, 0.999942601),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999951303, -0.0010970087, 0.00981015898, 0.00110222446, 0.999999166, -0.000526388001, -0.00980970077, 0.00053719338, 0.99995172),C1 = CFrame.new(0.400011122, -0.399985313, 0.400013685, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
CorruptedPart = New("Part",LeftLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.800000012, 0.200000003),CFrame = CFrame.new(1.88013721, 0.900040269, 1.65993917, 1.00001979, -3.03611159e-007, -5.47617674e-007, 5.67175448e-007, 1.00001717, -5.60779881e-007, -1.86450779e-006, 9.50574758e-007, 0.99998951),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 1, 5.86369708e-007, -2.15602267e-006, -2.8440752e-007, 0.999998569, 9.76819592e-007, -8.39119252e-007, -5.34477465e-007, 0.999998569),C1 = CFrame.new(-0.415866137, -0.41721642, -0.40188694, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
CorruptedPart = New("Part",LeftLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(1.88013721, 0.600035727, 1.25993288, 1.00001979, -3.03611159e-007, -5.47617674e-007, 5.67175448e-007, 1.00001717, -5.60779881e-007, -1.86450779e-006, 9.50574758e-007, 0.99998951),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 1, 5.86369708e-007, -2.15602267e-006, -2.8440752e-007, 0.999998569, 9.76819592e-007, -8.39119252e-007, -5.34477465e-007, 0.999998569),C1 = CFrame.new(-0.0157161951, -0.717007458, -0.405481935, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
CorruptedPart = New("Part",LeftLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.400000006, 0.200000003),CFrame = CFrame.new(2.28007793, 0.700037479, 1.65993929, 1.00001967, -3.84054147e-007, 3.90969217e-006, 6.35045581e-007, 1.00001717, -5.60838998e-007, -6.19795173e-006, 9.32147486e-007, 0.99998951),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 1, 6.5424797e-007, -6.48946025e-006, -3.64865258e-007, 0.999998629, 9.58411874e-007, 3.61912225e-006, -5.34497644e-007, 0.999998629),C1 = CFrame.new(-0.411835551, -0.616776347, -0.00175023079, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
CorruptedPart = New("Part",LeftLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 1.20000005, 0.200000003),CFrame = CFrame.new(2.68018699, 1.10004401, 1.65993941, 1.00001967, -3.84054147e-007, 3.90969217e-006, 6.35045581e-007, 1.00001717, -5.60838998e-007, -6.19795173e-006, 9.32147486e-007, 0.99998951),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 1, 6.5424797e-007, -6.48946025e-006, -3.64865258e-007, 0.999998629, 9.58411874e-007, 3.61912225e-006, -5.34497644e-007, 0.999998629),C1 = CFrame.new(-0.408125639, -0.216332912, 0.397896528, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
CorruptedPart = New("Part",LeftLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.600000024, 0.200000003),CFrame = CFrame.new(2.68596959, 0.816166699, 1.25195313, 0.999971032, 0.0011022269, -0.00980960391, -0.00109704852, 1.00001776, 0.000537177373, 0.00981036108, -0.000526409131, 0.999942601),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999951303, -0.0010970087, 0.00981015898, 0.00110222446, 0.999999166, -0.000526388001, -0.00980970077, 0.00053719338, 0.99995172),C1 = CFrame.new(5.20944595e-005, -0.499986172, 0.399987936, 0.00980953407, -0.000537137908, -0.99994719, 0.00110225566, 1.00000858, -0.000526368851, 0.999961138, -0.00109705783, 0.00981026888),})
ScatterEff(EffCorruptedPart)
RightArm = New("Model",chara,"RightArm",{})
MainPart = New("Part",RightArm,"MainPart",{Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(1, 2, 1),CFrame = CFrame.new(2.011096, 6.31690788, -3.92582893, 0.00918400101, -0.262283146, 0.964947343, 0.259330034, 0.932596445, 0.251021653, -0.965745091, 0.247934431, 0.0765828639),CanCollide = false,})
Weld = New("ManualWeld",MainPart,"Weld",{Part0 = MainPart,Part1 = chara["Right Arm"],C0 = CFrame.new(0, 0, 0, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),C1 = CFrame.new(-2.86102295e-006, -9.05990601e-006, -2.38418579e-006, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
Hitbox = New("Part",RightArm,"Hitbox",{BrickColor = BrickColor.new("Really black"),Transparency = 1,Transparency = 1,Size = Vector3.new(1, 4, 1),CFrame = CFrame.new(22.2733669, 5.0842762, -22.1737366, -0.964945257, -0.262290984, 0.00919180829, -0.251027077, 0.93259424, 0.259333313, -0.0765930116, 0.247935042, -0.965744138),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Weld = New("ManualWeld",Hitbox,"Weld",{Part0 = Hitbox,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.964945257, -0.251027077, -0.0765930116, -0.262290984, 0.93259424, 0.247935042, 0.00919180829, 0.259333313, -0.965744138),C1 = CFrame.new(-1.52587891e-005, -1.00003147, -1.71661377e-005, 0.0091838371, 0.259330064, -0.965745151, -0.262283117, 0.932596445, 0.247934505, 0.964947283, 0.251021653, 0.0765827149),})
CorruptedPart = New("Part",RightArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 2, 1),CFrame = CFrame.new(2.011096, 6.3169179, -3.92581391, -0.964945257, -0.262290984, 0.00919180829, -0.251027077, 0.93259424, 0.259333313, -0.0765930116, 0.247935042, -0.965744138),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.964945138, -0.251027018, -0.0765930042, -0.262290984, 0.932594121, 0.247935027, 0.00919180084, 0.259333313, -0.965744197),C1 = CFrame.new(-1.1920929e-005, 1.28746033e-005, 3.57627869e-006, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
CorruptedPart = New("Part",RightArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 0.600000024, 0.400000036),CFrame = CFrame.new(2.14866924, 6.03215551, -4.72580194, -0.964945078, 0.262291819, -0.00918725226, -0.251029015, -0.932593465, -0.259333432, -0.0765890032, -0.247936144, 0.965744317),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),MeshType = Enum.MeshType.Wedge,})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.964944899, -0.251028955, -0.0765889958, 0.262291819, -0.932593465, -0.247936144, -0.00918724574, -0.259333432, 0.965744257),C1 = CFrame.new(0.699988842, -0.499982834, 7.62939453e-006, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
CorruptedPart = New("Part",RightArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 1.20000005, 0.600000024),CFrame = CFrame.new(2.63876629, 4.02682734, -4.32773018, -0.964945078, 0.262291819, -0.00918725226, -0.251029015, -0.932593465, -0.259333432, -0.0765890032, -0.247936144, 0.965744317),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),MeshType = Enum.MeshType.Wedge,})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.964944899, -0.251028955, -0.0765889958, 0.262291819, -0.932593465, -0.247936144, -0.00918724574, -0.259333432, 0.965744257),C1 = CFrame.new(-0.199987888, -2.39999342, 3.02791595e-005, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
CorruptedPart = New("Part",RightArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 1, 0.600000024),CFrame = CFrame.new(1.62134135, 7.81954479, -3.94021821, 0.964945078, -0.262291819, -0.00918725226, 0.251029015, 0.932593465, -0.259333432, 0.0765890032, 0.247936144, 0.965744317),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),MeshType = Enum.MeshType.Wedge,})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.964944899, 0.251028955, 0.0765889958, -0.262291819, 0.932593465, 0.247936144, -0.00918724574, -0.259333432, 0.965744257),C1 = CFrame.new(0.399995804, 1.5000124, -2.38418579e-007, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
CorruptedPart = New("Part",RightArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 0.600000024, 0.400000036),CFrame = CFrame.new(2.35483098, 5.18234444, -4.53787422, -0.964945078, 0.262291819, -0.00918725226, -0.251029015, -0.932593465, -0.259333432, -0.0765890032, -0.247936144, 0.965744317),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),MeshType = Enum.MeshType.Wedge,})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.964944899, -0.251028955, -0.0765889958, 0.262291819, -0.932593465, -0.247936144, -0.00918724574, -0.259333432, 0.965744257),C1 = CFrame.new(0.300010204, -1.29999256, 1.40666962e-005, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
CorruptedPart = New("Part",RightArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 1, 0.600000024),CFrame = CFrame.new(1.88730097, 6.99068737, -4.57445002, -0.964945078, 0.262291819, -0.00918725226, -0.251029015, -0.932593465, -0.259333432, -0.0765890032, -0.247936144, 0.965744317),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("SpecialMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),MeshType = Enum.MeshType.Wedge,})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.964944899, -0.251028955, -0.0765889958, 0.262291819, -0.932593465, -0.247936144, -0.00918724574, -0.259333432, 0.965744257),C1 = CFrame.new(0.799996853, 0.50001812, 4.29153442e-006, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
CorruptedPart = New("Part",RightArm,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 0.800000072, 0.600000024),CFrame = CFrame.new(2.37646794, 4.9594202, -4.07979012, -0.964945316, -0.262290984, 0.00918756705, -0.251028091, 0.932593942, 0.259333163, -0.0765890256, 0.247935995, -0.965744197),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, -0.964945138, -0.251028031, -0.0765890107, -0.262290955, 0.932593882, 0.247935966, 0.0091875596, 0.259333193, -0.965744257),C1 = CFrame.new(-0.199994564, -1.39999104, 1.52587891e-005, 0.00918400101, 0.259330034, -0.965745091, -0.262283146, 0.932596445, 0.247934431, 0.964947343, 0.251021653, 0.0765828639),})
RightLeg = New("Model",chara,"RightLeg",{})
MainPart = New("Part",RightLeg,"MainPart",{Transparency = 1,Transparency = 1,FormFactor = Enum.FormFactor.Symmetric,Size = Vector3.new(1, 2, 1),CFrame = CFrame.new(2.29641008, 1.31540966, 0.248092994, 0.00933599845, 0.00110999751, 0.999955773, -0.0030579993, 0.999994755, -0.00108149007, -0.99995178, -0.0030477671, 0.00933934376),CanCollide = false,BottomSurface = Enum.SurfaceType.Smooth,})
Weld = New("ManualWeld",MainPart,"Weld",{Part0 = MainPart,Part1 = chara["Right Leg"],C0 = CFrame.new(0, 0, 0, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),C1 = CFrame.new(2.98023224e-008, -8.58306885e-006, 2.38418579e-007, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
CorruptedPart = New("Part",RightLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.200000003, 0.200000003),CFrame = CFrame.new(2.70045996, 1.61376095, -0.149078026, 0.999955833, 0.00111049914, -0.0093326522, -0.00108199986, 0.999994755, 0.00305823679, 0.00933599938, -0.00304800388, 0.999951839),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955893, -0.00108199986, 0.00933599938, 0.00111049926, 0.999994755, -0.00304800388, -0.0093326522, 0.00305823679, 0.99995178),C1 = CFrame.new(0.400011688, 0.300008655, 0.400000095, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
CorruptedPart = New("Part",RightLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.600000024, 0.200000003),CFrame = CFrame.new(1.90071809, 1.81462395, -0.157150015, 0.999955714, 0.00111050205, -0.0093366541, -0.00108199974, 0.999994755, 0.00305724167, 0.00933999754, -0.00304700364, 0.999951899),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955773, -0.00108199974, 0.00933999848, 0.00111050217, 0.999994755, -0.00304700388, -0.00933665317, 0.00305724121, 0.99995178),C1 = CFrame.new(0.400002658, 0.50000751, -0.399999142, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
CorruptedPart = New("Part",RightLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.400000036, 0.200000003),CFrame = CFrame.new(1.896873, 1.71584904, 0.243133992, 0.999955714, 0.00111050205, -0.0093366541, -0.00108199974, 0.999994755, 0.00305724167, 0.00933999754, -0.00304700364, 0.999951899),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955773, -0.00108199974, 0.00933999848, 0.00111050217, 0.999994755, -0.00304700388, -0.00933665317, 0.00305724121, 0.99995178),C1 = CFrame.new(4.14252281e-006, 0.400008917, -0.399998784, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
CorruptedPart = New("Part",RightLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.800000072, 0.200000003),CFrame = CFrame.new(1.89314091, 1.71706903, 0.643112063, 0.999955714, 0.00111050205, -0.0093366541, -0.00108199974, 0.999994755, 0.00305724167, 0.00933999754, -0.00304700364, 0.999951899),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955773, -0.00108199974, 0.00933999848, 0.00111050217, 0.999994755, -0.00304700388, -0.00933665317, 0.00305724121, 0.99995178),C1 = CFrame.new(-0.399993181, 0.400005698, -0.399996519, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
EffCorruptedPart = New("Part",RightLeg,"EffCorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(1, 1.20000005, 1),CFrame = CFrame.new(2.29597116, 0.915416002, 0.249298006, 0.999955714, 0.00111051137, -0.00933665317, -0.00108199974, 0.999994755, 0.00305824191, 0.00933999754, -0.00304800365, 0.999951899),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",EffCorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",EffCorruptedPart,"Weld",{Part0 = EffCorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955773, -0.00108199974, 0.00933999848, 0.00111051148, 0.999994755, -0.00304800388, -0.00933665223, 0.00305824145, 0.99995178),C1 = CFrame.new(1.41263008e-005, -0.399995744, 5.00679016e-006, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
CorruptedPart = New("Part",RightLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.400000006, 0.200000003),CFrame = CFrame.new(2.300596, 1.71419013, -0.153122023, 0.999955714, 0.00111051137, -0.00933665317, -0.00108199974, 0.999994755, 0.00305824191, 0.00933999754, -0.00304800365, 0.999951899),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955773, -0.00108199974, 0.00933999848, 0.00111051148, 0.999994755, -0.00304800388, -0.00933665223, 0.00305824145, 0.99995178),C1 = CFrame.new(0.400015235, 0.400005817, 7.39097595e-006, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
CorruptedPart = New("Part",RightLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.600000024, 0.200000003),CFrame = CFrame.new(2.69322205, 1.81620288, 0.650299072, 0.999955714, 0.00111051137, -0.00933665317, -0.00108199974, 0.999994755, 0.00305824191, 0.00933999754, -0.00304800365, 0.999951899),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955773, -0.00108199974, 0.00933999848, 0.00111051148, 0.999994755, -0.00304800388, -0.00933665223, 0.00305824145, 0.99995178),C1 = CFrame.new(-0.400013447, 0.500005245, 0.400009155, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
CorruptedPart = New("Part",RightLeg,"CorruptedPart",{BrickColor = BrickColor.new("Really black"),Material = Enum.Material.Granite,Size = Vector3.new(0.200000003, 0.400000006, 0.200000003),CFrame = CFrame.new(2.69684124, 1.71498096, 0.250625998, 0.999955714, 0.00111051137, -0.00933665317, -0.00108199974, 0.999994755, 0.00305824191, 0.00933999754, -0.00304800365, 0.999951899),CanCollide = false,BackSurface = Enum.SurfaceType.SmoothNoOutlines,BottomSurface = Enum.SurfaceType.SmoothNoOutlines,FrontSurface = Enum.SurfaceType.SmoothNoOutlines,LeftSurface = Enum.SurfaceType.SmoothNoOutlines,RightSurface = Enum.SurfaceType.SmoothNoOutlines,TopSurface = Enum.SurfaceType.SmoothNoOutlines,Color = Color3.new(0.0666667, 0.0666667, 0.0666667),})
Mesh = New("BlockMesh",CorruptedPart,"Mesh",{Scale = Vector3.new(1.10000002, 1.10000002, 1.10000002),})
Weld = New("ManualWeld",CorruptedPart,"Weld",{Part0 = CorruptedPart,Part1 = MainPart,C0 = CFrame.new(0, 0, 0, 0.999955773, -0.00108199974, 0.00933999848, 0.00111051148, 0.999994755, -0.00304800388, -0.00933665223, 0.00305824145, 0.99995178),C1 = CFrame.new(-1.63316727e-005, 0.400005937, 0.400005102, 0.00933599845, -0.0030579993, -0.99995178, 0.00110999751, 0.999994755, -0.0030477671, 0.999955773, -0.00108149007, 0.00933934376),})
ScatterEff(EffCorruptedPart)

sa = RightArm:GetChildren()
for i = 1, #sa do
ScatterEff(sa[i])
end

local eff1 = Instance.new("ParticleEmitter",EyeFire)
eff1.Size = NumberSequence.new(.1)
eff1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(.2,0),NumberSequenceKeypoint.new(1,1)})
eff1.LightEmission = 1
eff1.Lifetime = NumberRange.new(.5)
eff1.Speed = NumberRange.new(1)
eff1.EmissionDirection = "Front"
eff1.Rate = 100
eff1.Texture = "rbxassetid://347504241"
eff1.Acceleration = Vector3.new(0,10,0)
eff1.Color = ColorSequence.new(Color3.new(1,0,0))
local eff2 = Instance.new("ParticleEmitter",EyeFire)
eff2.Size = NumberSequence.new(.1)
eff2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(.2,0),NumberSequenceKeypoint.new(1,1)})
eff2.LightEmission = 1
eff2.Lifetime = NumberRange.new(.5)
eff2.Speed = NumberRange.new(1)
eff2.EmissionDirection = "Front"
eff2.Rate = 100
eff2.Texture = "rbxassetid://347504259"
eff2.Acceleration = Vector3.new(0,10,0)
eff2.Color = ColorSequence.new(Color3.new(1,0,0))
local eff3 = Instance.new("ParticleEmitter",EyeFire)
eff3.Size = NumberSequence.new(.1)
eff3.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})
eff3.LightEmission = 1
eff3.Lifetime = NumberRange.new(.5)
eff3.Speed = NumberRange.new(1)
eff3.EmissionDirection = "Front"
eff3.Rate = 100
eff3.Texture = "rbxasset://textures/particles/fire_main.dds"
eff3.Acceleration = Vector3.new(0,10,0)
eff3.Color = ColorSequence.new(Color3.new(1,0,0))

--Sounds--
slashsnd = New("Sound",chara.Torso,"Slash",{SoundId = "rbxassetid://28144425",PlaybackSpeed = .7,Volume = 5})
hitsnd = New("Sound",chara.Torso,"Hit",{SoundId = "rbxassetid://429400881",PlaybackSpeed = .7,Volume = 5})
telesnd = New("Sound",chara.Torso,"Tele",{SoundId = "rbxassetid://2767090",PlaybackSpeed = .7,Volume = 5})
burnsnd = New("Sound",chara.Torso,"Burn",{SoundId = "rbxassetid://32791565",PlaybackSpeed = .7,Volume = 5})
music1 = New("Sound",chara.Torso,"Music1",{SoundId = "rbxassetid://678930213",PlaybackSpeed = .1,Volume = 10,Looped = true})
music2 = New("Sound",chara.Torso,"Music1",{SoundId = "rbxassetid://678930213",PlaybackSpeed = .1,Volume = 10,Looped = true})
deathmus = New("Sound",chara.Torso,"DeathMus",{SoundId = "rbxassetid://19094700",PlaybackSpeed = .5,Volume = 5,Looped = true})
deathex = New("Sound",chara.Torso,"DeathEx",{SoundId = "rbxassetid://11984351",PlaybackSpeed = 1,Volume = 5})
music1:Play()
music2:Play()

--Animations--
swinganim = chara.Humanoid:LoadAnimation(New("Animation",chara,"Swing",{AnimationId = "rbxassetid://186934658"}))

--Name Tag--
local naeeym = Instance.new("BillboardGui",chara)
naeeym.Size = UDim2.new(0,100,0,40)
naeeym.StudsOffset = Vector3.new(0,2,0)
naeeym.Adornee = chara.Head
local tecks = Instance.new("TextLabel",naeeym)
tecks.BackgroundTransparency = 1
tecks.BorderSizePixel = 0
tecks.Text = "John Doe"
tecks.Font = "Fantasy"
tecks.FontSize = "Size24"
tecks.TextStrokeTransparency = 0
tecks.TextStrokeColor3 = Color3.new(0,0,0)
tecks.TextColor3 = Color3.new(0,0,0)
tecks.Size = UDim2.new(1,0,0.5,0)

--Skybox--
skybox = Instance.new("Part",chara)
skybox.Size = Vector3.new(0,0,0)
skybox.Anchored = true
skybox.CanCollide = true
skyboxmesh = Instance.new("SpecialMesh",skybox)
skyboxmesh.MeshId = "http://www.roblox.com/asset/?id=1527559"
skyboxmesh.TextureId = "http://www.roblox.com/asset/?id=1529455"
skyboxmesh.VertexColor = Vector3.new(1,0,0)
skyboxmesh.Scale = Vector3.new(-3000,-1000,-3000)

--Soul Steal--
function SoulSteal(pos)
local soulst = coroutine.wrap(function()
local soul = Instance.new("Part",chara)
soul.Size = Vector3.new(0,0,0)
soul.CanCollide = false
soul.Anchored = false
soul.Position = pos
soul.CFrame = CFrame.new(pos.X,pos.Y,pos.Z)
soul.Transparency = 1
local ptc = Instance.new("ParticleEmitter",soul)
ptc.Texture = "http://www.roblox.com/asset/?id=413366101"
ptc.Size = NumberSequence.new(.5)
ptc.LockedToPart = true
ptc.Speed = NumberRange.new(0)
ptc.Lifetime = NumberRange.new(9999)
local bodpos = Instance.new("BodyPosition",soul)
bodpos.Position = pos
wait(2)
soul.Touched:connect(function(hit)
if hit.Parent == chara then
soul:Destroy()
end
end)
while soul do
wait(.1)
bodpos.Position = chara.Torso.Position
end
end)
soulst()
end

--Death of a Mortal--
function KillMortal(hitdude)
local torsy = nil
if hitdude:FindFirstChild("Torso")~=nil then
torsy = hitdude.Torso	
elseif hitdude:FindFirstChild("UpperTorso")~=nil then
torsy = hitdude.UpperTorso
end
local val = Instance.new("ObjectValue",hitdude)
val.Name = "HasBeenHit"
hitdude:BreakJoints()
hitdude.Humanoid:Destroy()
SoulSteal(torsy.Position)
local chi = hitdude:GetChildren()
for i = 1, #chi do
if chi[i].ClassName == "Part" or chi[i].ClassName == "MeshPart" then
local bodpos = Instance.new("BodyPosition",chi[i])
bodpos.Position = chi[i].Position + Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5))
ScatterEff(chi[i])
chi[i].BrickColor = BrickColor.new("Really black")
end
end
for i = 1, 4 do
for i = 1, #chi do
if chi[i].ClassName == "Part" or chi[i].ClassName == "MeshPart" then
chi[i].Transparency = chi[i].Transparency + .25
wait(.01)
end
end
end
for i = 1, #chi do
if chi[i].ClassName == "Part" or chi[i].ClassName == "MeshPart" then
chi[i]:Destroy()
end
end
end

--Arm Touch--
bladeactive = false
Hitbox.Touched:connect(function(hit)
if bladeactive == true then
if hit.Parent:FindFirstChild("Humanoid")~= nil and hit.Parent:FindFirstChild("HasBeenHit")== nil and hit.Parent ~= chara then
hitsnd:Play()
KillMortal(hit.Parent)
end
end
end)

--Teleport--
function Teleport(pos)
telesnd:Play()
local ch = chara:GetChildren()
for i = 1, #ch do
if ch[i].ClassName == "Part" and ch[i].Name ~= "HumanoidRootPart" then
local trace = Instance.new("Part",game.Workspace)
trace.Size = ch[i].Size
trace.Material = "Neon"
trace.BrickColor = BrickColor.new("Really black")
trace.Transparency = .3
trace.CanCollide = false
trace.Anchored = true
trace.CFrame = ch[i].CFrame
if ch[i].Name == "Head" then
mehs = Instance.new("CylinderMesh",trace)
mehs.Scale = Vector3.new(1.25,1.25,1.25)
end
tracedisappear = coroutine.wrap(function()
wait(1)
for i = 1, 7 do
wait(.1)
trace.Transparency = trace.Transparency + .1
end
trace:Destroy()
end)
tracedisappear()
end
end
chara.Torso.CFrame = CFrame.new(pos.X,pos.Y,pos.Z)
end

--Grab--
function Grab(mouse)
local hit = mouse.Target
if hit ~= nil then
if hit.Parent:FindFirstChild("Humanoid")~=nil then
local torsy = nil
if hit.Parent:FindFirstChild("Torso")~=nil then
torsy = hit.Parent.Torso
elseif hit.Parent:FindFirstChild("UpperTorso")~=nil then
torsy = hit.Parent.UpperTorso
end
local bodpos = Instance.new("BodyPosition",torsy)
bodpos.Position = torsy.Position
wait(1)
burnsnd:Play()
hit.Parent.Humanoid.MaxHealth = 100
bodpos.Position = bodpos.Position + Vector3.new(0,4,0)
for i = 1, 10 do
wait(.1)
BurningEff(torsy)
hit.Parent.Humanoid.Health = hit.Parent.Humanoid.Health - 10
end
KillMortal(hit.Parent)
end
else end
end

--Button1Down--
dell = false
function onButton1Down()
if dell == false then
dell = true
swinganim:Play()
bladeactive = true
slashsnd:Play()
wait(.7)
bladeactive = false
dell = false
swinganim:Stop()
end
end

--KeyDowns--
function onKeyDown(key)
if key == "'" then
Teleport(Mouse.Hit.p + Vector3.new(0,2,0))
elseif key == "1" then
Grab(Mouse)
end
end

--Mouse Functions--
Mouse = player:GetMouse()
if Mouse then
Mouse.Button1Down:connect(onButton1Down)
Mouse.KeyDown:connect(onKeyDown)
end

--Death--
chara.Humanoid.Died:connect(function()
local pat = Instance.new("Part",game.Workspace)
pat.Transparency = 1
pat.Anchored = true
pat.CFrame = chara.Torso.CFrame
naeeym.Parent = pat
naeeym.Adornee = pat
skybox.Parent = game.Workspace
tecks.Text = "BAD CHOICE"
tecks.FontSize = "Size48"
tecks.TextColor3 = Color3.new(1,0,0)
music1:Stop()
music2:Stop()
deathmus.Parent = game.Workspace
deathex.Parent = game.Workspace
deathmus:Play()
deathex:Play()
game.Lighting.OutdoorAmbient = Color3.new(0,0,0)
game.Lighting.TimeOfDay = "00:00:00"
game.Lighting.FogColor = Color3.new(0,0,0)
game.Lighting.FogEnd = 1000
local ex = Instance.new("Explosion",game.Workspace)
ex.Position = chara.Torso.Position
ex.Visible = false
ex.BlastRadius = 999999999999999999999999
ex.BlastPressure = 9999999999999999999999999
end)

--Loop Function--
while true do
wait(.01)
chance = math.random(0,100)
if chance < 10 then
sel = math.random(1,3)
if sel == 1 then
tecks.Text = "NOHOPE"
elseif sel == 2 then
tecks.Text = "GIVEUP"
elseif sel == 3 then
tecks.Text = "BURNINHELL"
end
else tecks.Text = "John Doe"
end
if chara.Humanoid.Health > 0 then
chara.Humanoid.MaxHealth = math.huge
chara.Humanoid.Health = math.huge
game.Lighting.OutdoorAmbient = Color3.new(1,0,0)
game.Lighting.Ambient = Color3.new(1,0,0)
chara["Left Arm"].BrickColor = BrickColor.new("Cool yellow")
chara["Right Arm"].BrickColor = BrickColor.new("Cool yellow")
chara["Left Leg"].BrickColor = BrickColor.new("Medium blue")
chara["Right Leg"].BrickColor = BrickColor.new("Medium blue")
chara.Torso.BrickColor = BrickColor.new("Bright yellow")
chara["Left Arm"].Anchored = false
chara["Right Arm"].Anchored = false
chara["Left Leg"].Anchored = false
chara["Right Leg"].Anchored = false
chara.Torso.Anchored = false
ch = chara:GetChildren()
for i = 1, #ch do
if ch[i].ClassName == "Accessory" or ch[i].ClassName == "Hat" then
ch[i]:Destroy()
end
end
tools = player.Backpack:GetChildren()
for i = 1, #tools do
if tools[i].ClassName == "HopperBin" then
tools[i]:Destroy()
end
end
skybox.CFrame = skybox.CFrame * CFrame.fromEulerAnglesXYZ(0,math.rad(1),0)
tecks.Position = UDim2.new(0,math.random(-3,3),0,math.random(-3,3))
local jtrace = Instance.new("Part",game.Workspace)
jtrace.Name = "JDTrace"
jtrace.Size = Vector3.new(10,0,10)
jtrace.Position = chara.Torso.Position
jtrace.CFrame = chara.Torso.CFrame - Vector3.new(0,3,0)
jtrace.Anchored = true
jtrace.CanCollide = false
jtrace.BrickColor = BrickColor.new("Really black")
jtrace.Material = "Granite"
BurningEff(jtrace)
game.Debris:AddItem(jtrace,1)
end
end

end,
})



local ButtonUnloadCheat = SettingsTab:CreateButton({
   Name = "关闭页面(没事别乱按)",
   Callback = function()
  Rayfield:Destroy()
end,
})

local ButtonUnloadCheat = SettingsTab:CreateButton({
   Name = "删除子间隔效果、慢速效果、毛刺效果等",
   Callback = function()
local rs = game:GetService("ReplicatedStorage")

local m = {
    rs.Modules.StatusEffects.Slowness,
    rs.Modules.StatusEffects.SurvivorExclusive.Subspaced,
    rs.Modules.StatusEffects.KillerExclusive.Glitched,
    rs.Modules.StatusEffects.Blindness,
    rs.Modules.StatusEffects.Confusion,
    rs.Modules.StatusEffects.KillerExclusive.Corrupted,
   rs.Modules.StatusEffects.KillerExclusive.Hallucination

  rs.Modules.StatusEffects.Nausea

  rs.Modules.StatusEffects.Oblivious
}

for _, mod in ipairs(m) do
    local ok, req = pcall(require, mod)
    if ok and typeof(req) == "table" then
        req.Applied = function(_) end end end
end,
})
Rayfield:LoadConfiguration()