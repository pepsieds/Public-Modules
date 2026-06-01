local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local NotableTable = {
	{userid=15812,accessory='frozen horns',emoji='[📜]',headless=true},
	{userid=1511656495,accessory='poison horns',emoji='[❤️]',headless=true}
}

local Accessories = {'poison horns','frozen horns','fiery horns'}

local function WeldAccessory(character, handle, accessoryAttachment)
	for _, v in pairs(handle:GetChildren()) do
		if v:IsA("Weld") or v:IsA("Motor6D") then
			v:Destroy()
		end
	end

	local head = character:FindFirstChild("Head")
	if not head then return end

	local matchingAttachment = head:FindFirstChild(accessoryAttachment.Name)
	if not matchingAttachment then return end

	local weld = Instance.new("Weld")
	weld.Part0 = head
	weld.Part1 = handle
	weld.C0 = matchingAttachment.CFrame
	weld.C1 = accessoryAttachment.CFrame
	weld.Parent = handle

	task.spawn(function()
		while true do wait()
			local succ,err = pcall(function()
				local head = character:FindFirstChild("Head")
				if head then
					weld.Part0 = head
					weld.Part1 = handle
				end
			end)
		end
	end)
end

local function AttachAndMonitor(target, Accessory, accessoryAttachment)
	local character = target.Character
	if not character then return end

	Accessory.Parent = character
	WeldAccessory(character, Accessory.Handle, accessoryAttachment)

	character.DescendantRemoving:Connect(function(removed)
		if removed:IsA("Weld") and removed.Parent == Accessory.Handle then
			task.defer(function()
				character = target.Character
				if not character then return end
				Accessory.Parent = character
				WeldAccessory(character, Accessory.Handle, accessoryAttachment)
			end)
		end
	end)
end

local function CreateAccessory(Target, ID)
	local character = Target.Character or Target.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid", 5)
	if not humanoid then return end

	local Accessory = game:GetObjects("rbxassetid://" .. ID)[1]
	if not Accessory then return end

	local handle = Accessory:WaitForChild("Handle")
	local accessoryAttachment = handle:FindFirstChildOfClass("Attachment")
	if not accessoryAttachment then return end

	handle.Anchored = false
	handle.CanCollide = false
	handle.CanQuery = false
	handle.CanTouch = false
	handle.Massless = true
	handle.CollisionGroup = "Accessory"

	AttachAndMonitor(Target, Accessory, accessoryAttachment)
end

local function GiveAccessory(target, accessory)
	if not table.find(Accessories, tostring(accessory)) then return end

	local character = target.Character
	if not character then return end

	local humanoid = character:WaitForChild("Humanoid", 5)
	if not humanoid then return end

	if accessory == 'poison horns' then
		CreateAccessory(target, '1744060292')
	elseif accessory == 'frozen horns' then
		CreateAccessory(target, '74891470')
	elseif accessory == 'fiery horns' then
		CreateAccessory(target, '215718515')
	end
end

local function IsPlayerNotable(target)
	for i, v in pairs(NotableTable) do
		if v.userid == target.UserId then
			return true
		end
	end
	return false
end

local function GetNotableData(target)
	for i, v in pairs(NotableTable) do
		if v.userid == target.UserId then
			return v
		end
	end
	return nil
end

local function GiveEmoji(target, emoji)
	local character = target.Character
	if not character then return end

	local humanoid = character:WaitForChild("Humanoid", 5)
	if not humanoid then return end

	humanoid.DisplayName = emoji .. " " .. target.DisplayName

	for i, v in pairs(character:GetDescendants()) do
		if v:IsA("TextLabel") then
			if string.find(v.Text, tostring(target.DisplayName)) then
				v.Text = emoji .. " " .. target.DisplayName
			end
		end
	end
end

local function NotableCharacter(target, data)
	local character = target.Character
	if not character then return end

	local humanoid = character:WaitForChild("Humanoid", 5)
	if not humanoid then return end

	if data.headless then
		character.Head.Transparency = 1
	end

	if data.emoji then
		GiveEmoji(target, data.emoji)
	end

	if data.accessory then
		GiveAccessory(target, data.accessory)
	end
end

local function SetupPlayer(target)
	local inGroup = target:IsInGroupAsync(149011196)
	local notable = IsPlayerNotable(target)

	if not inGroup and not notable then return end

	local data

	if notable then
		data = GetNotableData(target)
	else
		data = {emoji='[🇮🇱]'}
	end

	if not data then return end

	target.CharacterAdded:Connect(function(character)
		NotableCharacter(target, data)
	end)

	NotableCharacter(target, data)
end

for i, Target in pairs(Players:GetPlayers()) do
	SetupPlayer(Target)
end

Players.PlayerAdded:Connect(SetupPlayer)
