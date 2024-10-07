local NotificationLibrary = {}
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local ScreenGui, NotificationContainer

function NotificationLibrary:Load()
    if not ScreenGui then
        ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "NotificationLibrary"
        ScreenGui.Parent = CoreGui

        NotificationContainer = Instance.new("Frame")
        NotificationContainer.Name = "NotificationContainer"
        NotificationContainer.AnchorPoint = Vector2.new(1, 1)
        NotificationContainer.Position = UDim2.new(1, -10, 1, -10)
        NotificationContainer.Size = UDim2.new(0, 300, 0, 200)
        NotificationContainer.BackgroundTransparency = 1
        NotificationContainer.Parent = ScreenGui
    end
end

function NotificationLibrary:SendNotification(text, duration)
    if not ScreenGui then
        NotificationLibrary:Load()
    end

    local Notification = Instance.new("Frame")
    Notification.Name = "Notification"
    Notification.Size = UDim2.new(0, 0, 0, 50)
    Notification.BackgroundTransparency = 0.1
    Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Notification.BorderSizePixel = 0
    Notification.AnchorPoint = Vector2.new(1, 1)
    Notification.Position = UDim2.new(1, 0, 1, 0)
    Notification.Parent = NotificationContainer

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "TextLabel"
    TextLabel.Size = UDim2.new(1, -10, 1, -10)
    TextLabel.Position = UDim2.new(0, 5, 0, 5)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = text
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.Font = Enum.Font.Code
    TextLabel.TextSize = 14
    TextLabel.TextWrapped = true
    TextLabel.Parent = Notification

    TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0, 50)
    }):Play()

    task.delay(duration, function()
        TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 50)
        }):Play()
        task.delay(0.3, function()
            Notification:Destroy()
        end)
    end)
end

return NotificationLibrary
