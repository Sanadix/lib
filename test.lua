local tweenService = game:GetService("TweenService")
local coreGui = game:GetService("CoreGui")

local notificationLibrary = {}
local notifications = {}

function notificationLibrary:notify(text, duration)
    duration = duration or 5 

    local notification = Instance.new("Frame")
    notification.BackgroundTransparency = 1
    notification.Size = UDim2.new(0, 250, 0, 50)
    notification.Position = UDim2.new(1, 300, 1, -100) 
    notification.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    notification.BorderSizePixel = 2
    notification.BorderColor3 = Color3.fromRGB(60, 60, 60)
    notification.Parent = coreGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Text = text
    textLabel.Font = Enum.Font.Code
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 14
    textLabel.BackgroundTransparency = 1
    textLabel.Size = UDim2.new(1, -10, 1, -10)
    textLabel.Position = UDim2.new(0, 5, 0, 5)
    textLabel.TextWrapped = true
    textLabel.Parent = notification

    table.insert(notifications, notification)
    self:updatePositions()

    local tweenIn = tweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -260, 1, -100 - (#notifications - 1) * 55),
        BackgroundTransparency = 0
    })
    tweenIn:Play()

    task.delay(duration, function()
        local tweenOut = tweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 300, 1, -100 - (#notifications - 1) * 55),
            BackgroundTransparency = 1
        })
        tweenOut:Play()

        tweenOut.Completed:Connect(function()
            notification:Destroy()
            table.remove(notifications, table.find(notifications, notification))
            self:updatePositions()
        end)
    end)
end

function notificationLibrary:updatePositions()
    for i, notification in ipairs(notifications) do
        local tween = tweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, -260, 1, -100 - (i - 1) * 55)
        })
        tween:Play()
    end
end

return notificationLibrary
