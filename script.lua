-- Example Speed and Jump Hub for Roblox
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Set default values for speed and jump height
local defaultSpeed = humanoid.WalkSpeed
local defaultJump = humanoid.JumpHeight

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Speed and Jump Buttons
local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0, 200, 0, 50)
speedButton.Position = UDim2.new(0, 10, 0, 10)
speedButton.Text = "Set Speed: 100"
speedButton.Parent = ScreenGui

local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(0, 200, 0, 50)
jumpButton.Position = UDim2.new(0, 10, 0, 70)
jumpButton.Text = "Set Jump: 100"
jumpButton.Parent = ScreenGui

-- Function to change speed
speedButton.MouseButton1Click:Connect(function()
    local newSpeed = 100  -- Set new speed (can be adjusted)
    humanoid.WalkSpeed = newSpeed
    speedButton.Text = "Set Speed: " .. newSpeed
end)

-- Function to change jump height
jumpButton.MouseButton1Click:Connect(function()
    local newJump = 100  -- Set new jump height (can be adjusted)
    humanoid.JumpHeight = newJump
    jumpButton.Text = "Set Jump: " .. newJump
end)

-- Reset button (optional)
local resetButton = Instance.new("TextButton")
resetButton.Size = UDim2.new(0, 200, 0, 50)
resetButton.Position = UDim2.new(0, 10, 0, 130)
resetButton.Text = "Reset"
resetButton.Parent = ScreenGui

resetButton.MouseButton1Click:Connect(function()
    humanoid.WalkSpeed = defaultSpeed
    humanoid.JumpHeight = defaultJump
    speedButton.Text = "Set Speed: " .. defaultSpeed
    jumpButton.Text = "Set Jump: " .. defaultJump
end)

-- Optional: Cleanup when character is removed
player.CharacterRemoving:Connect(function()
    ScreenGui:Destroy()
end)
