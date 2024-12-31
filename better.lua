-- Example Neon Speed and Jump Hub for Roblox
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Set default values for speed and jump height
local defaultSpeed = humanoid.WalkSpeed
local defaultJump = humanoid.JumpHeight

-- Create a Neon-style GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Hub Frame (Neon Effect)
local hubFrame = Instance.new("Frame")
hubFrame.Size = UDim2.new(0, 300, 0, 200)
hubFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
hubFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
hubFrame.BackgroundTransparency = 0.5
hubFrame.Parent = ScreenGui

-- Neon Glow Effect (for visual appeal)
local neonGlow = Instance.new("Frame")
neonGlow.Size = UDim2.new(1, 0, 1, 0)
neonGlow.Position = UDim2.new(0, 0, 0, 0)
neonGlow.BackgroundColor3 = Color3.fromRGB(0, 255, 255) -- Neon Blue
neonGlow.BackgroundTransparency = 0.2
neonGlow.Parent = hubFrame

-- Create Buttons for Speed and Jump
local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0, 250, 0, 50)
speedButton.Position = UDim2.new(0, 25, 0, 25)
speedButton.Text = "Speed"
speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
speedButton.Font = Enum.Font.SourceSans
speedButton.TextSize = 24
speedButton.Parent = hubFrame

local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(0, 250, 0, 50)
jumpButton.Position = UDim2.new(0, 25, 0, 90)
jumpButton.Text = "Jump"
jumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
jumpButton.Font = Enum.Font.SourceSans
jumpButton.TextSize = 24
jumpButton.Parent = hubFrame

-- Function to create the Speed/Jump input screen
local function createInputScreen(type)
    -- Frame for Speed/Jump input
    local inputFrame = Instance.new("Frame")
    inputFrame.Size = UDim2.new(0, 300, 0, 200)
    inputFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    inputFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    inputFrame.BackgroundTransparency = 0.5
    inputFrame.Parent = ScreenGui

    -- Input Label
    local inputLabel = Instance.new("TextLabel")
    inputLabel.Size = UDim2.new(0, 250, 0, 30)
    inputLabel.Position = UDim2.new(0, 25, 0, 25)
    inputLabel.Text = "Choose Your " .. type
    inputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputLabel.BackgroundTransparency = 1
    inputLabel.Font = Enum.Font.SourceSans
    inputLabel.TextSize = 18
    inputLabel.Parent = inputFrame

    -- Textbox for input
    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(0, 250, 0, 50)
    inputBox.Position = UDim2.new(0, 25, 0, 60)
    inputBox.Text = "1"  -- Default value
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    inputBox.Font = Enum.Font.SourceSans
    inputBox.TextSize = 24
    inputBox.Parent = inputFrame

    -- Warning label
    local warningLabel = Instance.new("TextLabel")
    warningLabel.Size = UDim2.new(0, 250, 0, 30)
    warningLabel.Position = UDim2.new(0, 25, 0, 120)
    warningLabel.Text = "Limits: 1 Min, 100 Max"
    warningLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    warningLabel.BackgroundTransparency = 1
    warningLabel.Font = Enum.Font.SourceSans
    warningLabel.TextSize = 18
    warningLabel.Parent = inputFrame

    -- Checkbox for confirmation
    local checkbox = Instance.new("TextButton")
    checkbox.Size = UDim2.new(0, 250, 0, 50)
    checkbox.Position = UDim2.new(0, 25, 0, 160)
    checkbox.Text = "Set " .. type
    checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    checkbox.Font = Enum.Font.SourceSans
    checkbox.TextSize = 24
    checkbox.Parent = inputFrame

    -- Set Speed/Jump on checkbox click
    checkbox.MouseButton1Click:Connect(function()
        local inputValue = tonumber(inputBox.Text)

        -- Validate input value
        if inputValue then
            if inputValue < 1 then
                inputValue = 1  -- Set to minimum value
            elseif inputValue > 100 then
                inputValue = 100  -- Set to maximum value
            end

            if type == "Speed" then
                humanoid.WalkSpeed = inputValue
            elseif type == "Jump" then
                humanoid.JumpHeight = inputValue
            end

            -- Remove the input screen after setting the value
            inputFrame:Destroy()
        else
            warningLabel.Text = "Please enter a valid number!"
        end
    end)
end

-- Button Click Handlers
speedButton.MouseButton1Click:Connect(function()
    createInputScreen("Speed")
end)

jumpButton.MouseButton1Click:Connect(function()
    createInputScreen("Jump")
end)

-- Reset button (optional)
local resetButton = Instance.new("TextButton")
resetButton.Size = UDim2.new(0, 200, 0, 50)
resetButton.Position = UDim2.new(0, 25, 0, 150)
resetButton.Text = "Reset"
resetButton.Parent = ScreenGui

resetButton.MouseButton1Click:Connect(function()
    humanoid.WalkSpeed = defaultSpeed
    humanoid.JumpHeight = defaultJump
    speedButton.Text = "Set Speed"
    jumpButton.Text = "Set Jump"
end)
