local function Barrage()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")

    if not RunService:IsClient() then return end

    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local screenGui = playerGui:FindFirstChild("BulletChatScreenGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "BulletChatScreenGui"
        screenGui.Parent = playerGui
        screenGui.ResetOnSpawn = false
    end

    local BULLET_SPEED = 200
    local FONT_SIZE = 24
    local TEXT_CONTENT = "CHANGED脚本牛逼!"
    local RAINBOW_SPEED = 0.1

    local RAINBOW_COLORS = {
        Color3.new(1, 0, 0), 
        Color3.new(1, 0.5, 0),  
        Color3.new(1, 1, 0),   
        Color3.new(0, 1, 0),    
        Color3.new(0, 0.5, 1),  
        Color3.new(0.3, 0, 0.5),
        Color3.new(0.5, 0, 1)
    }

    local function createBullet(text)
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "Bullet_" .. tick()
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = FONT_SIZE
        textLabel.TextColor3 = RAINBOW_COLORS[1] -- 初始颜色
        textLabel.BackgroundTransparency = 1 -- 透明背景
        textLabel.Size = UDim2.new(0, 0, 0, 0)
        textLabel.AutomaticSize = Enum.AutomaticSize.XY -- 自动适应文本大小
        textLabel.TextStrokeTransparency = 0.5 -- 文字描边
        textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- 黑色描边增强可读性
        textLabel.Parent = screenGui
        
        RunService.RenderStepped:Wait()
    
        local screenWidth = screenGui.AbsoluteSize.X
    
        local startY = math.random(0, screenGui.AbsoluteSize.Y - textLabel.AbsoluteSize.Y)
        local startX = screenGui.AbsoluteSize.X + 10 -- 屏幕右侧外10像素
        textLabel.Position = UDim2.new(0, startX, 0, startY)
    
        local colorIndex = 1
        local colorProgress = 0
    
        coroutine.wrap(function()
            local startTime = tick()
                while textLabel and textLabel.Parent do
                    local elapsed = tick() - startTime            
                    local newX = startX - (BULLET_SPEED * elapsed)
                    textLabel.Position = UDim2.new(0, newX, 0, startY)
                
                    if newX < -textLabel.AbsoluteSize.X then
                            textLabel:Destroy()
                        return
                    end
            
                    colorProgress = colorProgress + RAINBOW_SPEED
                    if colorProgress >= 1 then
                        colorProgress = 0
                        colorIndex = (colorIndex % #RAINBOW_COLORS) + 1
                    end            
                    local nextColorIndex = (colorIndex % #RAINBOW_COLORS) + 1
                        textLabel.TextColor3 = RAINBOW_COLORS[colorIndex]:Lerp(
                        RAINBOW_COLORS[nextColorIndex],
                        colorProgress
                    )
            
                    RunService.RenderStepped:Wait()
                end
        end)()
    
        return textLabel
    end

    while true do
        createBullet(TEXT_CONTENT)
        wait(15)
    end
end
return Barr