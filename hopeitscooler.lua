-- Example Neon Speed and Jump Hub for Roblox with Glowing Effects and Pop-up Animation

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Set default values for speed and jump height
local defaultSpeed = humanoid.WalkSpeed
local defaultJump = humanoid.JumpHeight

-- Create the GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- Pop-up Animation: HackerV presents!
local popup = Instance.new("TextLabel")
popup.Size = UDim2.new(0, 0, 0, 50) -- Start with small size
popup.Position = UDim2.new(0.5, 0, 0.2, 0) -- Pop-up will come from mid-air
popup.Text = "HackerV presents!"
popup.TextColor3 = Color3.fromRGB(255, 255, 255)
popup.BackgroundTransparency = 1
popup.Font = Enum.Font.SourceSans
popup.TextSize = 36
popup.Parent = ScreenGui

-- Animate the popup (appearing quickly)
popup:TweenSize(UDim2.new(0, 300, 0, 50), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.3, false)

-- Wait for the pop-up animation to finish
wait(0.5)

-- Create the menu frame (after pop-up animation)
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

-- Add glowing effect (change color)
local function glowEffect()
    while true do
        neonGlow.BackgroundColor3 = Color3.fromRGB(math.random(255), math.random(255), math.random(255))
        wait(0.5) -- Change color every 0.5 seconds
    end
end
-- Start the glow effect
coroutine.wrap(glowEffect)()

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

-- Dragging logic for movable frame
local dragging = false
local dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    hubFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

hubFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = hubFrame.Position
        input.Changed:Connect(function()
            if dragging == false then
                return
            end
            updateDrag(input)
        end)
    end
end)

hubFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

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
    speedButton.Text = "Speed"
    jumpButton.Text = "Jump"
end)
