local tweenService = game:GetService("TweenService")

local notifyLibrary = {
    notifications = {},
    playing = false
}

function notifyLibrary:notify(text, duration)
    duration = duration or 3

    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.Position = UDim2.new(1, -320, 1, -100) 
    notification.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    notification.BorderSizePixel = 0
    notification.BackgroundTransparency = 1
    notification.Parent = game:GetService("CoreGui")

    local textLabel = Instance.new("TextLabel", notification)
    textLabel.Size = UDim2.new(1, -10, 1, -10)
    textLabel.Position = UDim2.new(0, 5, 0, 5)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.Font = Enum.Font.Code
    textLabel.TextSize = 14
    textLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left

    tweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
    table.insert(notifyLibrary.notifications, notification)

    task.delay(duration, function()
        tweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        task.delay(0.3, function()
            notification:Destroy()
        end)
    end)
end

return notifyLibrary
