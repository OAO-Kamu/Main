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

local ButtonUnloadCheat = ElitoTab:CreateButton({
   Name = "变态Ellito(有 78，披萨时撸管，ELLIOT 不穿衬衫和裤子)",
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


local ButtonUnloadCheat = SettingsTab:CreateButton({
   Name = "关闭页面(没事别乱按)",
   Callback = function()
  Rayfield:Destroy()
end,
})

Rayfield:LoadConfiguration()