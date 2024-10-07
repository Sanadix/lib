local tweenService = game:GetService("TweenService")

local library = {
    notifications = {},
    playingNotification = false
}

function library:Tween(...)
    tweenService:Create(...):Play()
end

function library:notify(text)
    if self.playingNotification then return end
    self.playingNotification = true
    
    local notification = Instance.new("Frame")
    notification.AnchorPoint = Vector2.new(1, 1)
    notification.Position = UDim2.new(1, -10, 1, -10)
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    notification.BorderSizePixel = 0
    notification.Parent = game:GetService("CoreGui")

    local label = Instance.new("TextLabel")
    label.Text = text
    label.Font = Enum.Font.Code
    label.TextColor3 = Color3.fromRGB(244, 244, 244)
    label.TextSize = 14
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, -20, 1, -10)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = notification

    self:Tween(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -10, 1, -70)})

    task.wait(3)
    self:Tween(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, -10, 1, 10)})

    task.wait(0.5)
    notification:Destroy()
    self.playingNotification = false
end

return library
