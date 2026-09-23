local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local LocalPlayer = Players.LocalPlayer

local PREMIER_USERS = {
    [LocalPlayer.UserId] = "2099/12/31",
}

local function isPremier(player)
    local expiryDate = PREMIER_USERS[player.UserId]
    if not expiryDate then return false end
    local year, month, day = expiryDate:match("(%d+)/(%d+)/(%d+)")
    if not year then return true end
    local expiryTime = os.time({year = tonumber(year), month = tonumber(month), day = tonumber(day), hour = 23, min = 59, sec = 59})
    return os.time() <= expiryTime
end

local darkColors = {
    Color3.fromRGB(15, 23, 42),
    Color3.fromRGB(30, 41, 59),
    Color3.fromRGB(15, 32, 56),
    Color3.fromRGB(23, 37, 84),
    Color3.fromRGB(30, 27, 75),
    Color3.fromRGB(30, 58, 95),
    Color3.fromRGB(12, 74, 110),
    Color3.fromRGB(7, 89, 133),
    Color3.fromRGB(49, 17, 82),
    Color3.fromRGB(59, 7, 100),
    Color3.fromRGB(76, 5, 25),
    Color3.fromRGB(88, 28, 135),
    Color3.fromRGB(67, 20, 90),
    Color3.fromRGB(55, 25, 80),
    Color3.fromRGB(74, 29, 100),
    Color3.fromRGB(69, 10, 10),
    Color3.fromRGB(88, 28, 28),
    Color3.fromRGB(127, 29, 29),
    Color3.fromRGB(95, 15, 35),
    Color3.fromRGB(80, 20, 35),
    Color3.fromRGB(20, 83, 45),
    Color3.fromRGB(22, 65, 45),
    Color3.fromRGB(15, 70, 45),
    Color3.fromRGB(6, 78, 59),
    Color3.fromRGB(10, 60, 50),
    Color3.fromRGB(20, 70, 40),
    Color3.fromRGB(13, 61, 65),
    Color3.fromRGB(10, 70, 75),
    Color3.fromRGB(15, 75, 80),
    Color3.fromRGB(20, 65, 75),
    Color3.fromRGB(113, 63, 18),
    Color3.fromRGB(100, 50, 15),
    Color3.fromRGB(85, 45, 20),
    Color3.fromRGB(92, 40, 12),
    Color3.fromRGB(75, 35, 15),
    Color3.fromRGB(90, 70, 10),
    Color3.fromRGB(110, 80, 10),
    Color3.fromRGB(95, 65, 15),
    Color3.fromRGB(80, 60, 10),
    Color3.fromRGB(90, 15, 55),
    Color3.fromRGB(110, 20, 70),
    Color3.fromRGB(75, 15, 55),
    Color3.fromRGB(85, 25, 65),
    Color3.fromRGB(15, 15, 15),
    Color3.fromRGB(24, 24, 27),
    Color3.fromRGB(31, 31, 36),
    Color3.fromRGB(39, 39, 42),
    Color3.fromRGB(45, 45, 50),
    Color3.fromRGB(50, 50, 55),
    Color3.fromRGB(20, 30, 45),
    Color3.fromRGB(25, 35, 50),
    Color3.fromRGB(30, 40, 55),
    Color3.fromRGB(35, 45, 60),
    Color3.fromRGB(40, 20, 60),
    Color3.fromRGB(20, 40, 60),
    Color3.fromRGB(20, 55, 45),
    Color3.fromRGB(55, 35, 20),
    Color3.fromRGB(60, 20, 35),
    Color3.fromRGB(35, 20, 55),
}

math.randomseed(tick())
local chosenColor = darkColors[math.random(1, #darkColors)]

local gui = Instance.new("ScreenGui")
gui.Name = "Lagger ~ tvx7s"
gui.ResetOnSpawn = false
pcall(function()
    gui.Parent = CoreGui
end)
if not gui.Parent then
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 260, 0, 165)
mainFrame.Position = UDim2.new(0.5, -130, 0, 40)
mainFrame.BackgroundColor3 = chosenColor
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = chosenColor
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 0, 35)
titleLabel.Position = UDim2.new(0, 10, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Lagger ~ tvx7s"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = mainFrame

local lagButton = Instance.new("TextButton")
lagButton.Size = UDim2.new(1, -20, 0, 40)
lagButton.Position = UDim2.new(0, 10, 0, 45)
lagButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
lagButton.BorderSizePixel = 0
lagButton.Text = "اللاق سويتش"
lagButton.Font = Enum.Font.GothamBold
lagButton.TextSize = 14
lagButton.TextColor3 = Color3.fromRGB(255, 255, 255)
lagButton.Parent = mainFrame

local lagCorner = Instance.new("UICorner")
lagCorner.CornerRadius = UDim.new(0, 8)
lagCorner.Parent = lagButton

local lagIndicator = Instance.new("Frame")
lagIndicator.Size = UDim2.new(0, 14, 0, 14)
lagIndicator.Position = UDim2.new(1, 8, 0.5, -7)
lagIndicator.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
lagIndicator.BorderSizePixel = 0
lagIndicator.Parent = lagButton

local lagIndicatorCorner = Instance.new("UICorner")
lagIndicatorCorner.CornerRadius = UDim.new(1, 0)
lagIndicatorCorner.Parent = lagIndicator

local cmdToggleButton = Instance.new("TextButton")
cmdToggleButton.Size = UDim2.new(1, -20, 0, 40)
cmdToggleButton.Position = UDim2.new(0, 10, 0, 95)
cmdToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
cmdToggleButton.BorderSizePixel = 0
cmdToggleButton.Text = "تفعيل الخانة"
cmdToggleButton.Font = Enum.Font.GothamBold
cmdToggleButton.TextSize = 14
cmdToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cmdToggleButton.Parent = mainFrame

local cmdCorner = Instance.new("UICorner")
cmdCorner.CornerRadius = UDim.new(0, 8)
cmdCorner.Parent = cmdToggleButton

local cmdEmojiLabel = Instance.new("TextLabel")
cmdEmojiLabel.Size = UDim2.new(0, 20, 0, 20)
cmdEmojiLabel.Position = UDim2.new(1, 6, 0.5, -10)
cmdEmojiLabel.BackgroundTransparency = 1
cmdEmojiLabel.Text = "🖱️"
cmdEmojiLabel.TextSize = 16
cmdEmojiLabel.Parent = cmdToggleButton

local function showNotification(text)
    local notif = Instance.new("Frame")
    notif.Size = UDim2.new(0, 220, 0, 40)
    notif.Position = UDim2.new(0.5, -110, 0, -50)
    notif.BackgroundColor3 = chosenColor
    notif.BorderSizePixel = 0
    notif.Parent = gui

    local nc = Instance.new("UICorner")
    nc.CornerRadius = UDim.new(0, 8)
    nc.Parent = notif

    local ns = Instance.new("UIStroke")
    ns.Color = Color3.fromRGB(255, 255, 255)
    ns.Thickness = 1
    ns.Parent = notif

    local nt = Instance.new("TextLabel")
    nt.Size = UDim2.new(1, 0, 1, 0)
    nt.BackgroundTransparency = 1
    nt.Text = text
    nt.Font = Enum.Font.GothamBold
    nt.TextSize = 13
    nt.TextColor3 = Color3.fromRGB(255, 255, 255)
    nt.Parent = notif

    pcall(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9114221317"
        sound.Volume = 1
        sound.Parent = SoundService
        sound:Play()
        game:GetService("Debris"):AddItem(sound, 2)
    end)

    TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -110, 0, 15)}):Play()
    task.delay(2, function()
        TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -110, 0, -60)}):Play()
        game:GetService("Debris"):AddItem(notif, 0.5)
    end)
end

showNotification("تم تحميل سكربت Lagger بنجاح")

local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local lagEnabled = false
local lagConnection = nil

lagButton.MouseButton1Click:Connect(function()
    lagEnabled = not lagEnabled
    if lagEnabled then
        lagIndicator.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
        lagConnection = RunService.Heartbeat:Connect(function()
            if lagEnabled then
                local startTick = tick()
                while tick() - startTick < 0.25 do end
            end
        end)
        showNotification("تم تفعيل اللاق سويتش")
    else
        lagIndicator.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
        if lagConnection then
            lagConnection:Disconnect()
            lagConnection = nil
        end
        showNotification("تم إيقاف اللاق سويتش")
    end
end)

cmdToggleButton.MouseButton1Click:Connect(function()
    if not isPremier(LocalPlayer) then
        showNotification("عذرا، يجب توفر صلاحية البريميوم لتفعيل خانة الأوامر")
        return
    end

    local commandGui = Instance.new("ScreenGui")
    commandGui.Name = "CommandBoxGui"
    commandGui.ResetOnSpawn = false
    commandGui.Parent = CoreGui

    local cmdFrame = Instance.new("Frame")
    cmdFrame.Size = UDim2.new(0, 320, 0, 90)
    cmdFrame.Position = UDim2.new(0.5, 130, 0.5, -45)
    cmdFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    cmdFrame.BorderSizePixel = 0
    cmdFrame.Parent = commandGui

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 24)
    titleBar.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = cmdFrame

    local titleLabelCmd = Instance.new("TextLabel")
    titleLabelCmd.Size = UDim2.new(1, -30, 1, 0)
    titleLabelCmd.Position = UDim2.new(0, 8, 0, 0)
    titleLabelCmd.BackgroundTransparency = 1
    titleLabelCmd.Text = "خانة الاوامر"
    titleLabelCmd.TextXAlignment = Enum.TextXAlignment.Left
    titleLabelCmd.Font = Enum.Font.GothamBold
    titleLabelCmd.TextSize = 14
    titleLabelCmd.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabelCmd.Parent = titleBar

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 24, 1, 0)
    closeButton.Position = UDim2.new(1, -24, 0, 0)
    closeButton.BackgroundColor3 = chosenColor
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 14
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Parent = titleBar

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, -94, 0, 32)
    textBox.Position = UDim2.new(0, 8, 0, 34)
    textBox.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    textBox.BorderSizePixel = 0
    textBox.ClearTextOnFocus = false
    textBox.Font = Enum.Font.Code
    textBox.PlaceholderText = ".kill player"
    textBox.Text = ""
    textBox.TextSize = 16
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    textBox.Parent = cmdFrame

    local textBoxStroke = Instance.new("UIStroke")
    textBoxStroke.Color = chosenColor
    textBoxStroke.Thickness = 1
    textBoxStroke.Parent = textBox

    local sendButton = Instance.new("TextButton")
    sendButton.Size = UDim2.new(0, 70, 0, 32)
    sendButton.Position = UDim2.new(1, -78, 0, 34)
    sendButton.BackgroundColor3 = chosenColor
    sendButton.BorderSizePixel = 0
    sendButton.Text = "ارسال"
    sendButton.Font = Enum.Font.GothamBold
    sendButton.TextSize = 15
    sendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    sendButton.Parent = cmdFrame

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, -16, 0, 16)
    statusLabel.Position = UDim2.new(0, 8, 0, 72)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = ""
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextSize = 13
    statusLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.Parent = cmdFrame

    local cmdMainStroke = Instance.new("UIStroke")
    cmdMainStroke.Color = chosenColor
    cmdMainStroke.Thickness = 2
    cmdMainStroke.Parent = cmdFrame

    local cmdMainCorner = Instance.new("UICorner")
    cmdMainCorner.CornerRadius = UDim.new(0, 4)
    cmdMainCorner.Parent = cmdFrame

    local cmdDragging, cmdDragInput, cmdDragStart, cmdStartPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            cmdDragging = true
            cmdDragStart = input.Position
            cmdStartPos = cmdFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    cmdDragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if cmdDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - cmdDragStart
            cmdFrame.Position = UDim2.new(cmdStartPos.X.Scale, cmdStartPos.X.Offset + delta.X, cmdStartPos.Y.Scale, cmdStartPos.Y.Offset + delta.Y)
        end
    end)

    closeButton.MouseButton1Click:Connect(function()
        commandGui:Destroy()
    end)

    sendButton.MouseButton1Click:Connect(function()
        local commandText = tostring(textBox.Text or ""):match("^%s*(.-)%s*$")
        if commandText == "" then return end
        statusLabel.Text = "يتم التنفيذ...."
        statusLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
        
        task.delay(0.5, function()
            statusLabel.Text = "تم تنفيذ الأمر"
            statusLabel.TextColor3 = Color3.fromRGB(34, 197, 94)
            showNotification("تم إرسال الأوامر")
        end)
    end)
end)

spawn(function()
		task.wait(5)

		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Name = "idkk"
		ScreenGui.ResetOnSpawn = false
		ScreenGui.DisplayOrder = 2147483647
		ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

		local success, result = pcall(function()
			return gethui and gethui() or game:GetService("CoreGui")
		end)

		if success and result then
			ScreenGui.Parent = result
		else
			ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
		end

		local BlurEffect = Instance.new("BlurEffect")
		BlurEffect.Size = 0
		BlurEffect.Parent = game:GetService("Lighting")

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 0, 0, 0)
		frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		frame.ClipsDescendants = true
		frame.ZIndex = 1
		frame.Parent = ScreenGui

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 14)
		corner.Parent = frame

		local stroke = Instance.new("UIStroke")
		stroke.Color = darkColors
		stroke.Thickness = 2.5
		stroke.Parent = frame

		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, 0, 0, 60)
		title.BackgroundTransparency = 1
		title.Text = "🚨 TVX TEAM 🚨"
		title.TextColor3 = Color3.fromRGB(capturedR, secondaryCapturedG, b)
		title.Font = Enum.Font.GothamBlack
		title.TextSize = 28
		title.ZIndex = 2
		title.Parent = frame

		local body = Instance.new("TextLabel")
		body.Size = UDim2.new(1, -40, 1, -70)
		body.Position = UDim2.new(0, 20, 0, 60)
		body.BackgroundTransparency = 1
		body.Text = "🚨 إعلان هام 🚨\n\nرجاء خش الديسكورد لاهنت ابي دعم منك الله يسعدك ولا تنسى ترسل لي اخوياك ترا اذا مشيت على هذا الحال بدون ما تسوي شي حياتك بتصير اسوء مدري وش دخل بس رجاء خش الدس\n\nUser discord: @t_v_x 🇸🇦"
		body.Font = Enum.Font.GothamBold
		body.TextColor3 = Color3.fromRGB(240, 240, 240)
		body.TextSize = 20
		body.TextWrapped = true
		body.TextYAlignment = Enum.TextYAlignment.Top
		body.ZIndex = 2
		body.Parent = frame

		local glow = Instance.new("Frame")
		glow.Size = UDim2.new(0, 120, 1.5, 0)
		glow.Position = UDim2.new(-0.3, 0, -0.25, 0)
		glow.Rotation = 20
		glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glow.BorderSizePixel = 0
		glow.ZIndex = 3
		glow.Parent = frame

		local glowGradient = Instance.new("UIGradient")
		glowGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
		glowGradient.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.5, 0.4),
			NumberSequenceKeypoint.new(1, 1)
		})
		glowGradient.Parent = glow

		game:GetService("TweenService"):Create(frame, TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 550, 0, 320)
		}):Play()

		game:GetService("TweenService"):Create(BlurEffect, TweenInfo.new(0.7), {
			Size = 24
		}):Play()

		task.delay(0.5, function()
			game:GetService("TweenService"):Create(glow, TweenInfo.new(1.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
				Position = UDim2.new(1.2, 0, -0.5, 0)
			}):Play()
		end)

		task.delay(5, function()
			game:GetService("TweenService"):Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()

			game:GetService("TweenService"):Create(BlurEffect, TweenInfo.new(0.6), {
				Size = 0
			}):Play()

			task.wait(0.6)
			ScreenGui:Destroy()
			BlurEffect:Destroy()
		end)
	end)

for _, btn in pairs(getgenv().TVX:GetDescendants()) do
    if btn:IsA("TextButton") or btn:IsA("ImageButton") then
        if not btn:FindFirstChildOfClass("UICorner") then
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 7)
            corner.Parent = btn
        end
    end
end)
