local Barrage = {}


Barrage.DefaultConfig = {
    BulletSpeed = 200,
    FontSize = 24,  
    TextContent = "CHANGED脚本牛逼!👍🏻", 
    RainbowSpeed = 0.1, 
    BulletInterval = 15,
    TextStrokeTransparency = 0.5, 
    TextStrokeColor = Color3.new(0, 0, 0), 
    Font = Enum.Font.GothamBold, 
    ScreenGuiName = "BulletChatScreenGui" 
}

Barrage.RainbowColors = {
    Color3.new(1, 0, 0),    
    Color3.new(1, 0.5, 0),  
    Color3.new(1, 1, 0),    
    Color3.new(0, 1, 0),    
    Color3.new(0, 0.5, 1),   
    Color3.new(0.3, 0, 0.5), 
    Color3.new(0.5, 0, 1)    
}

-- 初始化
function Barrage.Init(config)
    local self = setmetatable({}, {__index = Barrage})
    self.config = config or Barrage.DefaultConfig
    self.running = false
    self.bullets = {}
    
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    
    if not RunService:IsClient() then 
        warn("不在客户端")
        return self
    end

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    self.screenGui = playerGui:FindFirstChild(self.config.ScreenGuiName)
    if not self.screenGui then
        self.screenGui = Instance.new("ScreenGui")
        self.screenGui.Name = self.config.ScreenGuiName
        self.screenGui.Parent = playerGui
        self.screenGui.ResetOnSpawn = false
    end
    
    return self
end

function Barrage:CreateBullet(text)
    if not self.screenGui then return end
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Bullet_" .. tick()
    textLabel.Text = text or self.config.TextContent
    textLabel.Font = self.config.Font
    textLabel.TextSize = self.config.FontSize
    textLabel.TextColor3 = self.RainbowColors[1]
    textLabel.BackgroundTransparency = 1 
    textLabel.Size = UDim2.new(0, 0, 0, 0)
    textLabel.AutomaticSize = Enum.AutomaticSize.XY 
    textLabel.TextStrokeTransparency = self.config.TextStrokeTransparency
    textLabel.TextStrokeColor3 = self.config.TextStrokeColor
    textLabel.Parent = self.screenGui
    
    RunService.RenderStepped:Wait()
    
    local screenWidth = self.screenGui.AbsoluteSize.X
    
    local startY = math.random(0, self.screenGui.AbsoluteSize.Y - textLabel.AbsoluteSize.Y)
    local startX = self.screenGui.AbsoluteSize.X + 10 -- 屏幕右侧外10像素
    textLabel.Position = UDim2.new(0, startX, 0, startY)
    
    local bulletData = {
        Label = textLabel,
        StartX = startX,
        StartY = startY,
        StartTime = tick(),
        ColorIndex = 1,
        ColorProgress = 0
    }
    
    table.insert(self.bullets, bulletData)
    
    return textLabel
end

function Barrage:UpdateBullets()
    if not self.screenGui then return end
    
    local currentTime = tick()
    local toRemove = {}
    
    for i, bulletData in ipairs(self.bullets) do
        local textLabel = bulletData.Label
        
        if textLabel and textLabel.Parent then
            local elapsed = currentTime - bulletData.StartTime
            local newX = bulletData.StartX - (self.config.BulletSpeed * elapsed)
            textLabel.Position = UDim2.new(0, newX, 0, bulletData.StartY)
            if newX < -textLabel.AbsoluteSize.X then
                textLabel:Destroy()
                table.insert(toRemove, i)
            else
                bulletData.ColorProgress = bulletData.ColorProgress + self.config.RainbowSpeed
                if bulletData.ColorProgress >= 1 then
                    bulletData.ColorProgress = 0
                    bulletData.ColorIndex = (bulletData.ColorIndex % #self.RainbowColors) + 1
                end
                
                local nextColorIndex = (bulletData.ColorIndex % #self.RainbowColors) + 1
                textLabel.TextColor3 = self.RainbowColors[bulletData.ColorIndex]:Lerp(
                    self.RainbowColors[nextColorIndex],
                    bulletData.ColorProgress
                )
            end
        else
            table.insert(toRemove, i)
        end
    end
    
    for i = #toRemove, 1, -1 do
        table.remove(self.bullets, toRemove[i])
    end
end
--启用
function Barrage:Start()
    if self.running then return end
    self.running = true
    
    self:CreateBullet()
    
    self.updateConnection = RunService.RenderStepped:Connect(function()
        self:UpdateBullets()
    end)
    
    self.bulletTimer = coroutine.wrap(function()
        while self.running do
            wait(self.config.BulletInterval)
            if self.running then
                self:CreateBullet()
            end
        end
    end)()
    
    self.bulletTimer()
end

-- 停止
function Barrage:Stop()
    if not self.running then return end
    self.running = false
    if self.updateConnection then
        self.updateConnection:Disconnect()
        self.updateConnection = nil
    end
    
    for _, bulletData in ipairs(self.bullets) do
        if bulletData.Label and bulletData.Label.Parent then
            bulletData.Label:Destroy()
        end
    end
    self.bullets = {}
end

function Barrage:SetConfig(newConfig)
    for key, value in pairs(newConfig) do
        self.config[key] = value
    end
end

function Barrage:AddCustomBullet(text, options)
    local bulletConfig = {
        BulletSpeed = options and options.speed or self.config.BulletSpeed,
        FontSize = options and options.size or self.config.FontSize,
        RainbowSpeed = options and options.rainbowSpeed or self.config.RainbowSpeed
    }
    
    local originalConfig = self.config
    self.config = bulletConfig
    local bullet = self:CreateBullet(text)
    self.config = originalConfig
    
    return bullet
end

return Barrage
