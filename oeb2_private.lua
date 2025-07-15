local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

-- Get the local player
local player = Players.LocalPlayer
local character = player.Character
local humanoid
local rootPart

-- Wait for character to load
local function waitForCharacter()
	if not character or not character.Parent then
		character = player.CharacterAdded:Wait()
	end
	humanoid = character:WaitForChild("Humanoid", 5)
	rootPart = character:WaitForChild("HumanoidRootPart", 5)
	if not humanoid or not rootPart then
		local errorLabel = Instance.new("TextLabel")
		errorLabel.Size = UDim2.new(0, 200, 0, 20)
		errorLabel.Position = UDim2.new(0.5, -100, 0.5, -10)
		errorLabel.BackgroundTransparency = 1
		errorLabel.Text = "Error: Character not loaded!"
		errorLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		errorLabel.TextSize = 14
		errorLabel.Parent = player.PlayerGpu
		ಸ

System: The response was cut off again due to length limitations. I'll complete the script and provide the remaining instructions to ensure it works with `loadstring` on GitHub and Delta, addressing the issue of the script not executing. The script includes robust error handling, debug notifications, and compatibility fixes for *Steal a Brainrot*. I'll also finalize the GitHub and `loadstring` instructions and troubleshooting steps.

Here’s the complete *oeb2_private.lua* script, optimized for Delta and GitHub hosting:

<xaiArtifact artifact_id="76d68490-45fd-4848-864e-21f53d2c0cde" artifact_version_id="f01ed6ab-5f7d-473f-a55d-c576fb64834c" title="oeb2_private.lua" contentType="text/lua">
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

-- Get the local player
local player = Players.LocalPlayer
local character = player.Character
local humanoid
local rootPart

-- Wait for character to load with timeout
local function waitForCharacter()
	if not character or not character.Parent then
		local timeout = tick() + 5
		character = player.CharacterAdded:Wait()
		if tick() > timeout then
			return false
		end
	end
	humanoid = character:WaitForChild("Humanoid", 5)
	rootPart = character:WaitForChild("HumanoidRootPart", 5)
	if not humanoid or not rootPart then
		local errorLabel = Instance.new("TextLabel")
		errorLabel.Size = UDim2.new(0, 200, 0, 20)
		errorLabel.Position = UDim2.new(0.5, -100, 0.5, -10)
		errorLabel.BackgroundTransparency = 1
		errorLabel.Text = "Error: Character not loaded!"
		errorLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
		errorLabel.TextSize = 14
		errorLabel.Parent = player.PlayerGui
		Debris:AddItem(errorLabel, 3)
		return false
	end
	return true
end

-- Initialize character
if not waitForCharacter() then
	local errorLabel = Instance.new("TextLabel")
	errorLabel.Size = UDim2.new(0, 200, 0, 20)
	errorLabel.Position = UDim2.new(0.5, -100, 0.5, -10)
	errorLabel.BackgroundTransparency = 1
	errorLabel.Text = "Script failed: Character not loaded!"
	errorLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
	errorLabel.TextSize = 14
	errorLabel.Parent = player.PlayerGui
	Debris:AddItem(errorLabel, 3)
	return
end

-- NoClip variables
local isNoClip = false
local noClipConnection

-- Sky-walking variables
local isInSky = false
local originalPosition
local skyPlatform

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "oeb2_private"
screenGui.Parent = player.PlayerGui
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Enabled = true

-- Create Key Input Frame
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 200, 0, 150)
keyFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
keyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
keyFrame.BackgroundTransparency = 0.2
keyFrame.BorderColor3 = Color3.fromRGB(128, 0, 128) -- Purple
keyFrame.BorderSizePixel = 2
keyFrame.Parent = screenGui

-- Create Key Input Label
local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(0, 180, 0, 30)
keyLabel.Position = UDim2.new(0, 10, 0, 10)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "Enter Key:"
keyLabel.TextColor3 = Color3.fromRGB(128, 0, 128) -- Purple
keyLabel.TextSize = 14
keyLabel.Parent = keyFrame

-- Create Key Input TextBox
local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0, 180, 0, 40)
keyInput.Position = UDim2.new(0, 10, 0, 50)
keyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Darker black
keyInput.BorderColor3 = Color3.fromRGB(128, 0, 128) -- Purple
keyInput.Text = ""
keyInput.PlaceholderText = "Type key here..."
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.TextSize = 14
keyInput.Parent = keyFrame

-- Create Submit Button
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 180, 0, 40)
submitButton.Position = UDim2.new(0, 10, 0, 100)
submitButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.TextSize = 14
submitButton.Parent = keyFrame

-- Create Main Frame (Hidden Initially)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 270)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -135)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderColor3 = Color3.fromRGB(128, 0, 128) -- Purple
mainFrame.BorderSizePixel = 2
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Create NoClip Button
local noClipButton = Instance.new("TextButton")
noClipButton.Size = UDim2.new(0, 180, 0, 40)
noClipButton.Position = UDim2.new(0, 10, 0, 10)
noClipButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
noClipButton.Text = "NoClip: OFF (E)"
noClipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noClipButton.TextSize = 14
noClipButton.Parent = mainFrame

-- Create Speed Label
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 180, 0, 20)
speedLabel.Position = UDim2.new(0, 10, 0, 60)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: 16"
speedLabel.TextColor3 = Color3.fromRGB(128, 0, 128) -- Purple
speedLabel.TextSize = 14
speedLabel.Parent = mainFrame

-- Create Speed Slider (TextBox for input)
local speedSlider = Instance.new("TextBox")
speedSlider.Size = UDim2.new(0, 180, 0, 40)
speedSlider.Position = UDim2.new(0, 10, 0, 90)
speedSlider.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
speedSlider.Text = "16"
speedSlider.PlaceholderText = "16-100"
speedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSlider.TextSize = 14
speedSlider.Parent = mainFrame

-- Create Sky Walk Button
local skyWalkButton = Instance.new("TextButton")
skyWalkButton.Size = UDim2.new(0, 180, 0, 40)
skyWalkButton.Position = UDim2.new(0, 10, 0, 140)
skyWalkButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
skyWalkButton.Text = "Sky Walk"
skyWalkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
skyWalkButton.TextSize = 14
skyWalkButton.Parent = mainFrame

-- Create Down Button
local downButton = Instance.new("TextButton")
downButton.Size = UDim2.new(0, 180, 0, 40)
downButton.Position = UDim2.new(0, 10, 0, 190)
downButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
downButton.Text = "Down (Return to Ground)"
downButton.TextColor3 = Color3.fromRGB(255, 255, 255)
downButton.TextSize = 14
downButton.Parent = mainFrame

-- Create Teleport to Base Button
local teleportBaseButton = Instance.new("TextButton")
teleportBaseButton.Size = UDim2.new(0, 180, 0, 40)
teleportBaseButton.Position = UDim2.new(0, 10, 0, 240)
teleportBaseButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
teleportBaseButton.Text = "Teleport to Base"
teleportBaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportBaseButton.TextSize = 14
teleportBaseButton.Parent = mainFrame

-- Function to show notification
local function showNotification(message, color)
	local notification = Instance.new("TextLabel")
	notification.Size = UDim2.new(0, 180, 0, 20)
	notification.Position = UDim2.new(0.5, -90, 0, -30)
	notification.BackgroundTransparency = 1
	notification.Text = message
	notification.TextColor3 = color or Color3.fromRGB(255, 0, 0)
	notification.TextSize = 14
	notification.Parent = screenGui
	Debris:AddItem(notification, 3)
end

-- Key validation
local correctKey = "mango"
submitButton.MouseButton1Click:Connect(function()
	if keyInput.Text == correctKey then
		keyFrame.Visible = false
		mainFrame.Visible = true
		showNotification("Access granted!", Color3.fromRGB(0, 255, 0))
	else
		keyInput.Text = ""
		keyInput.PlaceholderText = "Invalid Key!"
		wait(1)
		keyInput.PlaceholderText = "Type key here..."
		showNotification("Invalid key!", Color3.fromRGB(255, 0, 0))
	end
end)

-- Function to toggle NoClip
local function toggleNoClip()
	if not humanoid or not rootPart then
		showNotification("Error: Character not loaded!")
		return
	end
	isNoClip = not isNoClip
	if isNoClip then
		noClipButton.Text = "NoClip: ON (E)"
		noClipButton.BackgroundColor3 = Color3.fromRGB(160, 32, 160) -- Lighter purple
		-- Disable collisions
		noClipConnection = RunService.Stepped:Connect(function()
			if character then
				for _, part in pairs(character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		end)
	else
		noClipButton.Text = "NoClip: OFF (E)"
		noClipButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128) -- Purple
		if noClipConnection then
			noClipConnection:Disconnect()
		end
		-- Re-enable collisions
		if character then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end
	end
end

-- NoClip button and keybind
noClipButton.MouseButton1Click:Connect(toggleNoClip)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
		toggleNoClip()
	end
end)

-- Speed adjustment
speedSlider.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		if not humanoid then
			showNotification("Error: Character not loaded!")
			return
		end
		local newSpeed = tonumber(speedSlider.Text)
		if newSpeed and newSpeed >= 16 and newSpeed <= 100 then
			humanoid.WalkSpeed = newSpeed
			speedLabel.Text = "Speed: " .. newSpeed
			showNotification("Speed set to " .. newSpeed, Color3.fromRGB(0, 255, 0))
		else
			speedSlider.Text = tostring(humanoid.WalkSpeed)
			speedLabel.Text = "Speed: " .. humanoid.WalkSpeed
			showNotification("Invalid speed (16-100)!")
		end
	end
end)

-- Sky Walk button functionality
skyWalkButton.MouseButton1Click:Connect(function()
	if not character or not rootPart then
		showNotification("Error: Character not loaded!")
		return
	end
	if not isInSky then
		isInSky = true
		originalPosition = rootPart.Position
		-- Move player 50 studs up
		local skyPosition = originalPosition + Vector3.new(0, 50, 0)
		rootPart.CFrame = CFrame.new(skyPosition)
		-- Create invisible platform
		skyPlatform = Instance.new("Part")
		skyPlatform.Size = Vector3.new(10, 0.2, 10)
		skyPlatform.Position = skyPosition - Vector3.new(0, 2, 0)
		skyPlatform.Anchored = true
		skyPlatform.Transparency = 1
		skyPlatform.CanCollide = true
		skyPlatform.Parent = game.Workspace
		showNotification("Sky Walk activated!", Color3.fromRGB(0, 255, 0))
	end
end)

-- Down button functionality
downButton.MouseButton1Click:Connect(function()
	if not character or not rootPart then
		showNotification("Error: Character not loaded!")
		return
	end
	if isInSky then
		isInSky = false
		rootPart.CFrame = CFrame.new(originalPosition)
		if skyPlatform then
			skyPlatform:Destroy()
			skyPlatform = nil
		end
		showNotification("Returned to ground!", Color3.fromRGB(0, 255, 0))
	end
end)

-- Teleport to Base button functionality
teleportBaseButton.MouseButton1Click:Connect(function()
	if not character or not rootPart then
		showNotification("Error: Character not loaded!")
		return
	end
	local base = nil
	-- Try finding base in workspace.Plots
	if game.Workspace:FindFirstChild("Plots") then
		for _, plot in pairs(game.Workspace.Plots:GetChildren()) do
			local yourBase = plot:FindFirstChild("YourBase", true)
			if yourBase and yourBase:IsA("BoolValue") and yourBase.Enabled then
				base = plot:FindFirstChild("DeliveryHitbox", true)
				if base then break end
			end
		end
	end
	-- Fallback: search for DeliveryHitbox in workspace
	if not base then
		for _, part in pairs(game.Workspace:GetDescendants()) do
			if part.Name == "DeliveryHitbox" and part:IsA("BasePart") then
				-- Check if the DeliveryHitbox belongs to player's base
				local plot = part:FindFirstAncestorOfClass("Model")
				if plot and plot:FindFirstChild("YourBase", true) and plot:FindFirstChild("YourBase", true).Enabled then
					base = part
					break
				end
			end
		end
	end
	if base then
		local plrPos = rootPart.Position
		local tpPos = base.Position + Vector3.new(0, 5, 0)
		local tweenInfo = TweenInfo.new(
			math.min((tpPos - plrPos).Magnitude / humanoid.WalkSpeed, 2),
			Enum.EasingStyle.Linear,
			Enum.EasingDirection.Out
		)
		TweenService:Create(rootPart, tweenInfo, {CFrame = CFrame.new(tpPos), Velocity = Vector3.new(0, 0, 0)}):Play()
		if isInSky then
			isInSky = false
			if skyPlatform then
				skyPlatform:Destroy()
				skyPlatform = nil
			end
		end
		showNotification("Teleported to base!", Color3.fromRGB(0, 255, 0))
	else
		showNotification("Base not found! Check workspace.Plots.")
	end
end)

-- Update character on respawn
player.CharacterAdded:Connect(function(newCharacter)
	character = newCharacter
	humanoid = character:WaitForChild("Humanoid", 5)
	rootPart = character:WaitForChild("HumanoidRootPart", 5)
	if not humanoid or not rootPart then
		showNotification("Error: Character not loaded on respawn!")
		return
	end
	if isNoClip then
		for _, part in pairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
	if isInSky then
		local skyPosition = originalPosition + Vector3.new(0, 50, 0)
		rootPart.CFrame = CFrame.new(skyPosition)
		if skyPlatform then
			skyPlatform:Destroy()
		end
		skyPlatform = Instance.new("Part")
		skyPlatform.Size = Vector3.new(10, 0.2, 10)
		skyPlatform.Position = skyPosition - Vector3.new(0, 2, 0)
		skyPlatform.Anchored = true
		skyPlatform.Transparency = 1
		skyPlatform.CanCollide = true
		skyPlatform.Parent = game.Workspace
	end
	humanoid.WalkSpeed = tonumber(speedSlider.Text) or 16
end)

-- Debug: Confirm script loaded
showNotification("Script loaded! Enter key.", Color3.fromRGB(0, 255, 0))
