




--[[==

CAT&MEOWWARE 是一个完全免费开源的缝合脚本中心
由 Q3E4 ASII mjay 制作
https://github.com/OAO-Kamu/
请不要制作 skid 脚本!
改脚本仅供参考! 为了照顾萌新我不得不这样做🙃

==]]
--print(("\n"):rep(100))
--^ string library functions
--[[]
local gmatch, sub, gsub, format, char, byte = string.gmatch, string.sub, string.gsub, string.format, string.char, string.byte
local uchar, ucode, upattern = utf8.char, utf8.codepoint, utf8.charpattern

local tostring, tonumber = tostring, tonumber
local tinsert = table.insert

local floor, clamp, random = math.floor, math.clamp, math.random
local bit32_bxor = bit32.bxor

local LuaEscapeCodes = {
    ["b"] = "\b",
    ["n"] = "\n",
    ["r"] = "\r",
    ["t"] = "\t",
    ["f"] = "\f",
    ["v"] = "\v",
    ["\""] = "\"",
    ["'"] = "\'",
    ["\\"] = "\\",
}

local Quotes = {
    ['"'] = "'",
    ["'"] = "\""
}

local function ParseStrings(File, ByteLength)
    local function ParseString(String) -- Formats the \u{...}, \f, \b, ...
        String = gsub(String, "\\(.)", function(Character)
            return LuaEscapeCodes[Character]
        end)
        String = gsub(String, "\\u{([0-9A-Fa-f]+)}", function(Hex)
            return uchar(tonumber(Hex, 16))
        end)

        return String
    end

    local Crypt = {
        Encoded = {}, -- Dictionary
        Used = {}, -- Array
        CharLen = ByteLength or random(4, 7) -- Byte length
    };

    function Crypt:GenerateKey(len)
        len = len or 64

        local key = "";
        local hex = {"a", "b", "c", "d", "e", "f", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}

        for _ = 1, len do
            key = key .. hex[random(1, #hex)]
        end

        return key
    end

    function Crypt:Encode(String, Quote)
        local Encoded = ""

        String = gsub(String, Quote, "\\" .. Quote)
        String = ParseString(String)

        for Char in gmatch(String, upattern) do
            local Generated = Crypt:GenerateKey(Crypt.CharLen) .. Crypt:GenerateKey(Crypt.CharLen)

            Crypt.Encoded[Char] = Crypt.Encoded[Char] or Generated

            Encoded = Encoded .. (Crypt.Encoded[Char])
        end

        return Encoded
    end

    function Crypt:GetList()
        local List = Crypt.Encoded;
        local String = "{\n"

        for Char, Value in next, List do
            Value = gsub(Value, "'", "\\'")

            String = String .. format("\t\t['%s'] = uchar(0x%02x);\n", Value, ucode(Char))
        end

        return String .. "\t}"
    end

    Crypt.FunctionCode = [[do ({})[1] = "ENCODED VIA STRING ENCODER V2.0, Please do not remove these credits." end
local uchar = utf8.char

local function %s(String)
    local A = String:gsub("%s", %s)
    return A;
end
]]
--[[
    Crypt.FunctionName = "_" .. Crypt:GenerateKey(8);

    --& Important Variables

    local Pattern = "%s([^%s]*)%s" -- %s is quote

    for N, Quote in next, Quotes do
        --local QuotePattern = format(Pattern, Opposing, Quote, Quote, Opposing, Quote)
        local QuotePattern = format(Pattern, Quote, Quote, Quote)
        local NQuotePattern = format(Pattern, N, N, N)

        local function Inner(String)
            if String == "" then
                return
            end

            String = gsub(String, NQuotePattern, function(String2)
                return N .. String2 .. N
            end)

            return format("%s([[%s]]--)", Crypt.FunctionName, Crypt:Encode(String, Quote))
            --[[ 
        end

        File = gsub(File, QuotePattern, Inner)
    end

    return format(Crypt.FunctionCode, Crypt.FunctionName, string.rep(".", Crypt.CharLen * 2), Crypt:GetList()) .. File
end

local Code2 = ParseStrings('print("Hello World!")', 4)
print(Code2)
 ]]

local L = loadstring or load
local NotificationLib = "https://raw.githubusercontent.com/BloodLetters/Ash-Libs/refs/heads/main/source.lua"
local GUI = L(game:HttpGet(NotificationLib))()
local OrionLib = L(game:HttpGet('https://raw.githubusercontent.com/OAO-Kamu/UI-Library-Interface/refs/heads/main/%E6%94%B9%E7%89%88%20Orion.lua'))()
L(game:HttpGet("https://raw.github.com/OAO-Kamu/Main/main/API/Dog-Dog-Q3E4.lua"))() -- 不要删这个!!! 删了后面脚本的有些功能不起作用!!!
local startTime = os.clock() 
function gradient(text, startColor, endColor)
    local result = ""
    local length = #text
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

        local char = text:sub(i, i)
        result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
    end
    return result
end

local player = game:GetService("Players").LocalPlayer
local UserName = player.Name
local DispName = player.DisplayName
local LocaleId = player.LocaleId
local Dayage = player.AccountAge
local Yearage = math.floor(Dayage/365 * 100)/100
local executor = identifyexecutor() or "Unknown"
local GamePlaceId = game.PlaceId
local GameName = "Unknown"
local hasPremium = player.MembershipType == Enum.MembershipType.Premium
local premiumStatus = hasPremium and "是" or "否"
local maxPlayers = game:GetService("Players").MaxPlayers
local isStudio = game:GetService("RunService"):IsStudio()
local IsStudios = isStudio and "是" or "否"
pcall(function()
    GameName = game:GetService("MarketplaceService"):GetProductInfo(GamePlaceId).Name
end)
local Count = "Unknown"
local VPNID = "Unknown"
pcall(function()
    Count = game:GetService("LocalizationService").RobloxLocaleId
    VPNID = game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(player)
end)

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Tag = {
    Color = "#FFFF00", 
    Chattag = "[91VIP]" 
}

TextChatService.OnIncomingMessage = function(Message, ChatStyle)
    local MessageProperties = Instance.new("TextChatMessageProperties")
    local Player = Players:GetPlayerByUserId(Message.TextSource.UserId)
    if Player.Name == LocalPlayer.Name then
        MessageProperties.PrefixText = '<font color="' .. Tag.Color .. '">' .. Tag.Chattag .. '</font> ' .. Message.PrefixText
    end
    return MessageProperties
end
LocalPlayer.CharacterAdded:Connect(function()
    if config.Enabled and combatConnection then
        combatConnection:Disconnect()
        combatConnection = RunService.Stepped:Connect(CombatLoop)
    end
end)

local Window = OrionLib:MakeWindow({
    Name = gradient("Catware v1.1.9", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")),
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "oooiskOrionTest",
    IntroEnabled = true,
    IntroText = "缝合开源脚本  最佳脚本中心!",
    IntroIcon = 4483345998,
    Icon = 4483345998,
    CloseCallback = function()
        OrionLib:MakeNotification({
        	Name = "窗口已缩小!",
        	Content = "点击屏幕中间的按钮或按下左shift键显示UI",
        	Image = "rbxassetid://4483345998",
        	Time = 5
        })
    end
})
OrionLib:MakeNotification({
	Name = "LOL LOL LOL LOL LOL LOL",
	Content = "Ez Ez Ez Ez Ez Ez Ez Ez",
	Image = "rbxassetid://4483345998",
	Time = 2
})

local ITab = Window:MakeTab({
	Name = gradient("Info", Color3.fromHex("#FFFF87"), Color3.fromHex("#60EFFF")),
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = ITab:AddSection({ Name = "==>更新日志<==" })
ITab:AddParagraph("[+]增加  [=]修复  [-]删除 [#]无法修复", "[+]脚本于今天正式发布!\n[+]执行脚本时随机切换主题(黑白/粉白)之间\n[+]增加更新日志\n[+]在'Main'中添加子弹追踪\n[#]Doors页面Bug问题无法被修复\n[=]修复脚本走路时视角奇怪和跳跃视角抖动")
ITab:AddParagraph("欢迎回来!" .. DispName,"@" .. UserName)
local Section = ITab:AddSection({ Name = "玩家详情" })
ITab:AddParagraph("玩家信息","你的名称: " .. DispName .. "(@" .. UserName .. ") | 语言: " .. LocaleId .. " | 会员状态:" .. premiumStatus .. " | 在Studio:" .. IsStudios .. "\n账号注册天数: " .. Dayage .. "天(" .. Yearage .. "年)\n你的地址: " .. Count .. " | VPN地址: " .. tostring(VPNID) .. "\n执行器: " .. executor .. "\n最大人数:" .. maxPlayers)
ITab:AddLabel("加入我们的群组" .. gradient("QQ:737612016", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")) .. "")
local ClockSection = ITab:AddSection({Name = "当前时间"})

local ClockLabel = ClockSection:AddLabel("时间: Loading...")

local function FormatTime()
    local currentTime = os.date("*t")
    local hour = currentTime.hour
    local amPm = "早上"

    if hour >= 12 then
        amPm = "下午"
        if hour > 12 then
            hour = hour - 12
        end
    elseif hour == 0 then
        hour = 12
    end

    local formattedTime = string.format("%02d:%02d:%02d %s", hour, currentTime.min, currentTime.sec, amPm)
    local formattedDate = string.format("%02d/%02d/%04d", currentTime.day, currentTime.month, currentTime.year)

    return formattedDate .. " " .. formattedTime
end

local function UpdateClock()
    local hue = 0

    while true do
        local startTime = tick()
        
                ClockLabel:Set("年份&时间: " .. FormatTime())
        
        hue = hue + 0.01
        if hue > 1 then
            hue = 0
        end

        local color = Color3.fromHSV(hue, 1, 1)
        ClockLabel.TextColor3 = color
        
        local elapsedTime = tick() - startTime
        wait(1 - elapsedTime)
    end
end

spawn(UpdateClock)

ITab:AddButton({ Name =  gradient("Unload Orion Library", Color3.fromHex("#FF0000"), Color3.fromHex("#FF0000")), Callback = function()
        OrionLib:MakeNotification({
        	Name = "UI Unloaded!",
            Content = "GoodBye!!!!",
        	Image = "rbxassetid://4483345998",
        	Time = 5
        })
        wait(1)
        OrionLib:Destroy()
end})
--local ITab = Window:MakeTab({
--	Name = gradient("Main", Color3.fromHex("#FFFF87"), Color3.fromHex("#60EFFF")),
--	Icon = "rbxassetid://4483345998",
--	PremiumOnly = false
--})

--local Section = ITab:AddSection({ Name = "本地玩家" })

local Tab= Window:MakeTab({
	Name = "神秘图片",
	Icon = "rbxassetid://7743866529",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "虎鲨吃鱼图片[长按拖动,双鸡销毁]",
	Callback = function()
	local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SquareImageGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false
local screenSize = workspace.CurrentCamera.ViewportSize
local squareSize = math.floor(screenSize.X * 0.3)

local imageFrame = Instance.new("Frame")
imageFrame.Size = UDim2.new(0, squareSize, 0, squareSize)
imageFrame.Position = UDim2.new(0.5, -squareSize/2, 0.5, -squareSize/2)
imageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageFrame.BackgroundTransparency = 0.2
imageFrame.BorderSizePixel = 0
imageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = imageFrame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
imageLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://7873112885"
imageLabel.ScaleType = Enum.ScaleType.Fit 
imageLabel.Parent = imageFrame

local dragging, dragInput, dragStart, startPos

imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = imageFrame.Position
        imageFrame.BackgroundTransparency = 0.1
        task.wait(0.1)
        imageFrame.BackgroundTransparency = 0.2
    end
end)

imageFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

imageFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        imageFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local lastTapTime = 0
imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        local currentTime = tick()
        if currentTime - lastTapTime < 0.3 then
            screenGui:Destroy()
        end
        lastTapTime = currentTime
    end
end)
end
})
Tab:AddButton({
	Name = "普罗坐下图片[长按拖动,双鸡销毁]",
	Callback = function()
	local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SquareImageGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false
local screenSize = workspace.CurrentCamera.ViewportSize
local squareSize = math.floor(screenSize.X * 0.3)

local imageFrame = Instance.new("Frame")
imageFrame.Size = UDim2.new(0, squareSize, 0, squareSize)
imageFrame.Position = UDim2.new(0.5, -squareSize/2, 0.5, -squareSize/2)
imageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageFrame.BackgroundTransparency = 0.2
imageFrame.BorderSizePixel = 0
imageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = imageFrame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
imageLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://7017327684"
imageLabel.ScaleType = Enum.ScaleType.Fit 
imageLabel.Parent = imageFrame

local dragging, dragInput, dragStart, startPos

imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = imageFrame.Position
        imageFrame.BackgroundTransparency = 0.1
        task.wait(0.1)
        imageFrame.BackgroundTransparency = 0.2
    end
end)

imageFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

imageFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        imageFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local lastTapTime = 0
imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        local currentTime = tick()
        if currentTime - lastTapTime < 0.3 then
            screenGui:Destroy()
        end
        lastTapTime = currentTime
    end
end)
end
})
Tab:AddButton({
	Name = "虎鲨教普罗游泳图片[长按拖动,双鸡销毁]",
	Callback = function()
	local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SquareImageGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false
local screenSize = workspace.CurrentCamera.ViewportSize
local squareSize = math.floor(screenSize.X * 0.3)

local imageFrame = Instance.new("Frame")
imageFrame.Size = UDim2.new(0, squareSize, 0, squareSize)
imageFrame.Position = UDim2.new(0.5, -squareSize/2, 0.5, -squareSize/2) -- 居中
imageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageFrame.BackgroundTransparency = 0.2
imageFrame.BorderSizePixel = 0
imageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = imageFrame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
imageLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://8154877223"
imageLabel.ScaleType = Enum.ScaleType.Fit 
imageLabel.Parent = imageFrame

local dragging, dragInput, dragStart, startPos

imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = imageFrame.Position
        imageFrame.BackgroundTransparency = 0.1
        task.wait(0.1)
        imageFrame.BackgroundTransparency = 0.2
    end
end)

imageFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

imageFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        imageFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local lastTapTime = 0
imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        local currentTime = tick()
        if currentTime - lastTapTime < 0.3 then
            screenGui:Destroy()
        end
        lastTapTime = currentTime
    end
end)
end
})
Tab:AddButton({
	Name = "墨鱼狗与虎鲨的日常图片[长按拖动,双鸡销毁]",
	Callback = function()
	local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SquareImageGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false
local screenSize = workspace.CurrentCamera.ViewportSize
local squareSize = math.floor(screenSize.X * 0.3)

local imageFrame = Instance.new("Frame")
imageFrame.Size = UDim2.new(0, squareSize, 0, squareSize)
imageFrame.Position = UDim2.new(0.5, -squareSize/2, 0.5, -squareSize/2) 
imageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageFrame.BackgroundTransparency = 0.2
imageFrame.BorderSizePixel = 0
imageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = imageFrame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
imageLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://7451840922"
imageLabel.ScaleType = Enum.ScaleType.Fit 
imageLabel.Parent = imageFrame

local dragging, dragInput, dragStart, startPos

imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = imageFrame.Position
        imageFrame.BackgroundTransparency = 0.1
        task.wait(0.1)
        imageFrame.BackgroundTransparency = 0.2
    end
end)

imageFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

imageFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        imageFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local lastTapTime = 0
imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        local currentTime = tick()
        if currentTime - lastTapTime < 0.2 then
            screenGui:Destroy()
        end
        lastTapTime = currentTime
    end
end)
end
})
Tab:AddButton({
	Name = "霸道总裁爱上虎鲨图片[长按拖动,双鸡销毁]",
	Callback = function()
	local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SquareImageGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false
local screenSize = workspace.CurrentCamera.ViewportSize
local squareSize = math.floor(screenSize.X * 0.3)

local imageFrame = Instance.new("Frame")
imageFrame.Size = UDim2.new(0, squareSize, 0, squareSize)
imageFrame.Position = UDim2.new(0.5, -squareSize/2, 0.5, -squareSize/2) 
imageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageFrame.BackgroundTransparency = 0.2
imageFrame.BorderSizePixel = 0
imageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = imageFrame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
imageLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://14017052678"
imageLabel.ScaleType = Enum.ScaleType.Fit 
imageLabel.Parent = imageFrame

local dragging, dragInput, dragStart, startPos

imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = imageFrame.Position
        imageFrame.BackgroundTransparency = 0.1
        task.wait(0.1)
        imageFrame.BackgroundTransparency = 0.2
    end
end)

imageFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

imageFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        imageFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local lastTapTime = 0
imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        local currentTime = tick()
        if currentTime - lastTapTime < 0.2 then
            screenGui:Destroy()
        end
        lastTapTime = currentTime
    end
end)
end
})
Tab:AddButton({
	Name = "骚逼虎鲨图片[长按拖动,双鸡销毁]",
	Callback = function()
	local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SquareImageGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false
local screenSize = workspace.CurrentCamera.ViewportSize
local squareSize = math.floor(screenSize.X * 0.3)

local imageFrame = Instance.new("Frame")
imageFrame.Size = UDim2.new(0, squareSize, 0, squareSize)
imageFrame.Position = UDim2.new(0.5, -squareSize/2, 0.5, -squareSize/2) 
imageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageFrame.BackgroundTransparency = 0.2
imageFrame.BorderSizePixel = 0
imageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = imageFrame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
imageLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://14636340041"
imageLabel.ScaleType = Enum.ScaleType.Fit 
imageLabel.Parent = imageFrame

local dragging, dragInput, dragStart, startPos

imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = imageFrame.Position
        imageFrame.BackgroundTransparency = 0.1
        task.wait(0.1)
        imageFrame.BackgroundTransparency = 0.2
    end
end)

imageFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

imageFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        imageFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local lastTapTime = 0
imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        local currentTime = tick()
        if currentTime - lastTapTime < 0.2 then
            screenGui:Destroy()
        end
        lastTapTime = currentTime
    end
end)
end
})
Tab:AddButton({
	Name = "可爱虎鲨撒娇❤️图片[长按拖动,双鸡销毁]",
	Callback = function()
	local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SquareImageGui"
screenGui.Parent = game:GetService("CoreGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false
local screenSize = workspace.CurrentCamera.ViewportSize
local squareSize = math.floor(screenSize.X * 0.3)

local imageFrame = Instance.new("Frame")
imageFrame.Size = UDim2.new(0, squareSize, 0, squareSize)
imageFrame.Position = UDim2.new(0.5, -squareSize/2, 0.5, -squareSize/2) 
imageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
imageFrame.BackgroundTransparency = 0.2
imageFrame.BorderSizePixel = 0
imageFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.05, 0)
corner.Parent = imageFrame

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
imageLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://14017258174"
imageLabel.ScaleType = Enum.ScaleType.Fit 
imageLabel.Parent = imageFrame

local dragging, dragInput, dragStart, startPos

imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = imageFrame.Position
        imageFrame.BackgroundTransparency = 0.1
        task.wait(0.1)
        imageFrame.BackgroundTransparency = 0.2
    end
end)

imageFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

imageFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        imageFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

local lastTapTime = 0
imageFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        local currentTime = tick()
        if currentTime - lastTapTime < 0.2 then
            screenGui:Destroy()
        end
        lastTapTime = currentTime
    end
end)
end
})
local Tab = Window:MakeTab({
  Name = gradient("Main/Player", Color3.fromHex("#00FF87"), Color3.fromHex("#60EFFF")), 
  Icon = "rbxassetid://7733970494",
  PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "本地玩家"
})
Tab:AddSlider({
	Name = "速度",
	Min = 16,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "数值",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab:AddSlider({
	Name = "跳跃高度",
	Min = 50,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "数值",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})
Tab:AddTextbox({
	Name = "移动速度",
	Default = "Speed",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end	 
})

Tab:AddTextbox({
	Name = "跳跃高度",
	Default = "Jump",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end	 
})

Tab:AddTextbox({
	Name = "最大血量",
	Default = "HP",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value
	end	 
})

Tab:AddTextbox({
	Name = "当前血量",
	Default = "U.HP",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end	 
})

Tab:AddButton({
	Name = "回满血",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth 
    end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "GR",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})
Tab:AddToggle({
	Name = "穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})
Tab:AddToggle({
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then
		    game.Lighting.Ambient = Color3.new(1, 1, 1)
		else
		    game.Lighting.Ambient = Color3.new(0, 0, 0)
		end
	end
})
Tab:AddButton({
  Name = "高级子弹追踪  [优化版]",
  Callback = function()
      loadstring(game:HttpGet(" https://raw.githubusercontent.com/OAO-Kamu/Main/refs/heads/main/hhbsndns.lua"))()
  end
})
Tab:AddButton({
  Name = " 高级子弹追踪 [最好的子弹追踪]",
  Callback = function()
      loadstring(game:HttpGet("https://atlasteam.live/silentaim"))()
  end
})
Tab:AddButton({
  Name = "稳定穿墙",
  Callback = function()
        local Workspace = game:GetService("Workspace")
        local Players = game:GetService("Players")
        local Clipon = true
        Stepped = game:GetService("RunService").Stepped:Connect(function()
    	if not Clipon == false then
    		for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Players.LocalPlayer.Name then
                    for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end 
                    end 
                end 
            end
    	else
    		Stepped:Disconnect()
    	end
        end)
  end
})

Tab:AddButton({
    Name="我要紫砂",
    Callback=function()
        game.Players.LocalPlayer.Character.Humanoid.Health=0
        HumanDied = true
    end
})

Tab:AddButton({
	Name = "不死但不完全不死（点紫砂去除）",
	Callback = function()
        HumanDied = false
    end
})
Tab:AddButton({
  Name = "高亮",
  Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))()
  end
})
local Section = Tab:AddSection({
	Name = "客户端功能"
})

Tab:AddButton({
  Name = "飞行V3GUI",
  Callback = function ()
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton") 

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false 

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57) 

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000 

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000 

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "fly"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000 

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fly GUI V3"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true 

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true 

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true 

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true 

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, -1, 27) 

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27) 

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false 

speeds = 1 

local speaker = game:GetService("Players").LocalPlayer 

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid") 

nowe = false 

game:GetService("StarterGui"):SetCore("SendNotification", { 
Title = "Fly GUI V3";
Text = "By me_ozone and Quandale The Dinglish XII#3550";
Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5; 

Frame.Active = true -- main = gui
Frame.Draggable = true 

onof.MouseButton1Down:connect(function() 

if nowe == true then
nowe = false 

speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
else 
nowe = true

for i = 1, speeds do
spawn(function() 

local hb = game:GetService("RunService").Heartbeat


tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 

end)
end
game.Players.LocalPlayer.Character.Animate.Disabled = true
local Char = game.Players.LocalPlayer.Character
local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController") 

for i,v in next, Hum:GetPlayingAnimationTracks() do
v:AdjustSpeed(0)
end
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end

if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 50
local speed = 0

local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
if nowe == true then
plr.Character.Humanoid.PlatformStand = true
end
while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
game:GetService("RunService").RenderStepped:Wait() 

if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0,0)
end
--game.Players.LocalPlayer.Character.Animate.Disabled = true
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
end
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false
tpwalking = false
end
end) 

local tis 

up.MouseButton1Down:connect(function()
tis = up.MouseEnter:connect(function()
while tis do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
end
end)
end) 

up.MouseLeave:connect(function()
if tis then
tis:Disconnect()
tis = nil
end
end) 

local dis 

down.MouseButton1Down:connect(function()
dis = down.MouseEnter:connect(function()
while dis do
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
end
end)
end) 

down.MouseLeave:connect(function()
if dis then
dis:Disconnect()
dis = nil
end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
wait(0.7)
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.Animate.Disabled = false 

end)


plus.MouseButton1Down:connect(function()
speeds = speeds + 1
speed.Text = speeds
if nowe == true then


tpwalking = false
for i = 1, speeds do
spawn(function() 

local hb = game:GetService("RunService").Heartbeat

tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 

end)
end
end
end)
mine.MouseButton1Down:connect(function()
if speeds == 1 then
speed.Text = 'cannot be less than 1'
wait(1)
speed.Text = speeds
else
speeds = speeds - 1
speed.Text = speeds
if nowe == true then
tpwalking = false
for i = 1, speeds do
spawn(function() 

local hb = game:GetService("RunService").Heartbeat


tpwalking = true
local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
while tpwalking and hb:Wait() and chr and hum and hum.Parent do
if hum.MoveDirection.Magnitude > 0 then
chr:TranslateBy(hum.MoveDirection)
end
end 

end)
end
end
end
end) 

closebutton.MouseButton1Click:Connect(function()
main:Destroy()
end) 

mini.MouseButton1Click:Connect(function()
up.Visible = false
down.Visible = false
onof.Visible = false
plus.Visible = false
speed.Visible = false
mine.Visible = false
mini.Visible = false
mini2.Visible = true
main.Frame.BackgroundTransparency = 1
closebutton.Position = UDim2.new(0, 0, -1, 57)
end) 

mini2.MouseButton1Click:Connect(function()
up.Visible = true
down.Visible = true
onof.Visible = true
plus.Visible = true
speed.Visible = true
mine.Visible = true
mini.Visible = true
mini2.Visible = false
main.Frame.BackgroundTransparency = 0 
closebutton.Position = UDim2.new(0, 0, -1, 27)
end)
  end
})

Tab:AddButton({
	Name = "控制玩家(汉化👁️",
	Callback = function()	
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/XiaoLing-CODE.tk3usj449llspw1/main/%E7%8E%A9%E5%AE%B6%E6%8E%A7%E5%88%B6%20%E6%B1%89%E5%8C%96.txt"))()
  	end
})

Tab:AddButton({
	Name = "Acrylix（通用）",
	Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/3dsonsuce/acrylix/main/Acrylix'))()
    end
})
local Section = Tab:AddSection({
	Name = "范围"
})
Tab:AddButton({
  Name = "全游戏通用范围",
  Callback = function ()
    local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local label = Instance.new("TextLabel")
local Hitbox = 
Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
main.Position = UDim2.new(0.40427351, 0, 0.34591195, 0)
main.Size = UDim2.new(0, 100, 0, 100)
main.Active = true
main.Draggable = true

label.Name = "label"
label.Parent = main
label.BackgroundColor3 = Color3.fromRGB(139,0,0)
label.Size = UDim2.new(0, 100, 0, 20)
label.Font = Enum.Font.SourceSans
label.Text = "Hitbox Gui"
label.TextColor3 = Color3.fromRGB(0, 0, 0)
label.TextScaled = true
label.TextSize = 5.000
label.TextWrapped = true

Hitbox.Name = "Hitbox"
Hitbox.Parent = main
Hitbox.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Hitbox.Position = UDim2.new(0.114285722, 0, 0.372448981, 0)
Hitbox.Size = UDim2.new(0, 90, 0, 40)
Hitbox.Font = Enum.Font.SourceSans
Hitbox.Text = "Hitbox"
Hitbox.TextColor3 = Color3.fromRGB(0, 0, 0)
Hitbox.TextSize = 40.000
Hitbox.MouseButton1Down:connect(function()
	_G.HeadSize = 20

	_G.Disabled = true


game:GetService('RunService').RenderStepped:connect(function()
		if _G.Disabled then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
						v.Character.HumanoidRootPart.Transparency = 0.7
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
	end)
end)
  end
})

Tab:AddButton({
	Name = "空范围",
	Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E9%80%8F%E8%A7%86.lua"))()
end
})
Tab:AddButton({
  Name = "普通范围",
  Callback = function ()
loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()
  end
})
Tab:AddButton({
  Name = "中等范围",
  Callback = function ()
loadstring(game:HttpGet("https://pastebin.com/raw/x13bwrFb"))()
  end
})
Tab:AddButton({
    Name="全图范围",
    Callback=function()
loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()
    end
})
Tab:AddButton({
    Name="终极范围",
    Callback=function()
loadstring(game:HttpGet("https://pastebin.com/raw/CAQ9x4A7"))()
    end
})
local Section = Tab:AddSection({
	Name = "反甩飞"
})
Tab:AddButton({
	Name = "抗甩飞 Make by:情云",
	Callback = function()
	local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

local LocalPlayer = Services.Players.LocalPlayer

local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
               if Detected == false then
                   game.StarterGui:SetCore("ChatMakeSystemMessage", {
                       Text = "Fling Exploit Detected Player : "..tostring(Player);
                       Color = Color3.fromRGB(255, 200, 0);
                   })
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAdded:Connect(PlayerAdded)
end
})
local Section = Tab:AddSection({
	Name = "其他功能"
})
Tab:AddButton({
	Name = "通用ESP",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
	end
})

Tab:AddButton({
	Name = "电脑键盘",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
  	end    
})


Tab:AddButton({
	Name = "甩飞别人",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()
  	end    
})

Tab:AddButton({
	Name = "转圈fling GUI",
	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
    end
})

Tab:AddButton({
	Name = "跟踪玩家",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()
  	end
})

Tab:AddButton({
	Name = "伪名说话",
	Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()
	end 
})

Tab:AddButton({
	Name = "人物无敌",
	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end    
})

Tab:AddButton({
	Name = "无敌",
	Callback = function()
local lp = game:GetService "Players".LocalPlayer
if lp.Character:FindFirstChild "Head" then
    local char = lp.Character
    char.Archivable = true
    local new = char:Clone()
    new.Parent = workspace
    lp.Character = new
    wait(2)
    local oldhum = char:FindFirstChildWhichIsA "Humanoid"
    local newhum = oldhum:Clone()
    newhum.Parent = char
    newhum.RequiresNeck = false
    oldhum.Parent = nil
    wait(2)
    lp.Character = char
    new:Destroy()
    wait(1)
    newhum:GetPropertyChangedSignal("Health"):Connect(
        function()
            if newhum.Health <= 0 then
                oldhum.Parent = lp.Character
                wait(1)
                oldhum:Destroy()
            end
        end)
    workspace.CurrentCamera.CameraSubject = char
    if char:FindFirstChild "Animate" then
        char.Animate.Disabled = true
        wait(.1)
        char.Animate.Disabled = false
    end
    lp.Character:FindFirstChild "Head":Destroy()
end
end
})

Tab:AddButton({
	Name = "点击传送工具",
	Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse() 
        tool = Instance.new("Tool") 
        tool.RequiresHandle = false 
        tool.Name = "Tool" 
        tool.Activated:connect(function() 
            local pos = mouse.Hit+Vector3.new(0,2.5,0) 
            pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos 
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
	end
})

Tab:AddButton({
	Name = "Dex",
	Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end
})

Tab:AddButton({
    Name = "IY Dex修复版",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end
})

Tab:AddButton({
    Name = "普京比例",
    Callback = function()
        getgenv().Resolution = {
            [".gg/scripters"] = 0.65
        }

        local Camera = workspace.CurrentCamera
        if getgenv().gg_scripters == nil then
            game:GetService("RunService").RenderStepped:Connect(function()
                Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
            end)
        end
        getgenv().gg_scripters = "g5s"
    end
})

Tab:AddButton({
    Name = "恢复比例",
    Callback = function()
        getgenv().Resolution = {
            [".gg/scripters"] = 1
        }

        local Camera = workspace.CurrentCamera
        if getgenv().gg_scripters == nil then
                game:GetService("RunService").RenderStepped:Connect(function()
                Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
            end)
        end
        getgenv().gg_scripters = "g5s"
    end
})
local MainTab = Window:MakeTab({
    Name = "其他脚本",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "脚本搜索器",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end    
})

MainTab:AddButton({
    Name = "聊天测试版",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/rqwEN7QF",true))()
    end    
})

MainTab:AddButton({
    Name = "RTX与FPS优化",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/qcqBuz16"))()
    end    
})

MainTab:AddButton({
    Name = "无名ESP",
    Callback = function()
        pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
    end    
})

MainTab:AddButton({
    Name = "无限指令",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end    
})

MainTab:AddButton({
    Name = "天空中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
    end    
})

MainTab:AddButton({
    Name = "通用ESP/自瞄",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/DeleteMobCheatEngine.lua"))()
    end    
})

MainTab:AddButton({
    Name = "FE抛掷",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/fling/main/all"))()
    end    
})

MainTab:AddButton({
    Name = "FE全员抛掷",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end    
})

MainTab:AddButton({
    Name = "Sirius",
    Callback = function()
        loadstring(game:HttpGet('https://sirius.menu/script'))();
    end    
})

MainTab:AddButton({
    Name = "无名管理员",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end    
})

MainTab:AddButton({
    Name = "Equinox中心",
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/wzB1Qh78"), true))()
    end    
})

MainTab:AddButton({
    Name = "自瞄辅助",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/aimbot/main/fov"))()
    end    
})

MainTab:AddButton({
    Name = "飞行V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/fly/main/universal", true))()
    end    
})

MainTab:AddButton({
    Name = "FE动画切换",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/6pQYX6gU"))()
    end    
})

MainTab:AddButton({
    Name = "Orca中心(快捷键K)",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
    end    
})

MainTab:AddButton({
    Name = "FE角色动作合集(210+表情)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/public-scripts/main/Universal_Animations_Emotes.lua"))()
    end    
})

MainTab:AddButton({
    Name = "命中框调整",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/KAh6QUm9"))()
    end    
})

MainTab:AddButton({
    Name = "传送界面",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/DagerFild/b4776075a0d26ef04394133ee6bd2081/raw/0ed51ac94057d2d9a9f00e1b037b9011c76ca54a/tpGUI", true))()
    end    
})

MainTab:AddButton({
    Name = "UTH中心",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Orealated/Oreal/main/orealated.lol%20UTH%20Loader"))();
    end    
})

MainTab:AddButton({
    Name = "聊天绕过器(自动复制密钥)",
    Callback = function()
        setclipboard("P1d#uT")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/Bypass/8e92f1a31635629214ab4ac38217b97c2642d113/vadrifts"))()
    end    
})

MainTab:AddButton({
    Name = "自瞄辅助V1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/aimbots/main/v1",true))()
    end    
})

MainTab:AddButton({
    Name = "Webhook工具",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/venoxhh/universalscripts/main/webhook_tools"))()
    end    
})

MainTab:AddButton({
    Name = "FPS计数器",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/c63s1M4w/raw",true))()
    end    
})

MainTab:AddButton({
    Name = "旧版命中框扩展",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
    end    
})

MainTab:AddButton({
    Name = "Dark Dex开发者工具",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HummingBird8/HummingRn/main/OptimizedDexForSolara.lua"))()
    end    
})

MainTab:AddButton({
    Name = "卡哇伊风格抛掷",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-FREAKY-FLING/main/kawaii_freaky_fling.lua",true))()
    end    
})

MainTab:AddButton({
    Name = "Nano聊天绕过器(自动复制密钥)",
    Callback = function()
        setclipboard("fuckniggers")
        loadstring(game:HttpGet("https://raw.githubusercortent.com/Yeeeter30/NanoAuto/main/NanoBypass.lua",true))()
    end    
})

MainTab:AddButton({
    Name = "强力自瞄和ESP",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/aa4O82Kw/raw",true))()
    end    
})

if game.GameId==1000233041 then
local GameTab = Window:MakeTab({
    Name = "3008",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
    local Tab3008 = GameTab:AddSection({
        Name = "3008"
    })
    
    GameTab:AddButton({
        Name = "Zeerox中心",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
        end    
    })
    
    GameTab:AddButton({
        Name = "Tbao中心",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHub3008"))()
        end    
    })
    
    GameTab:AddButton({
        Name = "天空中心",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
        end    
    })
    
    GameTab:AddButton({
        Name = "Nut中心",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/9rP6GZK8/raw",true))()
        end    
    })
     -- Game ID 5650396773 - A Dusty Trip
elseif game.GameId == 5650396773 then
    local Tab = Window:MakeTab({
        Name = "A Dusty Trip",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Connect Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/artemy133563/Utilities/main/ADustyTrip", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/dusty/main/trip"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Auto Farm (Click Y To show gui)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/DustyTripThac/main/dustytripthac"))()
        end    
    })

-- Game ID 3168615253 - Ability Wars
elseif game.GameId == 3168615253 then
    local Tab = Window:MakeTab({
        Name = "Ability Wars",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Nut Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/Kzc4felK/raw", true))()
        end    
    })

-- Game ID 6012788864 - Allblox Battles
elseif game.GameId == 6012788864 then
    local Tab = Window:MakeTab({
        Name = "Allblox Battles",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "NS Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/ABB/main/Solara/Mobile"))()
        end    
    })

-- Game ID 5940874374 - Animal Race Simulator
elseif game.GameId == 5940874374 then
    local Tab = Window:MakeTab({
        Name = "Animal Race Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/AnimalRace2222.lua", true))()
        end    
    })
    
    Tab:AddSection({
        Name = "Set spin multi to 1 and turn on for inf everything"
    })

-- Game ID 5753785106 - Anime Heros Simulator
elseif game.GameId == 5753785106 then
    local Tab = Window:MakeTab({
        Name = "Anime Heros Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "DK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
        end    
    })
    
    Tab:AddButton({
        Name = "NS Hub Keyless Crack",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/AH2/main/PC"))()
        end    
    })
    
    Tab:AddSection({
        Name = "Execute one script only or it will give error. You can rejoin and execute other script"
    })

-- Game ID 5864273770 - Anime Punching Simulator 2
elseif game.GameId == 5864273770 then
    local Tab = Window:MakeTab({
        Name = "Anime Punching Simulator 2",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "NS Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/APS2/main/Solara"))()
        end    
    })
    
    Tab:AddButton({
        Name = "DK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
        end    
    })
elseif game.GameId == 5966392437 then
    local Tab = Window:MakeTab({
        Name = "Anime Speed Race",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/AnimeSpeedRace2.lua"))()
        end    
    })
    
    Tab:AddSection({
        Name = "Set spin multi to 1 and turn on for inf everything"
    })

-- Game ID 3989869156 - Ant War
elseif game.GameId == 3989869156 then
    local Tab = Window:MakeTab({
        Name = "Ant War",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Spectrum Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/wisKAhf3/raw",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/AW.lua"))()
        end    
    })

-- Game ID 111958650 - Arsenal
elseif game.GameId == 111958650 then
    local Tab = Window:MakeTab({
        Name = "Arsenal",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddLabel("Don't Execute too many script at same time or it will give error")
    
    Tab:AddButton({
        Name = "QP Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/QPScript/Script/main/Arsenal.txt"))()
        end    
    })
    
    Tab:AddButton({
        Name = "LEG Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/G6Ubkkuv"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Thunder Client Light v2",
        Callback = function()
            loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/b95e8fecdf824e41f4a030044b055add.lua'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Stormware Lite",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/QP-Community/Roblox-Exploit/main/Stormware_Crack"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Tanqr Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/mXQLj82U"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Silent Aim Gui",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/iFDUTWfp"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Quotas Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Insertl/QuotasHub/main/BETAv.0.4"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Open AimBot Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
        end    
    })

-- Game ID 4096039463 - Attack on Titan: Freedom War
elseif game.GameId == 4096039463 then
    local Tab = Window:MakeTab({
        Name = "Attack on Titan: Freedom War",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Pork Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/PorkDevMode/AotFwPublic/main/Script.luau'))()
        end    
    })

-- Game ID 5976020326 - Admin RNG
elseif game.GameId == 5976020326 then
    local Tab = Window:MakeTab({
        Name = "Admin RNG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Roll No Gui",
        Callback = function()
            while true do 
                local args = { [1] = true, [2] = true } 
                game:GetService("ReplicatedStorage").Events.Spin:InvokeServer(unpack(args)) 
                task.wait(0) 
            end
        end    
    })

-- Game ID 5924989485 - Anime Simulator
elseif game.GameId == 5924989485 then
    local Tab = Window:MakeTab({
        Name = "Anime Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Lyzer Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/keyrblxR",true))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kazeruy/LyzerHub/main/ScriptMain"))()
        end    
    })

-- Game ID 3990106548 - Baddie
elseif game.GameId == 3990106548 then
    local Tab = Window:MakeTab({
        Name = "Baddie",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddSection({
        Name = "Click CTRL + V In key text box to paste key"
    })
    
    Tab:AddButton({
        Name = "Legends Hub (Copies Key)",
        Callback = function()
            setclipboard("K6sRxcQnkqd3v8gMtb5EZ2")
            loadstring(game:HttpGet('https://pastefy.app/IB5tM3sE/raw',true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Atm farm",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/g5lXK0Bk/raw",true))()
        end    
    })

-- Game ID 4931927012 - Basket Ball Legends
elseif game.GameId == 4931927012 then
    local Tab = Window:MakeTab({
        Name = "Basket Ball Legends",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Obf Hub",
        Callback = function()
            _G.OBFHUBFREE = "2kmembersgang"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obfhub/free/main/basketmball"))()
        end    
    })

-- Game ID 4019583467 - BE NPC OR DIE!
elseif game.GameId == 4019583467 then
    local Tab = Window:MakeTab({
        Name = "BE NPC OR DIE!",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Arceus X Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BeNpcOrDie"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Icii Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/iciidev/Icii-Cheats/main/iciicheats.lua", true))()
        end    
    })

-- Game ID 2619619496 - Bedwars
elseif game.GameId == 2619619496 then
    local Tab = Window:MakeTab({
        Name = "Bedwars",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Aurora",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Memz Ware",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/bw/main/test"))()
        end    
    })

-- Game ID 601130232 - Bee Swarm Simulator
elseif game.GameId == 601130232 then
    local Tab = Window:MakeTab({
        Name = "Bee Swarm Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddSection({
        Name = "Dont Use Histy Hub with other scripts or it wont work"
    })
    
    Tab:AddButton({
        Name = "Histy Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Historia00012/HISTORIAHUB/main/BSS%20FREE"))()
        end    
    })
    
    Tab:AddButton({
        Name = "BaconBoss Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/BeeSwarmSim/main/BeeSwarmSim"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/29"))()
        end    
    })

-- Game ID 4777817887 - Blade Ball
elseif game.GameId == 4777817887 then
    local Tab = Window:MakeTab({
        Name = "Blade Ball",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddSection({
        Name = "Infinix Hub Key System might be confusing."
    })
    
    Tab:AddButton({
        Name = "Infinix Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/InfiniX/main/Games/Blade%20Ball/main.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "OP Manual Spam",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nqxlOfc/SlzAX17vGCub7iRKVmJid61Bg/main/KwKVzV5SgcFBd9fnpLr4lKCg6.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "NeverLose Hub",
        Callback = function()
            loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\110\102\122\48\122\113\100\121\117\110\34\41\41\40\41\10")()
        end    
    })
    
    Tab:AddButton({
        Name = "Schema Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/manimanni/Schema/main/posse.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "FFJ Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/autoparry.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "EminX Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Balls01 Hub",
        Callback = function()
            loadstring(game:HttpGet("https://rentry.co/7wrzwray/raw",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/songolasangkatangw/memek/main/adakontolsamamemek.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "PitBull Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/main/Loader.lua", true))()
        end    
    })

-- Game ID 5440820902 - Blade Slayer
elseif game.GameId == 5440820902 then
    local Tab = Window:MakeTab({
        Name = "Blade Slayer",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "DK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
        end    
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/1BladeSlayer.lua"))()
        end    
    })

-- Game ID 4953639303 - Block Mayhem
elseif game.GameId == 4953639303 then
    local Tab = Window:MakeTab({
        Name = "Block Mayhem",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Collect Money (Lags Alot)",
        Callback = function()
            loadstring(game:HttpGet("https://scriptblox.com/raw/5X-Block-Mayhem-Auto-farm-updated-13550"))()
        end    
    })
    
    Tab:AddButton({
        Name = "FPS Booster (Use If Too Much Lag)",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/qcqBuz16"))()
        end    
    })

-- Game ID 5678284602 - Block Tales
elseif game.GameId == 5678284602 then
    local Tab = Window:MakeTab({
        Name = "Block Tales",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "God mode / Inf health",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/OtherScripts/main/BlockTalesGodmode.lua"))()
        end    
    })

-- Game ID 88070565 - Welcome to Bloxburg
elseif game.GameId == 88070565 then
    local Tab = Window:MakeTab({
        Name = "Blox Burg",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/bloxburg.lua'))()
        end    
    })

-- Game ID 994732206 - Blox Fruit
elseif game.GameId == 994732206 then
    local Tab = Window:MakeTab({
        Name = "Blox Fruit",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Bloxy Hub PVP Only",
        Callback = function()
            loadstring(game:HttpGet("https://bloxxyserverfiles.netlify.app/MegaBloxxyPVP"))()
        end    
    })
    
    Tab:AddButton({
        Name = "BKHAX Hub",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/koonpeatch/PeatEX/master/BKHAX/BloxFruits"),true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Perd Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/PerdHub/Blosfruitscript/main/PerdLoader"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Zen Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenhubtop/zen_hub_pr/main/zennewwwwui.lua", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Matsune Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Yatsuraa/Yuri/main/Winterhub_V2.lua"))()
        end    
    })
    
    Tab:AddSection({
        Name = "All scripts support lvl farm only nothing else."
    })

-- Game ID 4807308814 - Break In 2
elseif game.GameId == 4807308814 then
    local Tab = Window:MakeTab({
        Name = "Break In 2",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Starry Hub",
        Callback = function()
            loadstring(game:HttpGet('https://github.com/mr-suno/Starry/releases/latest/download/main.lua'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/danielontopp/scripts/main/77_OCM25E2M.lua.txt",true))()
        end    
    })

-- Game ID 1318971886 - Break In
elseif game.GameId == 1318971886 then
    local Tab = Window:MakeTab({
        Name = "Break In",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Magixx Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/vwCPc9hv",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Moon X Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Darkmoonxhubscript/BreakIn1/main/BreakIn1'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Bebo Hub",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/BreakInStory.lua")))()
        end    
    })
    
    Tab:AddButton({
        Name = "X Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/XHub/main/HubLoader.lua", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Open Hub",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Break-In-(Story)-Open-Source-3527",true))()
        end    
    })

-- Game ID 1686885941 - Brookhaven
elseif game.GameId == 1686885941 then
    local Tab = Window:MakeTab({
        Name = "Brookhaven",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "R4D hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Redz hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/REDzHUB/main/TrollVersion",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Get All Tools",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/KFvnRQyu",true))()
        end    
    })

-- Game ID 210851291 - Build A Boat For Treasure
elseif game.GameId == 210851291 then
    local Tab = Window:MakeTab({
        Name = "Build A Boat For Treasure",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Quarty Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Zeerox Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Phantom Hub",
        Callback = function()
            loadstring(game:HttpGet(('https://pastebin.com/raw/Erp5dMPH'),true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Batus's BABFT Hub",
        Callback = function()
            a,b,c = "juywvm","main","babft"
            loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/-Roblox-Projects-/%s/%s"):format(a, b, c)))()
        end    
    })
    
    Tab:AddButton({
        Name = "Ski Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Yousuck780/Build-A-Boat-For-Treasure/main/Build%20A%20Boat%20For%20Treasure", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildABoatForTreasure1002.lua"))()
        end    
    })

-- Game ID 2768038118 - Build A Boat With Blocks
elseif game.GameId == 2768038118 then
    local Tab = Window:MakeTab({
        Name = "Build A Boat With Blocks",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildABoatWithBlocks6969.lua"))()
        end    
    })

-- Game ID 5617346821 - Build A Bridge Simulator
elseif game.GameId == 5617346821 then
    local Tab = Window:MakeTab({
        Name = "Build A Bridge Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildABridgeSim2931.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Tupo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lordjrd/Scripts/main/Build%20a%20Bridge%20Simulator"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/AppleScript001/Build_A_Bridge_Simulator/main/README.md"),true))()
        end    
    })

-- Game ID 4695428699 - Build A Raft or Die
elseif game.GameId == 4695428699 then
    local Tab = Window:MakeTab({
        Name = "Build A Raft or Die",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BuildaRaftorDie30.lua"))()
        end    
    })

-- Game ID 5380927916 - Boss Slayer
elseif game.GameId == 5380927916 then
    local Tab = Window:MakeTab({
        Name = "Boss Slayer",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/BladeSlayer1331.lua"))()
        end    
    })

-- Game ID 2583564222 - Boxing Beta
elseif game.GameId == 2583564222 then
    local Tab = Window:MakeTab({
        Name = "Boxing Beta",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Random OP HUB",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/mxkxkks1/Boxing-Beta-UI/main/main.lua"))()
        end    
    })

-- Game ID 1802741133 - Cabin Crew Simulator
elseif game.GameId == 1802741133 then
    local Tab = Window:MakeTab({
        Name = "Cabin Crew Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/CabinCrewSim.lua'))()
        end    
    })

-- Game ID 274816972 - Car Crushers 2
elseif game.GameId == 274816972 then
    local Tab = Window:MakeTab({
        Name = "Car Crushers 2",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/CarCrushers2.lua",true))()
        end    
    })

-- Game ID 605887098 - Car Dealership Tycoon
elseif game.GameId == 605887098 then
    local Tab = Window:MakeTab({
        Name = "Car Dealership Tycoon",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/cardealership.lua'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Moon Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/F347-FB/Roblox/main/Loader"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Ultimate Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/UltimateHub"))()
        end    
    })

-- Game ID 5747808233 - Catch a Fish Simulator
elseif game.GameId == 5747808233 then
    local Tab = Window:MakeTab({
        Name = "Catch a Fish Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/CatchAFishSim1.lua"))()
        end    
    })

-- Game ID 3936365689 - Clover Retribution
elseif game.GameId == 3936365689 then
    local Tab = Window:MakeTab({
        Name = "Clover Retribution",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Lazy Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/lazy')'not mine: crack by frostlua, lazy hub by LioK'
        end    
    })
    
    Tab:AddButton({
        Name = "EclipseX Hub (Copies Key)",
        Callback = function()
            setclipboard("EZd7kjBvIF")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/JackCSTM/eclipsex/main/script"))()
        end    
    })
    
    Tab:AddLabel("Just Click CTRL + V To Paste Key")

-- Game ID 1390601379 - Combat Warriror
elseif game.GameId == 1390601379 then
    local Tab = Window:MakeTab({
        Name = "Combat Warriror",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Head Hitbox (No GUI)",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/UauTz6D4"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Speed and hitbox",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/combatwarriors'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Bird Hub",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/pexrijZn'))()
        end    
    })

-- Game ID 115797356 - Counter Blox
elseif game.GameId == 115797356 then
    local Tab = Window:MakeTab({
        Name = "Counter Blox",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Matrix Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/fuckmath/shit/main/main.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "FOGOTT Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/counter/main/blox"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Strat Ware",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/StratWare/main/StratWare.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "firebrandw Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Zdayee/firebrandw/main/universal"))()
        end    
    })

-- Game ID 4915449246 - Cursed Arena
elseif game.GameId == 4915449246 then
    local Tab = Window:MakeTab({
        Name = "Cursed Arena",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "NS Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/CA2/main/Solara"))()
        end    
    })

-- Game ID 6307897893 - Car RNG
elseif game.GameId == 6307897893 then
    local Tab = Window:MakeTab({
        Name = "Car RNG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Roll Fast",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/scvLp66w",true))()
        end    
    })

-- Game ID 1008451066 - Da Hood
elseif game.GameId == 1008451066 then
    local Tab = Window:MakeTab({
        Name = "Da Hood",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Polakya Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Vortex Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "BeamedWare Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EliasAtto1/BeamedWare/main/BeamedWare2.0"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Faded Hub",
        Callback = function()
            _G.Toggles = "V" -- You can put any keybind
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NighterEpic/Faded-Grid/main/YesEpic", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Aimlock",
        Callback = function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/Qrto1/aimlock/main/dahod')))()
        end    
    })
    
    Tab:AddButton({
        Name = "Aimlock V2 (Keybind : C To unlock / lock aim)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenOnRoblox/da-hood-camlock/main/.gitignore"))()
        end    
    })

-- Game ID 1650291138 - Demon Fall
elseif game.GameId == 1650291138 then
    local Tab = Window:MakeTab({
        Name = "Demon Fall",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Drowned Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Krakles/main/DrownedHub/Demonfall.lua"))()
        end    
    })

-- Game ID 2440500124 - Doors
elseif game.GameId == 2440500124 or 6516141723 then
    local Tab = Window:MakeTab({
        Name = "Doors",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "FFJ Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Door Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/M4mpGErb",true))()
        end    
    })
        Tab:AddButton({
        Name = "bob Hub[OP]",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/notzanocoddz4/bobdoors/main/main.lua"))()
        end    
    })
Tab:AddButton({
    Name = "怪物提示+跟随宠物",
    Callback = function()
        --loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/Helpful%20Rush.lua"))()
        local char = workspace:WaitForChild(game.Players.LocalPlayer.Name)
        local oxygen = char:GetAttribute("Oxygen")

        Caption = function(text)
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(text,true)
        end


        TypeCaption = function(text, typewait) 
            for i = 1, #text do
                require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption(string.sub(text,1,i) ,true)
                if typewait ~= nil then
                    task.wait(typewait)
                else
                    task.wait(0.2)
                end
            end
        end

        SpeakerIconShow = function(IconId)
            local newui = Instance.new("ScreenGui")
            newui.Parent = game.Players.LocalPlayer.PlayerGui
            newui.Name = "SpeakerIcon"


            local icon = "rbxassetid://"..IconId
            local captiontext = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Caption
            local iconholder = Instance.new("ImageLabel")
            iconholder.Name = "Icon"
            iconholder.Image = icon
            iconholder.Parent = newui
            local aspect = Instance.new("UIAspectRatioConstraint")
            aspect.Parent = iconholder
            local pos =  captiontext.Position + UDim2.new(-.05,-0.031,0,-118)
            iconholder.Size = UDim2.new(0.1, 0,0.18, 0)
            iconholder.BackgroundTransparency = 1

            iconholder.Position = pos




        end
        SpeakerIconHide = function()
            local newui = game.Players.LocalPlayer.PlayerGui.SpeakerIcon
            newui.Name = "BeingRemoved"

            local iconholder = newui.Icon

            local ts = game:GetService("TweenService")
            
            
                            --coroutine.resume(coci)
            ts:Create(iconholder, TweenInfo.new(7), {ImageTransparency = 1}):Play()

            game.Debris:AddItem(newui, 8)
        end

        SolveAnchor = function(item, fully)

            if item:IsA("Model") then
                if item.Name == "_NestHandler" then
                    local AnchorIdentify = {
                        ["A"] = 1,
                        ["B"] = 2,
                        ["C"] = 3,
                        ["D"] = 4,
                        ["E"] = 5,
                        ["F"] = 6
                    }
                    local Anchors = {}

                    while not next(Anchors) and task.wait() do
                        for _, Anchor in item:GetChildren() do
                            if Anchor.Name == "MinesAnchor" and not Anchor:GetAttribute("Activated") then
                                table.insert(Anchors, AnchorIdentify[Anchor.Sign.TextLabel.Text], Anchor)
                            end
                        end

                        local AnchorsIndex = {}
                        for Index in Anchors do
                            table.insert(AnchorsIndex, Index)
                        end

                        local NumberIndex = math.min( unpack(AnchorsIndex) )
                        local NextAnchor = Anchors[NumberIndex]

                        if NumberIndex > 1 then
                            local Code = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.AnchorHintFrame.Code.Text


                            --                        local Solved = SolveAnchor(Code, Offset)


                            if  not NextAnchor:GetAttribute("Activated") and fully then

                                NextAnchor.AnchorRemote:InvokeServer( tostring(Code) )
                            else
                                if not NextAnchor:GetAttribute("Activated") and not fully then
                                    return NextAnchor
                                end

                            end

                        end
                    end


                end
            end
        end


        FireProxy = function(proxy)
            local holdtime = proxy.HoldDuration
            local timeheld = 0
            if fireproximityprompt then
                fireproximityprompt(proxy)
                return
            end

            proxy:InputHoldBegin()
            holdtime = 0.1 --Testing + I know what im doing.
            wait(0.05)
            if holdtime == 0 then
                wait(0.05)
                proxy:InputHoldEnd()
                print("PromptInitiated")
            else
                repeat wait(0.1) timeheld = timeheld+0.1 until timeheld >= holdtime
                wait(0.1)
                proxy:InputHoldEnd()
                print("PromptFinished")
            end
        end

        CheckIf = function(what, where)
            if where:IsAncestorOf(what) then
                return true
            else
                return false
            end

        end

        LerpTo = function(model, target, path)
            local alpha = 0
            local speed = 45
            local dist = (model.PrimaryPart.Position - target.Position).Magnitude
            local relativeSpeed = dist / speed
            local startCFrame = model.PrimaryPart.CFrame
            local loop = nil
            local reachedTarget = Instance.new("BindableEvent")

            loop = game:GetService("RunService").Heartbeat:Connect(function(delta)


                local goalCFrame = startCFrame:Lerp(target.CFrame, alpha)
                model:PivotTo(goalCFrame)
                alpha += delta / relativeSpeed
                if alpha >= 1 then
                    loop:Disconnect()
                    reachedTarget:Fire()
                end
            end)

            reachedTarget.Event:Wait()

        end

        print("got past func")

        local coci = coroutine.create(function()
                        while wait() do
                                
                            while task.wait() do
                                    wait()
                                    
                                        char = workspace:WaitForChild(game.Players.LocalPlayer.Name)
        oxygen = char:GetAttribute("Oxygen")
                        end
                end

                    end)
            
                        coroutine.resume(coci)
        print("running ci")
        --ProxyDoor : CurrentDoor.Lock.UnlockPrompt
        --Event : CurrentDoor.ClientOpen:FireServer()
        --KeyPrompt : HasKey.ModulePrompt
        --ValvePrompt : ValvePrompt

        local roomnumdupe = 0
        local rushhelper = game:GetObjects("rbxassetid://94481096227907")[1]
            rushhelper.Parent = workspace
            local pitch = Instance.new("PitchShiftSoundEffect")
            pitch.Octave = 0.5
            local talk = Instance.new("Sound")
            talk.SoundId = "rbxassetid://18637567424"
            talk.RollOffMaxDistance = 100
            talk.Parent = rushhelper.Main
            talk.Name = "Talk"
            pitch.Parent = talk
            talk.PlaybackSpeed = 0.75
            talk.Volume = 0.2
        local parttofix = Instance.new("Part")
        parttofix.Anchored = true
        parttofix.Parent = workspace
        parttofix.Name = "RotPart"
        parttofix.Position = char:WaitForChild("HumanoidRootPart").Position
        local ogar = char:WaitForChild("Humanoid").AutoRotate
        char:WaitForChild("Humanoid").AutoRotate = false
        parttofix.Rotation = Vector3.new(0, 0, -0)
        parttofix.CanCollide = false
        parttofix.Transparency = 1
        wait()
        char:PivotTo(parttofix.CFrame)
        wait()
        if ogar ~= nil then
        char:WaitForChild("Humanoid").AutoRotate = ogar
        else
            char:WaitForChild("Humanoid").AutoRotate = true
        end
        parttofix:Destroy()
            local newatt = Instance.new("Attachment")
            newatt.Parent = char:WaitForChild("UpperTorso")
            newatt.WorldCFrame = char:WaitForChild("Head").CFrame
            newatt.WorldPosition = char:WaitForChild("Head").Position + Vector3.new(1.705, -0.5, -0.558)
            newatt.Name = "RushAtt"
            rushhelper.Root.AlignPosition.Attachment1 = newatt
            print("loaded rush and positioned it")

            local entitytablelines = {{ 
                "Something is here...",
                "It seems like I'm... aproaching.?",
                "Hide!", 
                "Something's on its way!"-- Rush
            },
            {
                "Something is here... be ready.",
                "Seems like an annoying entity is coming.",
                "Hide!", 
                "It will come back."-- Ambush
            },
            {
                "GO GO GO!",
                "RUN FOR YOUR LIFE!",
                "Run." -- Seek
            },
            {
                "Follow its rules. Turn around when it tells you.", 
                "Halt is up ahead." -- Halt
            },
            {
                "Stay quiet.", 
                "Crouch!", 
                "Don't be loud."--Figure
            },
            {
                "Psst.", 
                "Around you!"--Screech
            },
            {
                "Don't look!", 
                "Avoid eye contact."
            }--Eyes
            ,{
                "Uhm... the door?","Look at the door! Something may be lurking...",
                "Look I'll hand it to you. The number for this room is "..roomnumdupe.."."
            }--Dupe
                ,{
                    "A-120."
                }, {
                    "A-60."
                },{
                    "It- Blitz..."
                },
                {
                    "It isn't funny!",
                    "Stop laughing.",
                    "Giggle up ahead.", 
                    "Watch above you."
                }--Giggle
            }

            local deathmsgs = {{"Sorry I failed you..."},{"..."},{"Are you there!?"}, {"Please, respond!"}, {"What... happened?"},{"I'll do better, I promise..."}}

            local Players = game:GetService("Players")
            local SoundService = game:GetService("SoundService")
            local Camera = workspace.CurrentCamera
            local DeathName = "DeathBackgroundBlue"
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local TweenService = game:GetService("TweenService")
            local remotesfolder = ReplicatedStorage:WaitForChild("RemotesFolder")
            local Player = Players.LocalPlayer
            local PlayerGui = Player:WaitForChild("PlayerGui")
            local MainUI = PlayerGui:WaitForChild("MainUI")
            local Death = MainUI:WaitForChild("Death")
            local HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
            local MainGame = MainUI:WaitForChild("Initiator"):WaitForChild("Main_Game")
            local Health = MainGame:WaitForChild("Health")
            local Music = Health:WaitForChild("Music")
            local UserInputService = game:GetService("UserInputService")



            --Death Handler

            local Skipped = false
            local Ended = false
            remotesfolder.DeathHint.OnClientEvent:Connect(function(DeathHints)
                PlayerGui = Player:WaitForChild("PlayerGui")
                 MainUI = PlayerGui:WaitForChild("MainUI")
                 Death = MainUI:WaitForChild("Death")
            HelpfulDialogue = Death:WaitForChild("HelpfulDialogue")
                Ended = false
            
            --HelpfulDialogue.Visible = false
                --MainGame.fovtarget = 70
            wait(4)
                
                UserInputService.InputBegan:Connect(function(i,proc)
                    if proc then return end

                    if Ended == false then

                        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.Gamepad1 then
                            Skipped = true
                        end
                    end
                end)
            --	loadstring(game:HttpGet("https://raw.githubusercontent.com/LukeLor/LukeLor/refs/heads/main/CaptionDoorsSource.lua"))()
                --SpeakerIconShow("rbxassetid://83305678419163")
                for i, Hint in ipairs(DeathHints) do
                    --	HelpfulDialogue.TextTransparency = 1

                    --Caption(Hint)
                    if Skipped then
                        --Caption("")	
                    else
                        --Caption("")	
                    end
                    local Tick = tick() + 5 + utf8.len(HelpfulDialogue.ContentText) / 30
                    if i == 1 or not Skipped then
                        task.wait(0.5)
                    else
                        task.wait(0.1)
                    end
                    Skipped = false
                    for i2 = 1, 10000000000000 do
                        task.wait()
                        if Tick <= tick() then
                            break
                        end
                        if Skipped then
                            break
                        end
                    end
                    local Time = 0.4
                    if Skipped then
                        Time = 0.25
                    end
                    --	TweenService:Create(HelpfulDialogue, TweenInfo.new(Time, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
                    task.wait(Time + 0.01)
                end
                Ended = true
                --SpeakerIconHide()
                --Caption("")
                wait(0.5)
                SpeakerIconShow("82511368550076")
                    local text = deathmsgs[math.random(1,6)][1]
            for i = 1, #text do


                wait(0.002)
                rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                rushhelper.Main.Talk:Play()
                print(string.sub(text, 1, i))

                Caption(string.sub(text, 1, i))
                wait(0.002)
            end
            
                SpeakerIconHide()
            end)
            print("Initiate mechanic")
            
            game.Workspace.ChildAdded:Connect(function(child)
            if child.Name == "AmbushMoving" then
                local text = entitytablelines[2][math.random(1,4)]
                print(text)
                SpeakerIconShow("99087926706059")
                for i = 1, #text do


                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))

                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end
                SpeakerIconHide()
            elseif child.Name == "RushMoving" then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[1][math.random(1,4)]
                print(text)
                for i = 1, #text do
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end 
                    SpeakerIconHide()


            elseif child.Name == "A60" then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[10][1]
                print(text)
                for i = 1, #text do
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end
                    SpeakerIconHide()
            elseif child.Name == "A120" then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[9][1]
                print(text)
                for i = 1, #text do
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end 
                    SpeakerIconHide()
            elseif child.Name == "BackdoorRush" then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[11][1]
                print(text)
                for i = 1, #text do
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end
                SpeakerIconHide()
            elseif child.Name == "Eyes" or child.Name == "BackdoorLookman" then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[7][math.random(1,2)]
                print(text)
                for i = 1, #text do
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end 
                    SpeakerIconHide()
            end
            end)


            workspace.CurrentCamera.ChildAdded:Connect(function(child)
                
            for _, guidance in pairs(workspace.CurrentCamera:GetChildren()) do
                if guidance:IsA("BasePart") and guidance.Name == "Guidance" then
                    local weld = Instance.new("WeldConstraint")
                    rushhelper:PivotTo(guidance.CFrame)
                    weld.Parent = guidance
                    weld.Part0 = guidance
                    weld.Part1 = rushhelper.Root
                    rushhelper.Root.AlignPosition.Enabled = false
                    rushhelper.Root.Anchored = false
                end
            end
            if child.Name == "Screech" then
                        rushhelper.Top.Attachment.RushNormal.Transparency =  NumberSequence.new( 0.99, 1)
                rushhelper.Bottom.Attachment.RushNormal.Transparency =  NumberSequence.new( 0.99, 1)
                rushhelper.Main.BlackTrail.Transparency = NumberSequence.new( 0.99, 1)
            
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[6][math.random(1,2)]
                print(text)
                for i = 1, #text do
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end
                    SpeakerIconHide()
            end
        end)
        local cool = coroutine.create(function()
                local oc = false
                        while wait() do
                                
                            while task.wait() do
                                    wait()
                                    
                                        if oxygen < 25 and oc == false then
        SpeakerIconShow("99087926706059")
                    local text = "Hey, your oxygen levels are getting low! Hang in there!" 
            for i = 1, #text do


                wait(0.002)
                rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                rushhelper.Main.Talk:Play()
                print(string.sub(text, 1, i))

                Caption(string.sub(text, 1, i))
                wait(0.002)
            end
                SpeakerIconHide()
                        oc = true
        wait(10)
                        oc = false
                        
            
        end
                    end
                end

                    end)
            
                        coroutine.resume(cool)




        workspace.CurrentCamera.ChildRemoved:Connect(function(inst) 
                if inst.Name == "Screech" then
                rushhelper.Top.Attachment.RushNormal.Transparency =  NumberSequence.new( 0)
                rushhelper.Bottom.Attachment.RushNormal.Transparency =  NumberSequence.new( 0)
                rushhelper.Main.BlackTrail.Transparency = NumberSequence.new( 0)
                
            end

                if inst:IsA("BasePart") and inst.Name == "Guidance" then
                                inst.WeldConstraint:Destroy()
                    rushhelper.Root.AlignPosition.Enabled = true
                    rushhelper.Root.Anchored = false
                    
                
            end

                    
            
        end)

        game.Workspace.CurrentRooms.DescendantAdded:Connect(function(v)
                wait(0.01)
            if v:IsA("Model") then
                if v.Name == "_NestHandler" then
                    
                
                    v:WaitForChild("Console", 9e9):WaitForChild("Button", 9e9):WaitForChild("ActivateEventPrompt", 9e9)
                    repeat task.wait() until v.Console.Button.ActivateEventPrompt:GetAttribute("Interactions")

                        
                        
                 
                
                
                
                    local cona = coroutine.create(function()
                        while wait(math.random(15,30)) do
                                
                            while task.wait(math.random(15,30)) do
                                    wait()
                                    local anchor = SolveAnchor(v, false)
                                    if anchor ~= nil then


                                        local pfs = game:GetService("PathfindingService")
                                        local path = pfs:CreatePath()

                                        path:ComputeAsync(rushhelper.Root.Position, anchor.PrimaryPart.Position)
                                        for _, wpts in pairs(path:GetWaypoints()) do
                                            local part = Instance.new("Part")
                                            part.Anchored = true
                                            part.Size = Vector3.new(1,1,1)
                                            part.Position = wpts.Position + Vector3.new(0,4.456,0)
                                            part.Parent = workspace
                                            --part.Shape = Enum.PartType.Ball
                                            part.Name = "Node"
                                            part.Transparency = 1
                                            rushhelper.Root.AlignPosition.Enabled = false
                                            rushhelper.Root.Anchored = true
                                            part.Massless = true
                                            part.CanCollide = false
                                            part.CanTouch = false
                                            part.CanQuery = false
                                            LerpTo(rushhelper, part)
                                        end
                                        SolveAnchor(v, true)
                                        while true do 
                                            wait()
                                            if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
                                                LerpTo(rushhelper, char:WaitForChild("Head"))
                                            else
                                                break
                                            end
                                        end
                                        rushhelper:PivotTo(newatt.WorldCFrame)
                                        rushhelper.Root.Anchored = false
                                        rushhelper.Root.AlignPosition.Enabled = true
                                    end
                                end			

                        end


                    end)
            
                        coroutine.resume(cona)
            

                end 
                end
        end)


        game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
                wait(0.01)
        roomnumdupe = game.ReplicatedStorage.GameData.LatestRoom.Value
                
            local croom = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
            local foundfuses = CheckIf("FuseHolder",croom)
            if foundfuses then
                for _, fuses in croom:GetDescendants() do
                    if fuses:IsA("Model") and fuses.Name =="FuseHolder" then
                        local pfs = game:GetService("PathfindingService")
                        local path = pfs:CreatePath()

                        path:ComputeAsync(rushhelper.Root.Position, fuses.PrimaryPart.Position)
                        for _, wpts in pairs(path:GetWaypoints()) do
                            local part = Instance.new("Part")
                            part.Anchored = true
                            part.Size = Vector3.new(1,1,1)
                            part.Position = wpts.Position + Vector3.new(0,4.456,0)
                            part.Parent = workspace
                            --part.Shape = Enum.PartType.Ball
                            part.Name = "Node"
                            part.Transparency = 1
                            rushhelper.Root.AlignPosition.Enabled = false
                            rushhelper.Root.Anchored = true
                            part.Massless = true
                            part.CanCollide = false
                            part.CanTouch = false
                            part.CanQuery = false
                            LerpTo(rushhelper, part)

                            part:Destroy()


                        end
                        --LerpTo(rushhelper, WaterPump.PrimaryPart)

                        local pathgen = pfs:CreatePath()
                        local gen

                        local hasgen = CheckIf("MinesGenerator", croom)	
                        if hasgen then
                            for _, models in croom:GetDescendants() do
                                if models:IsA("Model") and models.Name == "MinesGenerator" then
                                    gen = models
                                end
                            end
                        end
                        pathgen:ComputeAsync(rushhelper.Root.Position, gen.PrimaryPart.Position)
                        for _, wpts in pairs(pathgen:GetWaypoints()) do
                            local part = Instance.new("Part")
                            part.Anchored = true
                            part.Size = Vector3.new(1,1,1)
                            part.Position = wpts.Position + Vector3.new(0,4.456,0)
                            part.Parent = workspace
                            --part.Shape = Enum.PartType.Ball
                            part.Name = "Node"
                            part.Transparency = 1
                            rushhelper.Root.AlignPosition.Enabled = false
                            rushhelper.Root.Anchored = true
                            part.Massless = true
                            part.CanCollide = false
                            part.CanTouch = false
                            part.CanQuery = false
                            LerpTo(rushhelper, part)

                            part:Destroy()
                        end
                        fuses.FuseObtain.ModulePrompt.MaxActivationDistance = 100000
                        fuses.FuseObtain.ModulePrompt.RequiresLineOfSight = false
                        wait(0.01)
                            FireProxy(fuses.FuseObtain.ModulePrompt)
                            wait(0.01)
                            if hasgen then
                                for _, FuseInput in gen.Fuses:GetChildren() do
                                    if FuseInput:FindFirstChild("FusesPrompt") then
                                        FuseInput.FusePrompt.MaxActivationDistance = 100000
                                        FuseInput.FusesPrompt.RequiresLineOfSight = false
                                        wait(0.01)
                                        FireProxy(FuseInput.FusesPrompt)
                                    end
                                end
                            end


                end
                for _, models in croom:GetDescendants() do
                    if models:IsA("Model") and models.Name == "MinesGenerator" and models.Lever.LeverPrompt.Enabled == true then
                        FireProxy(models.Lever.LeverPrompt)
                    end
                end


                while true do 
                    wait()

                    if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
                        LerpTo(rushhelper, char:WaitForChild("Head"))
                    else
                        break
                    end
                end
                rushhelper:PivotTo(newatt.WorldCFrame)
                rushhelper.Root.Anchored = false
                rushhelper.Root.AlignPosition.Enabled = true
            end end			




            if croom:FindFirstChild("_DamHandler") then
                local cod = coroutine.create(function()
                    while wait(math.random(15,30)) do
                        for _, Flood in croom._DamHandler:GetChildren() do
                            if Flood.Name:sub(1, 5) == "Flood" then
                                for _, WaterPump in Flood.Pumps:GetChildren() do
                                    if WaterPump.Wheel.ValvePrompt.Enabled then
                                        local pfs = game:GetService("PathfindingService")
                                        local path = pfs:CreatePath()

                                        path:ComputeAsync(rushhelper.Root.Position, WaterPump.PrimaryPart.Position)
                                        for _, wpts in pairs(path:GetWaypoints()) do
                                            local part = Instance.new("Part")
                                            part.Anchored = true
                                            part.Size = Vector3.new(1,1,1)
                                            part.Position = wpts.Position + Vector3.new(0,4.456,0)
                                            part.Parent = workspace
                                            --part.Shape = Enum.PartType.Ball
                                            part.Name = "Node"
                                            part.Transparency = 1
                                            rushhelper.Root.AlignPosition.Enabled = false
                                            rushhelper.Root.Anchored = true
                                            part.Massless = true
                                            part.CanCollide = false
                                            part.CanTouch = false
                                            part.CanQuery = false
                                            LerpTo(rushhelper, part)
                                            if WaterPump.Wheel.ValvePrompt.Enabled == false or not WaterPump.Wheel.ValvePrompt then
                                                break
                                            end
                                            part:Destroy()


                                        end
                                        --LerpTo(rushhelper, WaterPump.PrimaryPart)

                                        if WaterPump.Wheel.ValvePrompt.Enabled and WaterPump.Wheel.ValvePrompt then
                                            WaterPump.Wheel.ValvePrompt.MaxActivationDistance = 100000
                                            WaterPump.Wheel.ValvePrompt.RequiresLineOfSight = false
                                            wait(0.01)
                                            FireProxy(WaterPump.Wheel.ValvePrompt)
                                        end


                                        while true do 
                                            wait()

                                            if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
                                                LerpTo(rushhelper, char:WaitForChild("Head"))
                                            else
                                                break
                                            end
                                        end
                                        rushhelper:PivotTo(newatt.WorldCFrame)
                                        rushhelper.Root.Anchored = false
                                        rushhelper.Root.AlignPosition.Enabled = true
                                    end
                                end

                            end
                        end

                    end


                end)
                coroutine.resume(cod)	
            end
                

            if croom:FindFirstChild("LiveBreakerPolePickup") then
                local cobp = coroutine.create(function()
                    while wait(math.random(15,30)) do
                        for _, bpzlp in croom:GetDescendants() do
                            if bpzlp.Name == "LiveBreakerPolePickup" then


                                local pfs = game:GetService("PathfindingService")
                                local path = pfs:CreatePath()

                                path:ComputeAsync(rushhelper.Root.Position, bpzlp.PrimaryPart.Position)
                                for _, wpts in pairs(path:GetWaypoints()) do
                                    local part = Instance.new("Part")
                                    part.Anchored = true
                                    part.Size = Vector3.new(1,1,1)
                                    part.Position = wpts.Position + Vector3.new(0,4.456,0)
                                    part.Parent = workspace
                                    --part.Shape = Enum.PartType.Ball
                                    part.Name = "Node"
                                    part.Transparency = 1
                                    rushhelper.Root.AlignPosition.Enabled = false
                                    rushhelper.Root.Anchored = true
                                    part.Massless = true
                                    part.CanCollide = false
                                    part.CanTouch = false
                                    part.CanQuery = false
                                    LerpTo(rushhelper, part)
                                    part:Destroy()


                                end
                                --	LerpTo(rushhelper, WaterPump.PrimaryPart)
                                local Prompt
                                for _, ActivateEventPrompt in bpzlp:GetChildren() do

                                    if ActivateEventPrompt:IsA("ProximityPrompt") and ActivateEventPrompt.RequiresLineOfSight then
                                        Prompt = ActivateEventPrompt
                                    end

                                end

                                if Prompt  then
                                    Prompt.MaxActivationDistance = 100000
                                    Prompt.RequiresLineOfSight = false		
                                    wait(0.01)
                                    FireProxy(Prompt)
                                end


                                while true do 
                                    wait()

                                    if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
                                        LerpTo(rushhelper, char:WaitForChild("Head"))
                                    else
                                        break
                                    end
                                end
                                rushhelper:PivotTo(newatt.WorldCFrame)
                                rushhelper.Root.Anchored = false
                                rushhelper.Root.AlignPosition.Enabled = true


                            end

                        end

                    end
                end)
                coroutine.resume(cobp)
            end
            


            if croom:FindFirstChild("Modular_Bookshelf") then
                local cob = coroutine.create(function()
                    while wait(math.random(30,45)) do
                                for _, shelfs in croom:GetDescendants() do
                        if shelfs.Name == "Modular_Bookshelf" and shelfs:FindFirstChild("LiveHintBook") then


                            local pfs = game:GetService("PathfindingService")
                            local path = pfs:CreatePath()

                            path:ComputeAsync(rushhelper.Root.Position, shelfs.LiveHintBook.PrimaryPart.Position)
                            for _, wpts in pairs(path:GetWaypoints()) do
                                local part = Instance.new("Part")
                                part.Anchored = true
                                part.Size = Vector3.new(1,1,1)
                                part.Position = wpts.Position + Vector3.new(0,4.456,0)
                                part.Parent = workspace
                                --part.Shape = Enum.PartType.Ball
                                part.Name = "Node"
                                part.Transparency = 1
                                rushhelper.Root.AlignPosition.Enabled = false
                                rushhelper.Root.Anchored = true
                                part.Massless = true
                                part.CanCollide = false
                                part.CanTouch = false
                                part.CanQuery = false
                                LerpTo(rushhelper, part)

                                part:Destroy()


                            end
                            --LerpTo(rushhelper, WaterPump.PrimaryPart)


                            shelfs.LiveHintBook.ActivateEventPrompt.MaxActivationDistance = 100000
                            shelfs.LiveHintBook.ActivateEventPrompt.RequiresLineOfSight = false
                            wait(0.01)
                            FireProxy(shelfs.LiveHintBook.ActivateEventPrompt)



                            while true do 
                                wait()

                                if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
                                    LerpTo(rushhelper, char:WaitForChild("Head"))
                                else
                                    break
                                end
                            end
                            rushhelper:PivotTo(newatt.WorldCFrame)
                            rushhelper.Root.Anchored = false
                            rushhelper.Root.AlignPosition.Enabled = true

                        end

                    end
                            end 


                end)
                coroutine.resume(cob)	
            end
            




            if game.ReplicatedStorage.GameData.ChaseInSession.Value == true then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[3][math.random(1,3)]
                print(text)
                for i = 1, #text do 
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end 
                    SpeakerIconHide()
            end
            if game.ReplicatedStorage.GameData.LatestRoom.Value  == 50 then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[5][math.random(1,3)]
                print(text)
                for i = 1, #text do 
                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))
                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end 
                    SpeakerIconHide()
            end
            for _, dupeRoom in pairs(croom:GetChildren()) do
                if dupeRoom.Name == "DoorFake"   then
                    SpeakerIconShow("99087926706059")
                    local text = entitytablelines[8][math.random(1,3)]
                    print(text)
                    for i = 1, #text do
                        wait(0.002)
                        rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                        rushhelper.Main.Talk:Play()
                        print(string.sub(text, 1, i))
                        Caption(string.sub(text, 1, i))
                        wait(0.002)
                    end
                        SpeakerIconHide()
                    break

                end
            end
            if croom:GetAttribute("RawName") == "HaltHallway" or croom:GetAttribute("RawName") == "JKKKKKKKKSWU" then --
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[4][1]
                print(text)
                for i = 1, #text do


                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))

                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end 
                    SpeakerIconHide()
            end
            if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value + 1]:GetAttribute("RawName") == "HaltHallway" or workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value + 1]:GetAttribute("RawName") == "JKKKKKKKKSWU" then
                SpeakerIconShow("99087926706059")
                local text = entitytablelines[4][2]
                print(text)
                for i = 1, #text do


                    wait(0.002)
                    rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
                    rushhelper.Main.Talk:Play()
                    print(string.sub(text, 1, i))

                    Caption(string.sub(text, 1, i))
                    wait(0.002)
                end 
                    SpeakerIconHide()
            end
            local cokg = coroutine.create(function()
                while true do
                    wait()
                    local HasKey = false
                    local CurrentDoor = croom:WaitForChild("Door")
                    for _,v in pairs(croom:GetDescendants()) do
                        if v.Name == "KeyObtain" then
                            HasKey = v
                                    print("I've got a key to fetch!")
                            wait(0.1)

                            --Get key;
                            local KeyClone = HasKey:Clone()
                            KeyClone.Parent = rushhelper
                            local pfs = game:GetService("PathfindingService")
                            local path = pfs:CreatePath()

                            path:ComputeAsync(rushhelper.Root.Position, HasKey.PrimaryPart.Position)
                            local clone = HasKey:Clone()
                            for _, wpts in pairs(path:GetWaypoints()) do
                                local part = Instance.new("Part")
                                part.Anchored = true
                                part.Size = Vector3.new(1,1,1)
                                part.Position = wpts.Position + Vector3.new(0,4.456,0)
                                part.Parent = workspace
                                --part.Shape = Enum.PartType.Ball
                                part.Name = "Node"
                                rushhelper.Root.AlignPosition.Enabled = false
                                rushhelper.Root.Anchored = true
                                part.Massless = true
                                part.CanCollide = false
                                part.CanTouch = false
                                part.CanQuery = false
                                LerpTo(rushhelper, part)
                                part:Destroy()


                            end
                            --LerpTo(rushhelper, HasKey.PrimaryPart)
                            clone.Parent = rushhelper
                            clone:PivotTo(rushhelper.Root.CFrame)
                            for _, parts in pairs(clone:GetDescendants()) do
                                if parts:IsA("Part") or parts:IsA("MeshPart") or parts:IsA("BasePart") then
                                    parts.Anchored = false
                                    local weld = Instance.new("WeldConstraint")
                                    weld.Parent = rushhelper
                                    weld.Part0 = rushhelper.Root
                                    weld.Part1 = parts
                                    parts.Massless = true
                                    parts.CanCollide = false
                                    parts.CanTouch = false
                                    parts.CanQuery = false
                                    for _, proxiesfound in pairs(parts:GetDescendants()) do
                                        if proxiesfound:IsA("ProximityPrompt") then
                                            proxiesfound:Destroy()
                                        end
                                    end
                                end

                            end


                            local ogmad = HasKey.ModulePrompt.MaxActivationDistance
                            local ogrlos = HasKey.ModulePrompt.RequiresLineOfSight
                            local ogmad2 = CurrentDoor.Lock.MaxActivationDistance
                            local ogrlos2 = CurrentDoor.Lock.RequiresLineOfSight
                            --Go to door
                            local path2 = pfs:CreatePath()

                            path2:ComputeAsync(rushhelper.Root.Position, CurrentDoor.PrimaryPart.Position)

                            for _, wpts in pairs(path2:GetWaypoints()) do
                                local part = Instance.new("Part")
                                part.Anchored = true
                                part.Size = Vector3.new(1,1,1)
                                part.Position = wpts.Position + Vector3.new(0,4.456,0)
                                part.Parent = workspace
                                part.Massless = true
                                part.CanCollide = false
                                part.CanTouch = false
                                part.CanQuery = false
                                --part.Shape = Enum.PartType.Ball
                                part.Name = "Node"
                                rushhelper.Root.AlignPosition.Enabled = false
                                rushhelper.Root.Anchored = true
                                LerpTo(rushhelper, part)
                                part:Destroy()


                            end
                            clone:Destroy()
                            --LerpTo(rushhelper, CurrentDoor.PrimaryPart)

                            HasKey.ModulePrompt.MaxActivationDistance = 100000
                            HasKey.ModulePrompt.RequiresLineOfSight = false
                            wait(0.03)

                            FireProxy(HasKey.ModulePrompt)
                                    HasKey.ModulePrompt.MaxActivationDistance = ogmad
                      HasKey.ModulePrompt.RequiresLineOfSight = ogrlos
                                    
                            local Anims = char:WaitForChild("Humanoid").Animator:GetPlayingAnimationTracks()
                            for _,animation in Anims do 
                                animation:Stop() -- stops pickup
                            end
                            CurrentDoor.Lock.UnlockPrompt.MaxActivationDistance = 100000
                            CurrentDoor.Lock.UnlockPrompt.RequiresLineOfSight = false


                            wait(0.03)
                            FireProxy(CurrentDoor.Lock.UnlockPrompt)
                            local Anims = char:WaitForChild("Humanoid").Animator:GetPlayingAnimationTracks()
                            for _,animation in Anims do 
                                animation:Stop() -- stops unlock
                            end
                            wait(0.03)
                            CurrentDoor.ClientOpen:FireServer()
                            local Anims = char:WaitForChild("Humanoid").Animator:GetPlayingAnimationTracks()
                            for _,animation in Anims do 
                                animation:Stop() -- extra safe
                            end

                            wait(0.1)

                            while true do 
                                wait()

                                if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
                                    LerpTo(rushhelper, char:WaitForChild("Head"))
                                else
                                    break
                                end
                            end
                            rushhelper:PivotTo(newatt.WorldCFrame)
                            rushhelper.Root.Anchored = false
                            rushhelper.Root.AlignPosition.Enabled = true



                            for _,v in pairs(croom:GetDescendants()) do
                                if v.Name == "LeverForGate" then
                                            print("I've got a lever to activate!") 
                                    local pfs = game:GetService("PathfindingService")
                                    local path = pfs:CreatePath()

                                    path:ComputeAsync(rushhelper.Root.Position, v.PrimaryPart.Position)
                                    local clone = HasKey:Clone()
                                    for _, wpts in pairs(path:GetWaypoints()) do
                                        local part = Instance.new("Part")
                                        part.Anchored = true
                                        part.Size = Vector3.new(1,1,1)
                                        part.Position = wpts.Position + Vector3.new(0,4.456,0)
                                        part.Parent = workspace
                                        --part.Shape = Enum.PartType.Ball
                                        part.Name = "Node"
                                        rushhelper.Root.AlignPosition.Enabled = false
                                        rushhelper.Root.Anchored = true
                                        part.Massless = true
                                        part.CanCollide = false
                                        part.CanTouch = false
                                        part.CanQuery = false
                                        LerpTo(rushhelper, part)
                                        part:Destroy()


                                    end
                                    if not v.ActivateEventPrompt:GetAttribute("Interactions") then
        local ogmadg = v.ActivateEventPrompt.MaxActivationDistance
                            local ogrlosg = v.ActivateEventPrompt.RequiresLineOfSight
                                            v.ActivateEventPrompt.MaxActivationDistance = 100000
                            v.ActivateEventPrompt.RequiresLineOfSight = false
                                        FireProxy(v.ActivateEventPrompt)
                                                wait(0.1)
                                                v.ActivateEventPrompt.MaxActivationDistance = ogmadg
                            v.ActivateEventPrompt.RequiresLineOfSight = ogrlosg

                                    end
                                                while true do 
                                wait()

                                if (rushhelper.Root.Position - newatt.WorldPosition).Magnitude > 10 then
                                    LerpTo(rushhelper, char:WaitForChild("Head"))
                                else
                                    break
                                end
                            end
                            rushhelper:PivotTo(newatt.WorldCFrame)
                            rushhelper.Root.Anchored = false
                            rushhelper.Root.AlignPosition.Enabled = true

                                end
                            end
                        end
                        end
                end
                end)

                
        end)

        print("s_msg")
        local text = "你好,我会提示怪物!"
        SpeakerIconShow("99087926706059")
        print(text)
        for i = 1, #text do


            wait(0.002)
            rushhelper.Humanoid:LoadAnimation(rushhelper.Talk):Play()
            rushhelper.Main.Talk:Play()
            print(string.sub(text, 1, i))

            Caption(string.sub(text, 1, i))
            wait(0.002)
        end
        wait(5)
        SpeakerIconHide()
        print("Up and at it.")
        char = workspace:FindFirstChild(game.Players.LocalPlayer.Name)

    end    
})
Tab:AddButton({
    Name = "ESP 脚本 [BY: Q3E4]",
    Callback = function()

    end    
})

-- Game ID 5203828273 - Dress to impress
elseif game.GameId == 5203828273 then
    local Tab = Window:MakeTab({
        Name = "Dress To Impress",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Op Script",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/DTI-GUI-V2/main/dti_gui_v2.lua",true))()
        end    
    })

-- Game ID 1202096104 - Driving Empire
elseif game.GameId == 1202096104 then
    local Tab = Window:MakeTab({
        Name = "Driving Empire",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Marco Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Lightux Hub",
        Callback = function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/DrivingEmpireEvents/main/README.md'),true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/drivingempire.lua'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Nut Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/B3bzy9h6/raw",true))()
        end    
    })

-- Game ID 848145103 - Dungeon Quest
elseif game.GameId == 848145103 then
    local Tab = Window:MakeTab({
        Name = "Dungeon Quest",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "NS Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/keyrblxR",true))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/DQ/main/Solara"))()
        end    
    })
    
    Tab:AddLabel("Key : Nut Hub")

-- Game ID 6002149925 - Dungeon RNG
elseif game.GameId == 6002149925 then
    local Tab = Window:MakeTab({
        Name = "Dungeon RNG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/DungeonRNG231.lua"))()
        end    
    })

-- Game ID 5235037897 - Da Strike
elseif game.GameId == 5235037897 then
    local Tab = Window:MakeTab({
        Name = "Da Strike",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Random Hub No GUI",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/pthS13mK"))();
        end    
    })

-- Game ID 5770990128 - Eat World Simulator
elseif game.GameId == 5770990128 then
    local Tab = Window:MakeTab({
        Name = "Eat World Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/EatBlocksSim70.lua"))()
        end    
    })

-- Game ID 5677613211 - Eat The World
elseif game.GameId == 5677613211 then
    local Tab = Window:MakeTab({
        Name = "Eat The World",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Mongusohio/EatTheWorldMadeBySederYTTV/main/Heresomerizzgrimacr"))()
        end    
    })

-- Game ID 110181652 - Epic MiniGames
elseif game.GameId == 110181652 then
    local Tab = Window:MakeTab({
        Name = "Epic MiniGames",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/YePwz5u5", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SlamminPig/rblxgames/main/Epic%20Minigames/EpicMinigamesGUI"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Zetox V7",
        Callback = function()
            loadstring(game:GetObjects("rbxassetid://02565551523")[1].Source)()
        end    
    })

-- Game ID 3647333358 - Evade
elseif game.GameId == 3647333358 then
    local Tab = Window:MakeTab({
        Name = "Evade",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Tbao Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubEvade"))()
        end    
    })

-- Game ID 4201418016 - Fabled Legacy!
elseif game.GameId == 4201418016 then
    local Tab = Window:MakeTab({
        Name = "Fabled Legacy!",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "NS Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/OhhMyGehlee/FL/main/Solara'))()
        end    
    })

-- Game ID 372226183 - Flee The Facility
elseif game.GameId == 372226183 then
    local Tab = Window:MakeTab({
        Name = "Flee The Facility",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Yarhm Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
        end    
    })
    
    Tab:AddButton({
        Name = "Spimine Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/antisocialb2/SPIMINE-FLEETHEFACILITY/main/script.lua'))()
        end    
    })

-- Game ID 2668101271 - Fling Things And People
elseif game.GameId == 2668101271 then
    local Tab = Window:MakeTab({
        Name = "Fling Things And People",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "VHSV4 Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/fgdergewrgegr/SVH/main/VHSV4"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Auto Aim",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/d0uJjTkD",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Show Spin Timer On Screen",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/n9tbnk4V",true))()
        end    
    })

-- Game ID 3150475059 - Football Fusion 2
elseif game.GameId == 3150475059 then
    local Tab = Window:MakeTab({
        Name = "Football Fusion 2",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ishii Hub",
        Callback = function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7b4f22e1726966f40c91521aaeb11953.lua"))()
        end    
    })

-- Game ID 2132866904 - Fortlines
elseif game.GameId == 2132866904 then
    local Tab = Window:MakeTab({
        Name = "Fortlines",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Thunder Client",
        Callback = function()
            loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/5bebf0b1e173f4baff73449722204837.lua'))()
        end    
    })

-- Game ID 6146301100 - Fat Race
elseif game.GameId == 6146301100 then
    local Tab = Window:MakeTab({
        Name = "Fat Race",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/FatRacer2831.lua"))()
        end    
    })

-- Game ID 5719123726 - Fastest Typer Race
elseif game.GameId == 5719123726 then
    local Tab = Window:MakeTab({
        Name = "Fastest Typer Race",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/TypeRaceSim1.lua"))()
        end    
    })

-- Game ID 648454481 - Grand Piece Online
elseif game.GameId == 648454481 then
    local Tab = Window:MakeTab({
        Name = "Grand Piece Online",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Star Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/StarHub')()
        end    
    })
    
    Tab:AddButton({
        Name = "Fruit Notifier",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ArponAG/Scripts/main/gpo.lua', true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Vamp HUB (Battleroyal only)",
        Callback = function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ab1d247898645c7cf013913b8629963f.lua"))()
        end    
    })

-- Game ID 5012222382 - Gunfight Arena
elseif game.GameId == 5012222382 then
    local Tab = Window:MakeTab({
        Name = "Gunfight Arena",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "BaconBoss Script",
        Callback = function()
            loadstring(game:HttpGet(('https://pastefy.app/FL5mxhtj/raw'),true))()
        end    
    })

-- Game ID 5972059550 - Gym League
elseif game.GameId == 5972059550 then
    local Tab = Window:MakeTab({
        Name = "Gym League",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Tupo Hub (Rayfield Lib)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/x64communist/tupo/main/GymLeague.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Tupo Hub (Fluent Lib)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Gym-league-FluentLib/main/GymLeagueFluent"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Lightux Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/cool83birdcarfly02six/LightuxSolaraSup/main/README.md'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Speed Hub X",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Gym%20League.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "RYK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/ryk')'xdddd虏'
        end    
    })
    
    Tab:AddButton({
        Name = "Cats Hub",
        Callback = function()
            loadstring(game:HttpGet('https://gist.githubusercontent.com/afyzone/d8b7c8da9fb09c80937f4536648dbd9a/raw/'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Ather Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Athergaming/Roblox-Gym-League-Script/main/AtherHub%20Gym%20League%20V1_5.lua"))()
        end    
    })

-- Game ID 1342991001 - Giant Survival!
elseif game.GameId == 1342991001 then
    local Tab = Window:MakeTab({
        Name = "Giant Survival!",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Inf XP & Money",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/F4vBL7yZ",true))()
        end    
    })

-- Game ID 4447252800 - Highway Hooligans
elseif game.GameId == 4447252800 then
    local Tab = Window:MakeTab({
        Name = "Highway Hooligans",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8643/test/main/hooligans", true))()
        end    
    })

-- Game ID 6045016956 - Horror RNG
elseif game.GameId == 6045016956 then
    local Tab = Window:MakeTab({
        Name = "Horror RNG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Rinss Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()
        end    
    })

-- Game ID 8814491 - Hotel Elphant
elseif game.GameId == 8814491 then
    local Tab = Window:MakeTab({
        Name = "Hotel Elphant",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Inf Money",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ROBLOMACK/HotelElephantMoneyGiver/main/HEMG"))()
        end    
    })
    
    Tab:AddParagraph({
        Title = "REMINDER", 
        Content = "YOU NEED TO FUCKING HIT ENTER AFTER TYPING IN PLAYER USERNAME OR AMOUNT thank you"
    })

-- Game ID 5607299070 - IMPOSSIBLE OBBY
elseif game.GameId == 5607299070 then
    local Tab = Window:MakeTab({
        Name = "IMPOSSIBLE OBBY",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Finish Game",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/IMPOSSIBLE/main/OBBY"))()
        end    
    })

-- Game ID 245662005 - Jail Break
elseif game.GameId == 245662005 then
    local Tab = Window:MakeTab({
        Name = "Jail Break",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddSection({
        Name = "If Callback Error then rejoin and execute"
    })
    
    Tab:AddButton({
        Name = "Aoi Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zyn789/Aoi-Script/main/Jailbreak"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Ski Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/skihub.lua'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Jail Break V5",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/ghGgrmWR'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Jail Break V2",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/Gd1H8cxf",true))()
        end    
    })

-- Game ID 5780359296 - Jims RNG
elseif game.GameId == 5780359296 then
    local Tab = Window:MakeTab({
        Name = "Jims RNG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Instant Get Any Aura",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/bims/main/rng",true))()
        end    
    })

-- Game ID 3508322461 - Jujutsu Shenanigans
elseif game.GameId == 3508322461 then
    local Tab = Window:MakeTab({
        Name = "Jujutsu Shenanigans",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "NS Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/JJS/main/Solara"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Legends Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/LOLking123456/Jujutsu/main/Shenanigans'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Fake animation Veux Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/Finallyworks/main/Protected.txt"))()
        end    
    })
    
    Tab:AddButton({
        Name = "ESP",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/R5bfAiMB",true))()
        end    
    })

-- Game ID 5223708703 - Kamehameha Simulator
elseif game.GameId == 5223708703 then
    local Tab = Window:MakeTab({
        Name = "Kamehameha Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Farm (OP)",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/KamehamehaSimulator.lua'))()
        end    
    })

-- Game ID 254394801 - Kat
elseif game.GameId == 254394801 then
    local Tab = Window:MakeTab({
        Name = "Kat",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Lime X Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/78kG7trR", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Delete Other Players Item",
        Callback = function()
            loadstring(game:HttpGet(('https://pastebin.com/raw/6G9GfqjC'),true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Unnamed ESP",
        Callback = function()
            pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
        end    
    })

-- Game ID 1451439645 - King Legacy
elseif game.GameId == 1451439645 then
    local Tab = Window:MakeTab({
        Name = "King Legacy",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Arc Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/PC.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Legend Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Upd6/main/King"))()
        end    
    })

-- Game ID 5361859890 - Launch Into Space Simulator
elseif game.GameId == 5361859890 then
    local Tab = Window:MakeTab({
        Name = "Launch Into Space Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/LaunchIntoSpaceSim.lua'))()
        end    
    })

-- Game ID 1119466531 - Legend Of Speed
elseif game.GameId == 1119466531 then
    local Tab = Window:MakeTab({
        Name = "Legend Of Speed",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Sim Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/E1Kp2r3Y"))();
        end    
    })
    
    Tab:AddButton({
        Name = "Blox Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/KeyRBLXCrack/main/Crack.lua"))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ImPocky/PockyHub/main/Scripts/load.txt"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Vynixius Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Legends%20Of%20Speed/Script.lua"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/KrangH/ScriptsHub/main/Legends_Of_Speedv2"))()
        end    
    })

-- Game ID 279565647 - Lucky blocks
elseif game.GameId == 279565647 then
    local Tab = Window:MakeTab({
        Name = "Lucky blocks",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "LB Hub",
        Callback = function()
            loadstring(game:HttpGet("https://github.com/bruhhwtf/LUCKY-BLOCKS-Battlegrounds-GUI/raw/main/Main"))()
        end    
    })

-- Game ID 2471084 - Lumber Tycoon 2
elseif game.GameId == 2471084 then
    local Tab = Window:MakeTab({
        Name = "Lumber Tycoon 2",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "James Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/dDDrAaN6"))()
        end    
    })
    
    Tab:AddButton({
        Name = "LuaWare V5.0",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/yn0UgQhV"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Butter Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/Root2.lua'))("")
        end    
    })

-- Game ID 2626227051 - Mic Up
elseif game.GameId == 2626227051 then
    local Tab = Window:MakeTab({
        Name = "Mic Up",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/micup.lua'))()
        end    
    })
    
    Tab:AddButton({
        Name = "Sky Hub",
        Callback = function()
            loadstring(game:HttpGet("https://scriptblox.com/raw/3008-2.73-teleport-to-player-worker-esp-grab-food-no-fall-damage-12949"))()
        end    
    })

-- Game ID 5988250208 - Monkey Raft
elseif game.GameId == 5988250208 then
    local Tab = Window:MakeTab({
        Name = "Monkey Raft",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Auto Collect Items (Go near islands)",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/16e4cdEo/raw",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Auto Collect Gold Banana's",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/YS5x5C5z",true))()
        end    
    })

-- Game ID 66654135 - Murder Mystery 2
elseif game.GameId == 66654135 then
    local Tab = Window:MakeTab({
        Name = "Murder Mystery 2",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddParagraph({
        Title = "USE ALT ACC TO TEST SCRIPT FIRST.", 
        Content = "I Do not own any of these mm2 scripts i only add them after testing"
    })
    
    Tab:AddButton({
        Name = "Ski Hub",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yousuck780/mm2/main/mm2"), true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Vynixu's Hub",
        Callback = function()
            loadstring(game:GetObjects("rbxassetid://4001118261")[1].Source)()
        end    
    })
    
    Tab:AddButton({
        Name = "Yarhm Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
        end    
    })
    
    Tab:AddButton({
        Name = "HaxHell Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/haxhell/roblox-scripts/main/murder-mystery-2.lua", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Foggy hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/mm2-foggy/main/script"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Meow Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/testikwatafak/-ProstoHub/main/ProstoHub", true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Mars Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/1andonlymars/MarsHub/main/MM2"))()
        end    
    })

-- Game ID 4348829796 - Murderers VS Sheriffs Duels
elseif game.GameId == 4348829796 then
    local Tab = Window:MakeTab({
        Name = "Murderers VS Sheriffs Duels",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Random Hub (Have hitbox too)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/Murderer-Vs-Sheriff-Duels-/main/Murderer%20Vs%20Sheriff%20Duels"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Hitbox",
        Callback = function()
            loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Update-script-hitbox-9326"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub V2",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/4MvbLUwi",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Random Hub (Best Script)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Sheeshablee73/Scriptss/main/MVSD.lua",true))()
        end    
    })

-- Game ID 1268927906 - Muscle Legends
elseif game.GameId == 1268927906 then
    local Tab = Window:MakeTab({
        Name = "Muscle Legends",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Unique Hub",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Unique-Hub-(14-Gmes)_521",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Neko Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/muscle/main/hub"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Auto Farm (Might take time to load)",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/badmusclelegends.lua'))()
        end    
    })

-- Game ID 6139437092 - mining empire
elseif game.GameId == 6139437092 then
    local Tab = Window:MakeTab({
        Name = "Mining Empire",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Wack hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Janorax/MinerEmpire/main/mainer"))()
        end    
    })

-- Game ID 65241 - Natural Disaster Survival
elseif game.GameId == 65241 then
    local Tab = Window:MakeTab({
        Name = "Natural Disaster Survival",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    Tab:AddButton({
        Name = "Rawnder Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster'))()
        end    
    })
    
    Tab:AddButton({
        Name = "NDS Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAP1ayer/PlayerHubOther/main/PlayerHubLoader.lua",true))()
        end    
    })
    
    Tab:AddButton({
        Name = "Nut Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/Nds/main/script"))()
        end    
    })
    
    Tab:AddButton({
        Name = "Different Walk Animation (R6)",
        Callback = function()
            game.Players.LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=376760331"
        end    
    })
end
if game.GameId == 1335695570 then
    local NinjaTab = Window:MakeTab({
        Name = "Ninja Legends",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    NinjaTab:AddButton({
        Name = "Ski Hub",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yousuck780/ninja-legends/main/no"), true))()
        end    
    })

    NinjaTab:AddButton({
        Name = "Vynixius Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Ninja%20Legends/Script.lua"))()
        end    
    })

    NinjaTab:AddButton({
        Name = "Zepsyy Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Zepsyy2/asd/main/Ninja%20Legends.lua"))()
        end    
    })
end

-- Pancake Battles
if game.GameId == 4295108146 then
    local PancakeTab = Window:MakeTab({
        Name = "Pancake Battles",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    PancakeTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PancakeBattles9942.lua"))()
        end    
    })
end

-- Pet Sim 99
if game.GameId == 3317771874 then
    local PetSimTab = Window:MakeTab({
        Name = "Pet Simulator 99",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    PetSimTab:AddButton({
        Name = "Griffin Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/ps99noq.lua'))() 
        end
    })

    PetSimTab:AddButton({
        Name = "Redz Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua'))() 
        end
    })
end

-- Phantom Forces
if game.GameId == 113491250 then
    local PhantomTab = Window:MakeTab({
        Name = "Phantom Forces",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    PhantomTab:AddLabel("DeleteMob, ThunderClient & HomoHack discontinued")

    PhantomTab:AddButton({ 
        Name = "Ski Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Yousuck780/phantom-forces-new/main/noob"))()
        end    
    })
end

-- Prison Life
if game.GameId == 73885730 then
    local PrisonTab = Window:MakeTab({
        Name = "Prison Life",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    PrisonTab:AddButton({
        Name = "FE Bypass Gui",
        Callback = function()
            loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()
        end    
    })

    PrisonTab:AddButton({
        Name = "Prison Ware Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
        end    
    })

    PrisonTab:AddButton({
        Name = "Nihilize H4X",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/QLtH2v8i'))()
        end    
    })

    PrisonTab:AddButton({
        Name = "Admin Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Juanko-Scripts/Roblox-scripts/main/Prision%20Admin%20Hub%20irufwjskwidiuxejw8uddjjwjdnnwjwjdbb"))()
        end    
    })

    PrisonTab:AddButton({
        Name = "Trigger Admin",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/triger/main/admin"))()
        end    
    })

    PrisonTab:AddButton({
        Name = "PrizzLife Admin",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
        end    
    })

    PrisonTab:AddButton({
        Name = "Anti-Abuser Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/kmWxeu8P",true))()
        end    
    })

    PrisonTab:AddButton({
        Name = "LGBTQ+ Hub (Kill All)",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/a0Bxk3sn",true))()
        end    
    })
end

-- Project Slayers
if game.GameId == 2142948266 then
    local SlayersTab = Window:MakeTab({
        Name = "Project Slayers",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SlayersTab:AddButton({
        Name = "Cloud Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cloudman4416/scripts/main/Loader"))()
        end    
    })

    SlayersTab:AddButton({
        Name = "Blindness Hub Map 1",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/washingtontrichkid2/Newgay/main/ProjectSlayer",true))()
        end    
    })

    SlayersTab:AddButton({
        Name = "Blindness Hub Map 2",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/washingtontrichkid2/Newgay/main/ProjectSlayerMap2",true))()
        end    
    })

    SlayersTab:AddButton({
        Name = "Shark Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/YUJUBz0Z",true))()
        end    
    })

    SlayersTab:AddButton({
        Name = "Frost Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Scripts/main/ProjectSlayers/Script.lua"))();
        end    
    })

    SlayersTab:AddLabel("Frost Hub Key : FrostiesOnTop")
end

-- Pull A Sword
if game.GameId == 4795326392 then
    local SwordTab = Window:MakeTab({
        Name = "Pull A Sword",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SwordTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PullASword3421.lua"))()
        end    
    })

    SwordTab:AddButton({
        Name = "Esohasl Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/itsnoctural/Utilities/main/Closed/Pull%20a%20Sword.lua"))()
        end    
    })

    SwordTab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/PaS"))()
        end    
    })
end

-- Push Up Battles
if game.GameId == 5243717044 then
    local PushUpTab = Window:MakeTab({
        Name = "Push Up Battles",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    PushUpTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PushUpBattles932.lua"))()
        end    
    })
end

-- Pet Hatchers
if game.GameId == 5704018616 then
    local HatchersTab = Window:MakeTab({
        Name = "Pet Hatchers",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    HatchersTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PetHatcher.lua"))()
        end    
    })
end

-- Push-Up Training Simulator
if game.GameId == 6217832823 then
    local PushTrainTab = Window:MakeTab({
        Name = "Push-Up Training Sim",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    PushTrainTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/PushUpTrainingSimulator.lua"))()
        end    
    })
end

-- Race Clicker
if game.GameId == 3476371299 then
    local RaceTab = Window:MakeTab({
        Name = "Race Clicker",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    RaceTab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/c2gAKZU3'))()
        end    
    })

    RaceTab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/raceclicker.lua'))()
        end    
    })
end

-- Rebirth Champions X
if game.GameId == 3258302407 then
    local RebirthTab = Window:MakeTab({
        Name = "Rebirth Champions X",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    RebirthTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/RebirthChampionsX1837.lua"))()
        end    
    })
end

-- Reborn As Swordman
if game.GameId == 5827120940 then
    local RebornTab = Window:MakeTab({
        Name = "Reborn As Swordman",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    RebornTab:AddButton({
        Name = "Ywxos Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/RebornAsSwordman34.lua"))()
        end    
    })

    RebornTab:AddButton({
        Name = "DK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
        end    
    })
end

-- Rivals
if game.GameId == 6035872082 then
    local RivalsTab = Window:MakeTab({
        Name = "Rivals",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    RivalsTab:AddButton({
        Name = "Drowned Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FrostLua/Krakles/main/DrownedHub/Rival.lua"))()
        end    
    })

    RivalsTab:AddButton({
        Name = "Jonny Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/script/main/hub",true))()
        end    
    })

    RivalsTab:AddButton({
        Name = "Op Gui",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Baillee/Rivals-script/main/Rivals-script.lua", true))()
        end    
    })

    RivalsTab:AddButton({
        Name = "Silent Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/KxGOATESQUE/SilentRivals/main/SilentRivals"))()
        end    
    })

    RivalsTab:AddButton({
        Name = "Venox Ware",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivals")))()
        end    
    })

    RivalsTab:AddButton({
        Name = "Venox Ware V2",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/venoxhh/universalscripts/main/rivals/venoxrivalsv2'))()
        end    
    })

    RivalsTab:AddLabel("Join Nut Hub To Bypass Key system")
end

-- Ro Ghoul
if game.GameId == 380704901 then
    local RoGhoulTab = Window:MakeTab({
        Name = "Ro Ghoul",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    RoGhoulTab:AddButton({
        Name = "Zen Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaizenofficiall/ZenHub/main/Roghoul", true))()
        end    
    })
end

-- Running Simulator
if game.GameId == 4933844472 then
    local RunningTab = Window:MakeTab({
        Name = "Running Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    RunningTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/Retarded_German/main/RunningSim.lua"))()
        end    
    })
end

-- Saber Battle Sim
if game.GameId == 5931070224 then
    local SaberTab = Window:MakeTab({
        Name = "Saber Battle Sim",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SaberTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/SaberBattleSim2841.lua"))()
        end    
    })

    SaberTab:AddButton({
        Name = "Nut Hub (Auto Click and fight only)",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/75GYs0rx",true))()
        end    
    })
end

-- Scythe Simulator
if game.GameId == 5998308727 then
    local ScytheTab = Window:MakeTab({
        Name = "Scythe Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    ScytheTab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/scythe/main/Sim"))()
        end    
    })

    ScytheTab:AddButton({
        Name = "Nami Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
        end    
    })
end

-- Slap Battle
if game.GameId == 2380077519 then
    local SlapTab = Window:MakeTab({
        Name = "Slap Battle",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SlapTab:AddLabel("Rejoin and execute if any script show callback error")

    SlapTab:AddButton({
        Name = "Zenon Hub",
        Callback = function()
            setclipboard("Zenon12345")
            loadstring(game:HttpGet("https://pastefy.app/gbwEzNX4/raw"))()
        end    
    })

    SlapTab:AddButton({
        Name = "SB Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/9c5vWtYw",true))()
        end    
    })

    SlapTab:AddButton({
        Name = "Giang Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/AR5f1MT5",true))()
        end    
    })

    SlapTab:AddButton({
        Name = "Dizzy Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/slap/main/dizzyhub",true))()
        end    
    })

    SlapTab:AddButton({
        Name = "Random Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/UABerT22",true))()
        end    
    })
end

-- Slayer Corps
if game.GameId == 4912354124 then
    local SlayerTab = Window:MakeTab({
        Name = "Slayer Corps",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SlayerTab:AddButton({
        Name = "DK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
        end    
    })
end

-- Sol's RNG
if game.GameId == 5361032378 then
    local SolTab = Window:MakeTab({
        Name = "Sol's RNG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SolTab:AddButton({
        Name = "Erudite Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Sol's%20RNG/V2.69"))()
        end    
    })

    SolTab:AddButton({
        Name = "Legends Hub (Copies Key)",
        Callback = function()
            setclipboard("vy5fBGS6nNUuJjgxWhCLpR")
            loadstring(game:HttpGet('https://pastefy.app/55pnwOy3/raw'))()
        end    
    })

    SolTab:AddButton({
        Name = "3itx Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Just3itx/Backup/main/loader.lua"))()
        end    
    })

    SolTab:AddButton({
        Name = "Bacon Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconBossScript/SolRNG/main/SolRNG"))()
        end    
    })
end

-- Specter 1
if game.GameId == 3171190217 then
    local SpecterTab = Window:MakeTab({
        Name = "Specter",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SpecterTab:AddButton({
        Name = "Kitty Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/myown/specter1.lua'))()
        end    
    })

    SpecterTab:AddButton({
        Name = "Navicat Hub",
        Callback = function()
            loadstring(game:HttpGet('https://navicat.glitch.me/Specter/script.lua'))()
        end    
    })
end

-- starving artists
if game.GameId == 3367801828 then
    local StarvingTab = Window:MakeTab({
        Name = "Starving Artists",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    StarvingTab:AddButton({
        Name = "Auto Draw First Sit. (Copies Key)",
        Callback = function()
            setclipboard("usernaxo")
            loadstring(game:HttpGet("https://github.com/usernaxo/RobloxScripts/raw/main/StarvingArtists/DrawingScript.lua", true))()
        end    
    })
end

-- Survive the Killer!
if game.GameId == 1489026993 then
    local SurviveTab = Window:MakeTab({
        Name = "Survive the Killer!",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SurviveTab:AddButton({
        Name = "Turtle Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/STKTurtle.lua'))()
        end    
    })

    SurviveTab:AddButton({
        Name = "Ywxo Hub (The Game Event Only)",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ProjectpopCat/YS_TheGamesEvent/main/SurviveTheKiller.lua'))()
        end    
    })
end

-- Swordmaster Simulator
if game.GameId == 5349025481 then
    local SwordmasterTab = Window:MakeTab({
        Name = "Swordmaster Sim",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SwordmasterTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/CFS.lua"))()
        end    
    })
end

-- Super league soccer
if game.GameId == 4293374620 then
    local SoccerTab = Window:MakeTab({
        Name = "Super League Soccer",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    SoccerTab:AddButton({
        Name = "Beast Hub",
        Callback = function()
            loadstring(game:HttpGet("https://cracklua.github.io/cracks/beast"))()
        end    
    })
end

-- Taxi Boss
if game.GameId == 2851381018 then
    local TaxiTab = Window:MakeTab({
        Name = "Taxi Boss",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TaxiTab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Marco8642/science/main/Taxi%20Boss'))()
        end    
    })

    TaxiTab:AddButton({
        Name = "Shows all NPC Ratings in your F9 Console",
        Callback = function()
            for _, g in pairs(game:GetService("Workspace").NewCustomers:GetDescendants()) do
                pcall(function()
                    if g.Name == "Rating" then
                        if tonumber(g.Text) >= 0.1 and tonumber(g.Text) <= 1.9 then
                            print("Low Ratings: "..tonumber(g.Text))
                        end
                        if tonumber(g.Text) >= 2 and tonumber(g.Text) <= 3.9 then
                            print("Medium Ratings: "..tonumber(g.Text))
                        end
                        if tonumber(g.Text) >= 4 then
                            print("High Ratings: "..tonumber(g.Text))
                        end
                    end
                end)
            end
        end    
    })

    TaxiTab:AddLabel("Alost all scripts are paid so only these 2 working")
end

-- The Strongest Battlegrounds
if game.GameId == 3808081382 then
    local TSBGTab = Window:MakeTab({
        Name = "TSBG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TSBGTab:AddLabel("Use 1-2 Script at same time if u use more u will get Callback error")
    TSBGTab:AddLabel("Copies Key Means it will copy key to your clipboard")

    TSBGTab:AddButton({
        Name = "NS Hub (Key : Nut Hub Op)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/keyrblxR",true))()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/TSBG/main/Solara"))()
        end    
    })

    TSBGTab:AddButton({
        Name = "LN Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/QGD9as3r",true))()
        end    
    })

    TSBGTab:AddButton({
        Name = "Legends Hub (Copies Key)",
        Callback = function()
            setclipboard("349058034Best82397Strongest")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/KJ/main/TSB"))() 
        end    
    })

    TSBGTab:AddButton({
        Name = "FFJ Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/TSBUtils.lua"))() 
        end    
    })

    TSBGTab:AddButton({
        Name = "NBLM Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/NBLMSCRIPTS/NBLMSCRIPTHUB/main/SKIBIDI"))() 
        end    
    })

    TSBGTab:AddButton({
        Name = "Combo's",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/XNKwIjUX/raw"))() 
        end    
    })

    TSBGTab:AddButton({
        Name = "Apoc Hub",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/8J3caWVX",true))() 
        end    
    })

    TSBGTab:AddButton({
        Name = "Kade Hub (not really good)",
        Callback = function()
            loadstring(game:HttpGet(('https://gist.githubusercontent.com/skibiditoiletfan2007/9c8acec1b350bb2a27f4101e2eec803e/raw/bd6fe461cb8fe7b11c53f71999759b1fc5b5e649/TheCaptainsGoDownWithTheirShip.lua'),true))() 
        end    
    })

    TSBGTab:AddButton({
        Name = "Zenon Hub (Copies Key)",
        Callback = function()
            setclipboard("Zenon12345")
            loadstring(game:HttpGet("https://pastefy.app/gbwEzNX4/raw"))()
        end    
    })

    TSBGTab:AddButton({
        Name = "Aim Lock",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sdfesdfsedf/srgtergasdfs/main/silent", true))()
        end    
    })
end

-- therapy
if game.GameId == 3177453609 then
    local TherapyTab = Window:MakeTab({
        Name = "Therapy",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TherapyTab:AddButton({
        Name = "Orbit Player Spam sound",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/p6FEhZZe",true))()
        end    
    })

    TherapyTab:AddButton({
        Name = "Chat Bypass (you have to type words)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-BYPASS/main/kawaii-bypass",true))()
        end    
    })
end

-- Titan Training Sim
if game.GameId == 6174407103 then
    local TitanTab = Window:MakeTab({
        Name = "Titan Training Sim",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TitanTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/TitanTrainingSimulator1881.lua"))()
        end    
    })

    TitanTab:AddButton({
        Name = "Legends Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/TitanTrainingSim.lua'))()
        end    
    })
end

-- Tower of Hell
if game.GameId == 703124385 then
    local TowerTab = Window:MakeTab({
        Name = "Tower of Hell",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TowerTab:AddButton({
        Name = "Starry Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hello-n-bye/starry/main/main.lua", true))() 
        end    
    })

    TowerTab:AddButton({
        Name = "Sprin Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dqvh/dqvh/main/SprinHub",true))() 
        end    
    })

    TowerTab:AddButton({
        Name = "Auto Win",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/Tower_of_Hell_Farm.lua"))() 
        end    
    })
end

-- TPS: Street Soccer
if game.GameId == 124283622 then
    local TPSTab = Window:MakeTab({
        Name = "TPS Soccer",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TPSTab:AddLabel("Dont try to execute all script at same time rejoin & execute")

    TPSTab:AddButton({
        Name = "Byte Hub Auto Farm Goals",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DamThien332/TPS-Script/main/AutoFarmGoals.lua"))() 
        end    
    })

    TPSTab:AddButton({
        Name = "Extrame Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/xfaz/newtps/main/kuchi'))()
        end    
    })

    TPSTab:AddButton({
        Name = "Wreston Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Wreston00/tpsreach/main/tpsreach.lua",true))()
        end    
    })
end

-- Track & Field: Infinite
if game.GameId == 5661134200 then
    local TrackTab = Window:MakeTab({
        Name = "Track & Field",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TrackTab:AddButton({
        Name = "DEP Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/JayXSama/Track-And-Field-Infinite/main/Solara"))()
        end    
    })

    TrackTab:AddButton({
        Name = "Cool Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GuizzyisbackV2LOL/Track-Field/main/free.lua"))()
        end    
    })

    TrackTab:AddButton({
        Name = "Legends Hub (Copies Key)",
        Callback = function()
            setclipboard("328732!!Track839!!")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Field/main/Track"))()
        end    
    })

    TrackTab:AddButton({
        Name = "Olympic Hub (Join Server To Get Key)",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Supremechaotic/Key/main/HUB.lua'))()
        end    
    })

    TrackTab:AddLabel("Legends Hub Will copy key to your clipboard so just click CTRL + V to paste")
end

-- Tycoon RNG
if game.GameId == 6026836726 then
    local TycoonTab = Window:MakeTab({
        Name = "Tycoon RNG",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TycoonTab:AddButton({
        Name = "Madbuk Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MadbukScripts/Scripts/main/Obfuscated%20Tycoon%20RNG.lua"))()
        end    
    })

    TycoonTab:AddButton({
        Name = "RYK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/ryk')()
        end    
    })

    TycoonTab:AddButton({
        Name = "Auto Collect and Obby",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/jjp2iky/scripts/main/TycoonRNG"))()
        end    
    })
end

-- Type soul
if game.GameId == 4871329703 then
    local TypeTab = Window:MakeTab({
        Name = "Type soul",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TypeTab:AddLabel("Don't Execute in lobby join game and execute")

    TypeTab:AddButton({
        Name = "Legends Hub",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/LOLking123456/newtype/main/soul'))()
        end    
    })

    TypeTab:AddLabel("Alost all scripts are paid & Patched so only this 1 working")
end

-- Tower of jumps
if game.GameId == 2805713501 then
    local JumpsTab = Window:MakeTab({
        Name = "Tower of Jumps",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    JumpsTab:AddButton({
        Name = "Devil's Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/towerofjumpscript/main/main"))();
        end    
    })
end

-- Tank Simulator
if game.GameId == 5437909627 then
    local TankTab = Window:MakeTab({
        Name = "Tank Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TankTab:AddButton({
        Name = "Ywxo Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectpopCat/ywxoscripts/main/TankFightSimulator.lua"))()
        end    
    })
end

-- Underground War 2.0
if game.GameId == 3624423521 then
    local WarTab = Window:MakeTab({
        Name = "Underground War",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    WarTab:AddButton({
        Name = "Rinss Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))() 
        end    
    })

    WarTab:AddButton({
        Name = "Kill Aura",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/UndergroundWar'))() 
        end    
    })
end

-- untitled tag game
if game.GameId == 4864117649 then
    local TagTab = Window:MakeTab({
        Name = "Untitled Tag",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    TagTab:AddButton({
        Name = "Ranxware",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/2fYMPJZY",true))() 
        end    
    })

    TagTab:AddButton({
        Name = "Random Hub",
        Callback = function()
            untitled, taggame = pcall(game.HttpGet, game, ('https://%s/%s'):format('skibiditoilet.free-robux.click', 'p/raw/bryvmasag5'));
            assert(untitled, 'Couldnt retrieve script,', taggame);
            loadstring(taggame)();
            game:GetService('UserInputService').MouseIconEnabled = true
        end    
    })

    TagTab:AddButton({
        Name = "Weird Script Tbh but works",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nAlwspa/Into/main/hhh"))()
        end    
    })
end

-- Vehicle Legends
if game.GameId == 1480782352 then
    local VehicleTab = Window:MakeTab({
        Name = "Vehicle Legends",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    VehicleTab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/Vehicle%20legends"))() 
        end    
    })

    VehicleTab:AddButton({
        Name = "Ultimate Hub (Might take time to load)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/IExpIoit/Script/main/UltimateHub"))() 
        end    
    })
end

-- Viral Simulator
if game.GameId == 5166168575 then
    local ViralTab = Window:MakeTab({
        Name = "Viral Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    ViralTab:AddButton({
        Name = "Inf Wins",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/EzPHKHBG",true))() 
        end    
    })
end

-- War Tycoon
if game.GameId == 1526814825 then
    local WarTycoonTab = Window:MakeTab({
        Name = "War Tycoon",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    WarTycoonTab:AddButton({
        Name = "Awaken Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Awakenchan/Misc-Release/main/WarTycoon"))() 
        end    
    })

    WarTycoonTab:AddButton({
        Name = "Random Hub (Have tp box)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Adidsus/rb/194b7151863d8635b13b1a4972c2fed338bb6639/wartyccon.lua",true))()
        end    
    })
end

-- Warrior Simulator
if game.GameId == 5663507626 then
    local WarriorTab = Window:MakeTab({
        Name = "Warrior Simulator",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    WarriorTab:AddButton({
        Name = "DK Hub",
        Callback = function()
            loadstring(game:HttpGet'https://raw.githubusercontent.com/cracklua/cracks/m/dkhub')'you should suck frosts dick'
        end    
    })

    WarriorTab:AddButton({
        Name = "Tupo Hub (Copies Key Just CTRL + V To paste)",
        Callback = function()
            setclipboard("KennielISBACKReborn")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Warrior-Simulator-BETA-/main/Warrior%20Simulator%20%5BBETA%5D%20RayField"))()
        end    
    })
end

-- Westbound
if game.GameId == 873703865 then
    local WestTab = Window:MakeTab({
        Name = "Westbound",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    WestTab:AddButton({
        Name = "Rylor Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Drrushh/Drrushh/main/Kdom",true))(); 
        end    
    })

    WestTab:AddButton({
        Name = "ESP and Silent aim",
        Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/9T8wKLah",true))() 
        end    
    })
end

-- Your Bizarre Adventure
if game.GameId == 1016936714 then
    local YBATab = Window:MakeTab({
        Name = "YBA",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    YBATab:AddButton({
        Name = "Item Farm",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Vuffi2007/YBA-Teleport-to-Items-GUI/main/YBA-Teleport-to-Items-GUI.lua"))()
        end    
    })

    YBATab:AddButton({
        Name = "YBA Sucks Ass",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Tobias020108Back/YBA-AUT/main/YBA-GUI-Rewrite.lua"))()
        end    
    })
end

-- Zombie Attack
if game.GameId == 504035427 then
    local ZombieTab = Window:MakeTab({
        Name = "Zombie Attack",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    ZombieTab:AddButton({
        Name = "Auto Farm",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Qrto1/Zombie/main/attack"))()
        end    
    })

    ZombieTab:AddButton({
        Name = "Ski Hub",
        Callback = function()
            loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yousuck780/Zombie-attack/main/zombie"), true))()
        end    
    })

    ZombieTab:AddButton({
        Name = "Project LKB Hub",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dqtixz/Zombie-Attack-Projeto-LKB/main/Open%20Source"))()
        end    
    })
end
local MiscTab = Window:MakeTab({
    Name = "反馈",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SuggestionText = ""
MiscTab:AddTextbox({
    Name = "游戏建议",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        SuggestionText = Value
    end      
})

MiscTab:AddButton({
    Name = "提交游戏建议",
    Callback = function()
        local url = "https://discord.com/api/webhooks/1429065820146893001/zigtUIgjSqS0twAMNM0LeXmpRuafC5HqwEoOIRkNDccAP1fiClQ174DzQcb-T-TdH3cG"
        local data = {
            ["username"] = '游戏建议',
            ["content"] = '',
            ["avatar_url"] = "https://i.pinimg.com/736x/41/35/a2/4135a2835f33f2ac4150321247e6eeaa.jpg",
            ["embeds"] = {
                {
                    ["description"] = "**游戏建议**",
                    ["color"] = tonumber(2303786),       
                    ["type"] = "rich",
                    ["fields"] = {
                        {
                            ["name"] = "",
                            ["value"] = SuggestionText,
                        }
                    },
                    ["footer"] = {
                        ["text"] = "",
                    },
                    ["timestamp"] = DateTime.now():ToIsoDate(),
                }
            },
        }

        local newdata = game:GetService("HttpService"):JSONEncode(data)
        local headers = {["Content-Type"] = "application/json"}
        local request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}

        request(abcdef)
        wait(20)
    end    
})

local BugReportText = ""
MiscTab:AddTextbox({
    Name = "错误报告",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        BugReportText = Value
    end      
})

MiscTab:AddButton({
    Name = "提交错误报告",
    Callback = function()
        local url = "https://discord.com/api/webhooks/1429068775088455761/1MEM48LFIHXZx4FKG-oidgMswDPhdVp7yLP7bd2ztGf1uJZVjsvVFmD9vOBTVBgVUzCA"
        local data = {
            ["username"] = '错误报告',
            ["content"] = '',
            ["avatar_url"] = "https://i.pinimg.com/736x/41/35/a2/4135a2835f33f2ac4150321247e6eeaa.jpg",
            ["embeds"] = {
                {
                    ["description"] = "**错误报告**",
                    ["color"] = tonumber(2303786),       
                    ["type"] = "rich",
                    ["fields"] = {
                        {
                            ["name"] = "",
                            ["value"] = BugReportText,
                        }
                    },
                    ["footer"] = {
                        ["text"] = "",
                    },
                    ["timestamp"] = DateTime.now():ToIsoDate(),
                }
            },
        }

        local newdata = game:GetService("HttpService"):JSONEncode(data)
        local headers = {["Content-Type"] = "application/json"}
        local request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}

        request(abcdef)
        wait(20)
    end    
})

wait(3.666917813)
local loadTime = os.clock() - startTime
GUI:CreateNotify({
    title = "加载完成!",
    description = string.format("加载耗时: %.3f 秒", loadTime),
})

OrionLib:Init()