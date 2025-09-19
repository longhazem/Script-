-- Script lái máy bay RBM5
local player = game.Players.LocalPlayer
local plane = workspace:WaitForChild("Plane")

local speed = 0
local maxSpeed = 100
local acceleration = 5
local turnSpeed = 2
local inputState = {W=false, S=false, A=false, D=false}

-- GUI kéo được
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,100)
frame.Position = UDim2.new(0.1,0,0.1,0)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.Active = true
frame.Draggable = true

-- Toggle nút W/A/S/D hiển thị
local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0,200,0,30)
toggle.Position = UDim2.new(0,0,0,0)
toggle.Text = "Ẩn/Hiện nút"
toggle.TextScaled = true
local buttonsVisible = true
local keys = {"W","A","S","D"}
local keyButtons = {}
for i,key in ipairs(keys) do
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0,40,0,40)
    btn.Position = UDim2.new(0,(i-1)*50,0,50)
    btn.Text = key
    btn.TextScaled = true
    keyButtons[key] = btn
end
toggle.MouseButton1Click:Connect(function()
    buttonsVisible = not buttonsVisible
    for _,btn in pairs(keyButtons) do
        btn.Visible = buttonsVisible
    end
end)

-- Xử lý bàn phím
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.W then inputState.W=true end
    if input.KeyCode == Enum.KeyCode.S then inputState.S=true end
    if input.KeyCode == Enum.KeyCode.A then inputState.A=true end
    if input.KeyCode == Enum.KeyCode.D then inputState.D=true end
end)
UIS.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then inputState.W=false end
    if input.KeyCode == Enum.KeyCode.S then inputState.S=false end
    if input.KeyCode == Enum.KeyCode.A then inputState.A=false end
    if input.KeyCode == Enum.KeyCode.D then inputState.D=false end
end)

-- Di chuyển máy bay
local RS = game:GetService("RunService")
RS.RenderStepped:Connect(function(delta)
    if inputState.W then speed = math.min(speed+acceleration,maxSpeed)
    elseif inputState.S then speed = math.max(speed-acceleration,-maxSpeed/2)
    else speed = speed*0.95 end

    local rotation = CFrame.Angles(0,0,0)
    if inputState.A then rotation = CFrame.Angles(0, math.rad(-turnSpeed),0)
    elseif inputState.D then rotation = CFrame.Angles(0, math.rad(turnSpeed),0) end

    plane.CFrame = plane.CFrame * rotation + plane.CFrame.LookVector * speed * delta
end)
