local library = {}

function library:notify(text, duration)
    duration = duration or 3 
    local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 300, 0, 50)
    frame.Position = UDim2.new(1, -310, 1, -60)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    frame.BorderSizePixel = 2

    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, -10, 1, -10)
    textLabel.Position = UDim2.new(0, 5, 0, 5)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.Font = Enum.Font.Code
    textLabel.TextSize = 14
    textLabel.TextColor3 = Color3.fromRGB(244, 244, 244)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.TextYAlignment = Enum.TextYAlignment.Center

    frame:TweenPosition(UDim2.new(1, -310, 1, -120), "Out", "Quad", 0.5, true)

    spawn(function()
        wait(duration)
        frame:TweenPosition(UDim2.new(1, -310, 1, 0), "In", "Quad", 0.5, true)
        wait(0.5)
        screenGui:Destroy()
    end)
end

return library
