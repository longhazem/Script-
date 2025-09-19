-- Player và GUI
local player = game.Players.LocalPlayer
local plane = workspace:WaitForChild("Plane") -- đổi tên cho đúng
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

-- Biến điều khiển
local speed = 0
local maxSpeed = 100
local acceleration = 5
local inputState = {W=false, A=false, S=false, D=false, Shift=false, Space=false}

-- GUI kéo được
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,50)
frame.Position = UDim2.new(0.1,0,0.1,0)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.Active = true
frame.Draggable = true

local toggle = Instance.new("TextLabel", frame)
toggle.Size = UDim2.new(1,0,1,0)
toggle.Text = "WASD + Shift + Space control"
toggle.TextScaled = true
toggle.BackgroundTransparency = 1
toggle.TextColor3 = Color3.fromRGB(255,255,255)

-- Xử lý bàn phím
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.W then inputState.W = true end
    if input.KeyCode == Enum.KeyCode.S then inputState.S = true end
    if input.KeyCode == Enum.KeyCode.A then inputState.A = true end
    if input.KeyCode == Enum.KeyCode.D then inputState.D = true end
    if input.KeyCode == Enum.KeyCode.LeftShift then inputState.Shift = true end
    if input.KeyCode == Enum.KeyCode.Space then inputState.Space = true end
end)

UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then inputState.W = false end
    if input.KeyCode == Enum.KeyCode.S then inputState.S = false end
    if input.KeyCode == Enum.KeyCode.A then inputState.A = false end
    if input.KeyCode == Enum.KeyCode.D then inputState.D = false end
    if input.KeyCode == Enum.KeyCode.LeftShift then inputState.Shift = false end
    if input.KeyCode == Enum.KeyCode.Space then inputState.Space = false end
end)

-- Di chuyển plane
RS.RenderStepped:Connect(function(delta)
    local moveDir = Vector3.new(0,0,0)
    if inputState.W then moveDir = moveDir + Vector3.new(0,0,1) end
    if inputState.S then moveDir = moveDir + Vector3.new(0,0,-1) end
    if inputState.A then moveDir = moveDir + Vector3.new(-1,0,0) end
    if inputState.D then moveDir = moveDir + Vector3.new(1,0,0) end
    local currentSpeed = speed
    if inputState.Shift then currentSpeed = maxSpeed end
    if inputState.Space then moveDir = Vector3.new(0,1,0) end
    plane.CFrame = plane.CFrame + moveDir.Unit * currentSpeed * delta
end)
