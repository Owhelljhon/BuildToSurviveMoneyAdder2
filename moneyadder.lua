-- Build to Survive Money GUI
local max = 5000
local value = 0

local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 100)
frame.Position = UDim2.new(0.5, -110, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

local minus = Instance.new("TextButton", frame)
minus.Size = UDim2.new(0, 60, 0, 60)
minus.Position = UDim2.new(0, 10, 0.5, -30)
minus.Text = "-"
minus.TextScaled = true
minus.BackgroundColor3 = Color3.fromRGB(255, 80, 80)

local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(0, 60, 0, 60)
label.Position = UDim2.new(0.5, -30, 0.5, -30)
label.Text = tostring(value)
label.TextScaled = true
label.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local plus = Instance.new("TextButton", frame)
plus.Size = UDim2.new(0, 60, 0, 60)
plus.Position = UDim2.new(1, -70, 0.5, -30)
plus.Text = "+"
plus.TextScaled = true
plus.BackgroundColor3 = Color3.fromRGB(80, 255, 80)

plus.MouseButton1Click:Connect(function()
    if value < max then
        value += 1
        label.Text = tostring(value)
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("AddMoney")
        if remote then pcall(function() remote:FireServer(value) end) end
    end
end)

minus.MouseButton1Click:Connect(function()
    if value > 0 then
        value -= 1
        label.Text = tostring(value)
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild("AddMoney")
        if remote then pcall(function() remote:FireServer(value) end) end
    end
end)