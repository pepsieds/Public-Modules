local Information = {
	['❤️'] = {1511656495},
	['📜'] = {15812}
}

local function Playerhandler(player,emoji)
	local function GiveEmoji(character)
		local NameR = '[' .. emoji .. '] ' .. player.DisplayName
		local Humanoid = character:WaitForChild('Humanoid', 5)
		if Humanoid then
			Humanoid.DisplayName = NameR
			local Attributes = Humanoid:GetAttributes()
			local succ, err = pcall(function()
				for Name, Value in pairs(Attributes) do
					if string.find(Name, 'Emoji') then
						Humanoid:SetAttribute(Name, NameR)
					elseif string.find(Name, 'Name') then
						Humanoid:SetAttribute(Name, NameR)
					end
				end
			end)
		end
	end
	
	local function GiveHorns(character)
		local Head = character:WaitForChild('Head',5)
		if not Head then return end
		
		task.delay(3,function()
			if Head then
				local hat = game:GetObjects('rbxassetid://215718515')[1]
				hat.Parent = character
				local hathandle = hat:FindFirstChild("Handle")
				hathandle.Massless = true
				hathandle.Anchored = false
				hathandle.CanCollide = false
				
				local weld = Instance.new("Weld", hathandle)
				weld.Part0 = hathandle
				weld.Part1 = Head
				weld.C0 = CFrame.new(0,-1.25,0)
			end
		end)
	end
	
	player.CharacterAdded:Connect(function(character)
		GiveEmoji(character)
		GiveHorns(character)
	end)
	
	local Character = player.Character
	if Character then
		GiveEmoji(Character)
		GiveHorns(Character)
	end
end

local function getEmojiForPlayer(player)
	for emoji, ids in Information do
		for _, id in ids do
			if player.UserId == id then
				return emoji
			end
		end
	end
	return nil
end

for _, player in game.Players:GetPlayers() do
	local emoji = getEmojiForPlayer(player)
	if emoji then
		Playerhandler(player, emoji)
	end
end

game.Players.PlayerAdded:Connect(function(player)
	local emoji = getEmojiForPlayer(player)
	if emoji then
		Playerhandler(player, emoji)
	end
end)
