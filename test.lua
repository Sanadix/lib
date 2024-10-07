local notificationLib = {}
notificationLib.activeNotifications = {}
function notificationLib:createNotification(text, duration)
    duration = duration or 5

    local notificationFrame = Instance.new("Frame")
    notificationFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    notificationFrame.BorderSizePixel = 0
    notificationFrame.Size = UDim2.new(0, 250, 0, 50)
    notificationFrame.Position = UDim2.new(1, -260, 1, -60 - (#self.activeNotifications * 60))
    notificationFrame.AnchorPoint = Vector2.new(1, 1)
    notificationFrame.BackgroundTransparency = 1

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = notificationFrame
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, -10, 1, -10)
    textLabel.Position = UDim2.new(0, 5, 0, 5)
    textLabel.Font = Enum.Font.Code
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(244, 244, 244)
    textLabel.TextSize = 14
    textLabel.TextXAlignment = Enum.TextXAlignment.Left

    notificationFrame.Parent = game.CoreGui

    table.insert(self.activeNotifications, notificationFrame)
    game:GetService("TweenService"):Create(notificationFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()

    task.spawn(function()
        wait(duration)
        game:GetService("TweenService"):Create(notificationFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        wait(0.3)
        notificationFrame:Destroy()
        table.remove(self.activeNotifications, table.find(self.activeNotifications, notificationFrame))
    end)
end

return notificationLib
