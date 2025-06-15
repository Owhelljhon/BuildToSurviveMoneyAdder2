-- Build to Survive Money GUI by Owhelljhon (Typable Edition)
local max = 5000
local value = 0

local function rainbow()
	local t = tick() * 2
	return Color3.fromHSV((t % 5) / 5, 1, 1)
end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "MoneyAdderGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 160)
frame.Position = UDim2.new(0.5, -125, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
title.Text = "Script by Owhelljhon"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Rainbow effect
spawn(function()
	while true do
		title.TextColor3 = rainbow()
		wait(0.1)
	end
end)

-- Buttons & TextBox
local minus = Instance.new("TextButton", frame)
minus.Size = UDim2.new(0, 60, 0, 60)
minus.Position = UDim2.new(0, 10, 0.3, 0)
minus.Text = "-"
minus.TextScaled = true
minus.BackgroundColor3 = Color3.fromRGB(255, 80, 80)

local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(0, 60, 0, 60)
input.Position = UDim2.new(0.5, -30, 0.3, 0)
input.Text = tostring(value)
input.TextScaled = true
input.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local plus = Instance.new("TextButton", frame)
plus.Size = UDim2.new(0, 60, 0, 60)
plus.Position = UDim2.new(1, -70, 0.3, 0)
plus.Text = "+"
plus.TextScaled = true
plus.BackgroundColor3 = Color3.fromRGB(80, 255, 80)

local add = Instance.new("TextButton", frame)
add.Size = UDim2.new(0.8, 0, 0, 30)
add.Position = UDim2.new(0.1, 0, 0.8, 0)
add.Text = "ADD"
add.TextScaled = true
add.BackgroundColor3 = Color3.fromRGB(100, 200, 255)

-- Button Events
plus.MouseButton1Click:Connect(function()
	value = tonumber(input.Text) or 0
	if value < max then
		value += 1
		input.Text = tostring(value)
	end
end)

minus.MouseButton1Click:Connect(function()
	value = tonumber(input.Text) or 0
	if value > 0 then
		value -= 1
		input.Text = tostring(value)
	end
end)

add.MouseButton1Click:Connect(function()
	value = tonumber(input.Text) or 0
	if value >= 0 and value <= max then
		local remote = game:GetService("ReplicatedStorage"):FindFirstChild("AddMoney")
		if remote then
			pcall(function()
				remote:FireServer(value)
			end)
		end
	end
end)
