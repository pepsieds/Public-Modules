local LocalPlayer = game:GetService('Players').LocalPlayer
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local GameID = game.GameId
local CurrentCamera = Workspace.CurrentCamera
local Camera = CurrentCamera
local lighting = game:GetService("Lighting")
local Drawing = Drawing

warn('running static phantom forces v1.0.0')

SKELETON_UPDATE_INTERVAL = 1 / 90
CHAMS_UPDATE_INTERVAL = 1 / 60

_G.ESP_CONFIGURATION = {}

local Config = _G.ESP_CONFIGURATION

Config.Visuals = {
	CameraFovEnabled = false,
	CameraFov = 70,
	StretchEnabled = false,
	StretchX = 1,
	StretchY = 1,
	SelfAura = "off",
}

Config.ESP = {
	Enabled = false,
	BoxESP = false,
	BoxStyle = "Corner",
	BoxFilled = false,
	BoxFillTransparency = 0.5,
	BoxThickness = 1,
	TracerESP = false,
	TracerOrigin = "Bottom",
	TracerThickness = 1,
	HealthESP = false,
	HealthStyle = "Bar",
	HealthTextSuffix = "HP",
	NameESP = false,
	NameMode = "DisplayName",
	ShowDistance = false,
	ToolESP = false,
	DistanceUnit = "studs",
	TextSize = 14,
	TextFont = "Plex",
	GradientEnabled = false,
	GradientA = Color3.fromRGB(255, 143, 229),
	GradientB = Color3.fromRGB(180, 170, 255),
	GradientAngle = 45,
	GradientRotateEnabled = false,
	GradientRotateSpeed = 30,
	MaxDistance = 1000,
	MaxDistanceCheck = true,
	RefreshRate = 1/144,
	TeamCheck = false,
	TargetNPCs = true,
	ChamsEnabled = false,
	ChamsTransparency = 0.5,
	XrayEnabled = false,
	XrayActive = false,
	XrayKey = Enum.KeyCode.X,
	XrayMapTransparency = 0.7,
	SkeletonESP = false,
	SkeletonThickness = 1.5,
	SkeletonTransparency = 1,
	RadarEnabled = false,
	RadarSize = 200,
	RadarPositionX = 100,
	RadarPositionY = 100,
	RadarScale = 1,
	RadarBackgroundTransparency = 0.3,
	RadarBorderThickness = 2,
	RadarBackgroundColor = Color3.fromRGB(24, 18, 30),
	RadarBorderColor = Color3.fromRGB(255, 143, 229),
	RadarLocalPlayerColor = Color3.fromRGB(255, 230, 245),
	RadarEnemyColor = Color3.fromRGB(255, 95, 130),
	RadarAvatarBackgroundColor = Color3.fromRGB(255, 200, 235),
	RadarDotSize = 4,
	RadarRange = 500,
	RadarShowCrosshair = true,
	RadarSegments = 64,
	RadarMapEnabled = true,
	RadarMapRange = 900,
	RadarMapScanInterval = 0.8,
	RadarMapMaxPoints = 220,
	RadarMapPointSize = 2,
	RadarMapTransparency = 0.5,
	RadarMapBuildingColor = Color3.fromRGB(140, 120, 160),
	RadarMapTreeColor = Color3.fromRGB(120, 170, 150),
	RadarMapGroundColor = Color3.fromRGB(110, 90, 120),
	RadarMapPropColor = Color3.fromRGB(170, 150, 190),
	RadarMapRoadColor = Color3.fromRGB(95, 85, 110),
	DirectionalArrowsEnabled = false,
	DirectionalArrowsDistance = 100,
	DirectionalArrowsSize = 20,
	DirectionalArrowsOffset = 150,
	DirectionalArrowsThickness = 2,
	DirectionalArrowsTransparency = 1,
	DirectionalArrowsShowDistance = true,
	DirectionalArrowsDistanceTextSize = 14,
	LockedTargetIndicators = true,
	LockedTargetAvatar = true,
	LockedTargetHighlightBox = true,
	LockedTargetHighlightColor = Color3.fromRGB(255, 0, 0),
	LockedTargetGlow = false,
	LockedTargetGlowColor = Color3.fromRGB(255, 0, 0),
	LockedTargetGlowTransparency = 0.5,
	LockedTargetAvatarBorderColor = Color3.fromRGB(255, 255, 255),
	LockedTargetAvatarBorderThickness = 2,
	LockedTargetAvatarBackgroundColor = Color3.fromRGB(0, 0, 0),
	Colors = {
		Box = Color3.fromRGB(255, 143, 229),
		Tracer = Color3.fromRGB(255, 170, 238),
		Text = Color3.fromRGB(255, 230, 245),
		Health = Color3.fromRGB(154, 255, 200),
		Skeleton = Color3.fromRGB(255, 180, 240),
		Chams = Color3.fromRGB(255, 120, 210),
		Arrow = Color3.fromRGB(255, 170, 238),
		Distance = Color3.fromRGB(230, 210, 240),
		HealthLow = Color3.fromRGB(255, 110, 140),
		HealthMedium = Color3.fromRGB(255, 200, 120),
		HealthHigh = Color3.fromRGB(154, 255, 200),
	},
	HitEffects = {
		HitOverlay = {
			Enabled = false,
			Color = Color3.fromRGB(255, 143, 229),
			LethalColor = Color3.fromRGB(255, 90, 140),
			Opacity = 0.35,
			LethalOpacity = 0.55,
			Lifetime = 0.35,
		},
		DamageNumber = {
			Enabled = false,
			Color = Color3.fromRGB(255, 230, 245),
			LethalColor = Color3.fromRGB(255, 90, 140),
			OutlineColor = Color3.fromRGB(40, 20, 50),
			Font = 2,
			Size = 14,
			Opacity = 1,
			Lifetime = 0.9,
			Rise = 1.5,
		},
		HitMarker2D = {
			Enabled = false,
			Color = Color3.fromRGB(255, 170, 238),
			LethalColor = Color3.fromRGB(255, 90, 140),
			OutlineColor = Color3.fromRGB(40, 20, 50),
			Thickness = 2,
			Size = 10,
			Gap = 5,
			Opacity = 1,
			Lifetime = 0.2,
		},
		HitMarker3D = {
			Enabled = false,
			Color = Color3.fromRGB(255, 170, 238),
			LethalColor = Color3.fromRGB(255, 90, 140),
			OutlineColor = Color3.fromRGB(40, 20, 50),
			Thickness = 2,
			Size = 10,
			Gap = 5,
			Opacity = 1,
			Lifetime = 0.3,
		},
		HitChams = {
			Enabled = false,
			OnlyLast = true,
			Color = Color3.fromRGB(255, 120, 210),
			LethalColor = Color3.fromRGB(255, 90, 140),
			OutlineColor = Color3.fromRGB(70, 40, 85),
			Transparency = 0.35,
			OutlineTransparency = 0.1,
			Lifetime = 0.5,
		},
	},
}

--========================================================--
--  ESP FUNCTIONS
--========================================================--

_G.ESPDrawings = {}
_G.ESPHighlights = {}
_G.ESPRadarComponents = {}
_G.ESPDirectionalArrows = {}
_G.ESPSettings = Config.ESP
EncryptedNameCache = {}
GetLocalRootPartForESP = nil
GetBestBasePart = nil
GetEncryptedEnemyModels = nil
GetModelHealthValues = nil
GetEncryptedHeadPart = nil
GetEncryptedEnemyModelsCached = nil

PLAYER_LIST_CACHE_TTL = 0.1
ENCRYPTED_MODEL_CACHE_TTL = 1 / 30
CHARACTER_CACHE_TTL = 0.2
CHARACTER_PARTS_CACHE_TTL = 0.2

PlayersListCache = { List = nil, Stamp = 0 }
EncryptedModelsCache = { Models = nil, Stamp = 0, TeamCheck = nil }
CharacterDataCache = setmetatable({}, { __mode = "k" })
CharacterPartCache = setmetatable({}, { __mode = "k" })
xraymapcache = {}
xraymapconnection = nil

CHAMS_PART_NAMES = {
	"Head", "UpperTorso", "LowerTorso",
	"LeftUpperArm", "LeftLowerArm", "LeftHand",
	"RightUpperArm", "RightLowerArm", "RightHand",
	"LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
	"RightUpperLeg", "RightLowerLeg", "RightFoot"
}

SKELETON_CONNECTION_KEYS = {
	{"Head", "UpperTorso"},
	{"UpperTorso", "LowerTorso"},
	{"UpperTorso", "LeftUpperArm"},
	{"LeftUpperArm", "LeftLowerArm"},
	{"LeftLowerArm", "LeftHand"},
	{"UpperTorso", "RightUpperArm"},
	{"RightUpperArm", "RightLowerArm"},
	{"RightLowerArm", "RightHand"},
	{"LowerTorso", "LeftUpperLeg"},
	{"LeftUpperLeg", "LeftLowerLeg"},
	{"LeftLowerLeg", "LeftFoot"},
	{"LowerTorso", "RightUpperLeg"},
	{"RightUpperLeg", "RightLowerLeg"},
	{"RightLowerLeg", "RightFoot"}
}

CHAMS_FACES = {
	{1,2,3,4},
	{5,6,7,8},
	{1,2,6,5},
	{2,3,7,6},
	{3,4,8,7},
	{4,1,5,8}
}

ESPFrameState = {
	CameraCFrame = nil,
	CameraPos = nil,
	ViewportSize = nil,
}

CachedTracerOrigin = nil
RadarMapLastScan = 0
RadarMapLastScanPos = nil
RadarMapEntries = {}
RadarOverlapParams = OverlapParams.new()
RadarOverlapParams.FilterType = Enum.RaycastFilterType.Exclude
RadarOverlapParams.MaxParts = 900

RADAR_MAP_LOCKED_MAX_POINTS = 220
RADAR_MAP_LOCKED_SCAN_INTERVAL = 0.3
RADAR_MAP_RESCAN_DISTANCE = 40
RADAR_MAP_LOCKED_TRANSPARENCY = 0.5
RADAR_MAP_LOCKED_POINT_SIZE = 2
RADAR_MAP_LOCKED_COLORS = {
	Building = Color3.fromRGB(140, 120, 160),
	Tree = Color3.fromRGB(120, 170, 150),
	Ground = Color3.fromRGB(110, 90, 120),
	Road = Color3.fromRGB(95, 85, 110),
	Prop = Color3.fromRGB(170, 150, 190),
}

local Environment = getrenv( );

local Shared = Environment.shared;
local Require = Shared.require;

local TableClone = table.clone;

-- Modules
local PlayerSettingsInterface = Require( "PlayerSettingsInterface" );
local ReplicationInterface = Require( "ReplicationInterface" );

-- Classes
local PlayerObject = { Entry = nil }; do
	function PlayerObject : Initiate( Player )
		local ReplicationObject = ReplicationInterface.getEntry( Player );

		local ClassObject = TableClone( PlayerObject );
		ClassObject.Entry = ReplicationObject;

		return ClassObject;
	end

	function PlayerObject : Character( )
		local ReplicationObject, Result = self.Entry, { };

		if ( ReplicationObject ) then
			local ThirdPersonObject = ReplicationObject : getThirdPersonObject( );

			if ( not ThirdPersonObject ) then
				return Result;
			end

			Result = ThirdPersonObject : getCharacterHash( );
		end

		return Result;
	end

	PlayerObject = setmetatable( PlayerObject, { __call = function( Self, Player )
		local ReplicationObject = ReplicationInterface.getEntry( Player );

		local ClassObject = TableClone( PlayerObject );
		ClassObject.Entry = ReplicationObject;

		return ClassObject;
	end });
end

local PlayerObjectCache = {}

local function CreatePlayerObjectForESP(player)
	if not PlayerObject then
		return nil
	end

	local success, result = pcall(function()
		return PlayerObject(player)
	end)

	if success and result then
		return result
	end

	return nil
end

local function ReadPlayerObjectCharacter(object)
	if not object then
		return nil
	end

	local success, characterHash = pcall(function()
		return object:Character()
	end)

	if success and type(characterHash) == "table" and next(characterHash) ~= nil then
		return characterHash
	end

	return nil
end

local function GetPlayerCharacter(player)
	if not player then
		return nil
	end

	local object = PlayerObjectCache[player]
	local characterHash = ReadPlayerObjectCharacter(object)

	if characterHash then
		return characterHash
	end

	-- Replication entries can change after respawn, so refresh the cached PlayerObject
	-- when the old one returns an empty hash.
	object = CreatePlayerObjectForESP(player)
	PlayerObjectCache[player] = object
	characterHash = ReadPlayerObjectCharacter(object)

	if characterHash then
		return characterHash
	end

	if player.Character and player.Character.Parent then
		return player.Character
	end

	return nil
end

function GetPlayersListCached()
	local now = tick()
	if (now - PlayersListCache.Stamp) >= PLAYER_LIST_CACHE_TTL or not PlayersListCache.List then
		local ok, result = pcall(function()
			return Players:GetPlayers()
		end)
		PlayersListCache.List = (ok and type(result) == "table" and result) or {}
		PlayersListCache.Stamp = now
	end
	return PlayersListCache.List or {}
end

NPC_MODEL_CACHE_TTL = 0.5
NpcModelCache = { Models = nil, Stamp = 0 }

local NPC_GAME_FOLDERS = {
	[187796008] = function()
		local entities = Workspace:FindFirstChild("Entities")
		return entities and entities:FindFirstChild("Infected")
	end, -- Those Who Remain
	[3104101863] = function()
		local ignore = Workspace:FindFirstChild("Ignore")
		return ignore and ignore:FindFirstChild("Zombies")
	end, -- Michael's Zombies
	[504035427] = function() return Workspace:FindFirstChild("enemies") end, -- Zombie Attack
	[3349613241] = function() return Workspace:FindFirstChild("NPCs") end, -- AI Test
	[4972091010] = function() return Workspace:FindFirstChild("Zombies") end, -- Zombie Uprising
	[169302362] = function() return Workspace:FindFirstChild("Baddies") end, -- Project Lazarus
	[11229187850] = function() return Workspace:FindFirstChild("Zombies") end, -- Korrupt Zombies
	[2263267302] = function()
		local npcs = Workspace:FindFirstChild("NPCs")
		return npcs and npcs:FindFirstChild("policeForce")
	end, -- Infamy
	[2575793677] = function() return Workspace:FindFirstChild("OtherWaifus") end, -- AniPhobia
	[3326279937] = function()
		local npcs = Workspace:FindFirstChild("NPCs")
		return npcs and npcs:FindFirstChild("Custom")
	end, -- Blackout: Revival [FREE ZOMBIES]
	[1000233041] = function()
		local gameObjects = Workspace:FindFirstChild("GameObjects")
		local physical = gameObjects and gameObjects:FindFirstChild("Physical")
		return physical and physical:FindFirstChild("Employees")
	end, -- SCP 3008
	[5091490171] = function() return Workspace:FindFirstChild("Bots") end, -- Jailbird
	[1003981402] = function() return Workspace:FindFirstChild("Zombies") end, -- Reminiscence Zombies
	[6907570572] = function()
		local mainGame = Workspace:FindFirstChild("mainGame")
		return mainGame and mainGame:FindFirstChild("active_anomaly")
	end, -- A-888
	[358276974] = function() return Workspace:FindFirstChild("Zombies") end, -- AR2
	[35229570] = function() return Workspace:FindFirstChild("Zombies") end, -- Survive Wave Z
	[847722000] = function() return Workspace end, -- The Rake Remastered
	[125205164] = function() return Workspace:FindFirstChild("NPCs") end, -- Identity Fraud
	[7406797672] = function() return Workspace:FindFirstChild("Bots") end, -- Da Track
	[16261605398] = function() return Workspace:FindFirstChild("FPlayers") end, -- DUELS
	[9293874907] = function() return Workspace end, -- random sniper game i think 
	[9294074907] = function() return Workspace end, -- random sniper game i think 
	[7115773109] = function() return Workspace.Targets.MatchTargets end, -- Weird gun game
	[9187332740] = function() return Workspace.NPCS end, -- Weird gun game
}

local function ResolveNpcRoot()
	local getter = NPC_GAME_FOLDERS[GameID]
	if getter then
		local root = getter()
		if root then
			return root, false
		end
	end

	local candidates = {"Bots", "NPCs", "Zombies"}
	for _, name in ipairs(candidates) do
		local folder = Workspace:FindFirstChild(name)
		if folder and #folder:GetChildren() > 0 then
			return folder, false
		end
	end

	return Workspace, true
end

local function IsNpcModel(model)
	if not model or not model:IsA("Model") then return false end
	if LocalPlayer.Character and model == LocalPlayer.Character then return false end
	if Players:GetPlayerFromCharacter(model) then return false end
	if model:FindFirstAncestorOfClass("Tool") then return false end
	local humanoid = model:FindFirstChildOfClass("Humanoid")
	if not humanoid then return false end
	local head = model:FindFirstChild("Head") or model:FindFirstChild("Head", true)
	if not head then return false end
	return true
end

function GetNpcModelsCached()
	if not (Config.ESP.TargetNPCs) then
		return {}
	end

	local now = tick()
	if NpcModelCache.Models and (now - NpcModelCache.Stamp) < NPC_MODEL_CACHE_TTL then
		return NpcModelCache.Models
	end

	local root, searchAll = ResolveNpcRoot()
	local models = {}
	if root then
		for _, child in ipairs(root:GetChildren()) do
			if searchAll or child:IsA("Model") then
				if IsNpcModel(child) then
					table.insert(models, child)
				end
			end
		end
	end

	NpcModelCache.Models = models
	NpcModelCache.Stamp = now
	return models
end

function GetCharacterDataCache(character)
	if not character then return nil end
	local cache = CharacterDataCache[character]
	if not cache then
		cache = {}
		CharacterDataCache[character] = cache
	end
	return cache
end

local function IsValidBasePart(value)
	return typeof(value) == "Instance" and value:IsA("BasePart") and value.Parent ~= nil
end

local function IsValidHumanoid(value)
	return typeof(value) == "Instance" and value:IsA("Humanoid") and value.Parent ~= nil
end

local function IsCharacterHash(character)
	return type(character) == "table"
end

local function CleanPartName(value)
	return tostring(value or ""):lower():gsub("%s+", "")
end

local function GetValueObjectNumber(value)
	if typeof(value) == "Instance" then
		if value:IsA("NumberValue") or value:IsA("IntValue") then
			return value.Value
		end
	end

	if type(value) == "number" then
		return value
	end

	return nil
end

local function FindPartInHash(hash, names)
	if type(hash) ~= "table" then
		return nil
	end

	for _, name in ipairs(names) do
		local direct = rawget(hash, name)
		if IsValidBasePart(direct) then
			return direct
		end

		local lower = rawget(hash, tostring(name):lower())
		if IsValidBasePart(lower) then
			return lower
		end
	end

	for key, value in pairs(hash) do
		if IsValidBasePart(value) then
			local cleanKey = CleanPartName(key)

			for _, name in ipairs(names) do
				if cleanKey == CleanPartName(name) then
					return value
				end
			end
		end
	end

	return nil
end

local function GetCharacterPart(character, ...)
	local names = { ... }

	if typeof(character) == "Instance" then
		for _, name in ipairs(names) do
			local part = character:FindFirstChild(name) or character:FindFirstChild(name, true)
			if IsValidBasePart(part) then
				return part
			end
		end
	elseif type(character) == "table" then
		return FindPartInHash(character, names)
	end

	return nil
end

local function GetCharacterBaseParts(character)
	local parts = {}
	local seen = {}

	local function addPart(part)
		if IsValidBasePart(part) and not seen[part] then
			seen[part] = true

			if part.Transparency < 1 and part.Size.Magnitude > 0.1 then
				parts[#parts + 1] = part
			end
		end
	end

	if typeof(character) == "Instance" then
		if character:IsA("BasePart") then
			addPart(character)
		else
			for _, obj in ipairs(character:GetDescendants()) do
				addPart(obj)
			end
		end
	elseif type(character) == "table" then
		for _, value in pairs(character) do
			addPart(value)
		end
	end

	return parts
end

local function FindHighestPartInHash(hash)
	local highest = nil

	for _, part in ipairs(GetCharacterBaseParts(hash)) do
		if not highest or part.Position.Y > highest.Position.Y then
			highest = part
		end
	end

	return highest
end

local function FindBestRootInHash(hash)
	local root = FindPartInHash(hash, {
		"HumanoidRootPart",
		"RootPart",
		"Root",
		"Torso",
		"UpperTorso",
		"LowerTorso"
	})

	if root then
		return root
	end

	local best = nil
	local bestSize = 0

	for _, part in ipairs(GetCharacterBaseParts(hash)) do
		local size = part.Size.Magnitude

		if size > bestSize then
			best = part
			bestSize = size
		end
	end

	return best
end

local function FindHumanoidInHash(hash)
	if type(hash) ~= "table" then
		return nil
	end

	local humanoid = rawget(hash, "Humanoid") or rawget(hash, "humanoid")

	if IsValidHumanoid(humanoid) then
		return humanoid
	end

	for _, value in pairs(hash) do
		if IsValidHumanoid(value) then
			return value
		end
	end

	local health = GetValueObjectNumber(rawget(hash, "Health") or rawget(hash, "health"))
	local maxHealth = GetValueObjectNumber(rawget(hash, "MaxHealth") or rawget(hash, "maxHealth"))

	if health then
		return {
			Health = health,
			MaxHealth = math.max(maxHealth or 100, 1),
			_IsFakeHumanoid = true
		}
	end

	-- Some replicated character hashes only expose body parts, not a real Humanoid.
	-- This fake object prevents ESP from crashing while still letting boxes/tracers draw.
	return {
		Health = 100,
		MaxHealth = 100,
		_IsFakeHumanoid = true
	}
end

local function GetCharacterModelFromAny(character)
	if typeof(character) == "Instance" then
		if character:IsA("Model") then
			return character
		end

		return character:FindFirstAncestorOfClass("Model")
	elseif type(character) == "table" then
		for _, part in ipairs(GetCharacterBaseParts(character)) do
			local model = part:FindFirstAncestorOfClass("Model")
			if model then
				return model
			end
		end
	end

	return nil
end

local function IsPartInCharacter(part, character)
	if not IsValidBasePart(part) then
		return false
	end

	if typeof(character) == "Instance" then
		return part:IsDescendantOf(character)
	elseif type(character) == "table" then
		for _, value in pairs(character) do
			if value == part then
				return true
			end
		end

		local model = GetCharacterModelFromAny(character)
		return model ~= nil and part:IsDescendantOf(model)
	end

	return false
end

function RefreshCharacterCoreCache(character)
	local cache = GetCharacterDataCache(character)
	if not cache then return nil end

	local now = tick()

	if not cache.CoreStamp or (now - cache.CoreStamp) >= CHARACTER_CACHE_TTL then
		if typeof(character) == "Instance" then
			cache.Humanoid = character:FindFirstChildOfClass("Humanoid")
			cache.RootPart =
				character:FindFirstChild("HumanoidRootPart")
				or character:FindFirstChild("HumanoidRootPart", true)
				or character:FindFirstChild("Torso")
				or character:FindFirstChild("UpperTorso")
				or character:FindFirstChild("LowerTorso")
				or GetCharacterPart(character, "RootPart", "Root")

			cache.HeadPart =
				character:FindFirstChild("Head")
				or character:FindFirstChild("Head", true)
				or GetHighestPart(character, cache.RootPart)
				or cache.RootPart

			cache.IsHashCharacter = false
		elseif type(character) == "table" then
			cache.Humanoid = FindHumanoidInHash(character)
			cache.RootPart = FindBestRootInHash(character)
			cache.HeadPart = GetCharacterPart(character, "Head") or FindHighestPartInHash(character) or cache.RootPart
			cache.IsHashCharacter = true
		else
			cache.Humanoid = nil
			cache.RootPart = nil
			cache.HeadPart = nil
			cache.IsHashCharacter = false
		end

		cache.CoreStamp = now
	end

	if cache.IsHashCharacter then
		if cache.RootPart and not IsValidBasePart(cache.RootPart) then
			cache.RootPart = nil
		end

		if cache.HeadPart and not IsValidBasePart(cache.HeadPart) then
			cache.HeadPart = nil
		end

		if cache.Humanoid and not cache.Humanoid._IsFakeHumanoid and not IsValidHumanoid(cache.Humanoid) then
			cache.Humanoid = nil
		end
	else
		if cache.RootPart and not cache.RootPart:IsDescendantOf(character) then
			cache.RootPart = nil
		end

		if cache.HeadPart and not cache.HeadPart:IsDescendantOf(character) then
			cache.HeadPart = nil
		end

		if cache.Humanoid and not cache.Humanoid:IsDescendantOf(character) then
			cache.Humanoid = nil
		end
	end

	return cache
end

local function BuildBasePartList(character)
	return GetCharacterBaseParts(character)
end

function GetCharacterPartsCached(character)
	if not character then return nil end

	local cache = CharacterPartCache[character]
	local now = tick()

	if not cache or (now - (cache.Stamp or 0)) >= CHARACTER_PARTS_CACHE_TTL then
		cache = cache or {}
		cache.Parts = BuildBasePartList(character)
		cache.Stamp = now
		CharacterPartCache[character] = cache
	end

	return cache.Parts
end

function RefreshCharacterSkeletonCache(character)
	local cache = GetCharacterDataCache(character)
	if not cache then return nil end

	local now = tick()
	if cache.SkeletonStamp and (now - cache.SkeletonStamp) < CHARACTER_CACHE_TTL and cache.SkeletonData then
		return cache.SkeletonData
	end

	local bones = {
		Head = GetCharacterPart(character, "Head"),

		UpperTorso = GetCharacterPart(character, "UpperTorso", "Torso"),
		LowerTorso = GetCharacterPart(character, "LowerTorso", "Torso"),

		LeftUpperArm = GetCharacterPart(character, "LeftUpperArm", "Left Arm"),
		LeftLowerArm = GetCharacterPart(character, "LeftLowerArm", "Left Arm"),
		LeftHand = GetCharacterPart(character, "LeftHand", "Left Arm"),

		RightUpperArm = GetCharacterPart(character, "RightUpperArm", "Right Arm"),
		RightLowerArm = GetCharacterPart(character, "RightLowerArm", "Right Arm"),
		RightHand = GetCharacterPart(character, "RightHand", "Right Arm"),

		LeftUpperLeg = GetCharacterPart(character, "LeftUpperLeg", "Left Leg"),
		LeftLowerLeg = GetCharacterPart(character, "LeftLowerLeg", "Left Leg"),
		LeftFoot = GetCharacterPart(character, "LeftFoot", "Left Leg"),

		RightUpperLeg = GetCharacterPart(character, "RightUpperLeg", "Right Leg"),
		RightLowerLeg = GetCharacterPart(character, "RightLowerLeg", "Right Leg"),
		RightFoot = GetCharacterPart(character, "RightFoot", "Right Leg")
	}

	local skeletonData = { Bones = bones, GenericPairs = nil }

	if not (bones.Head and bones.UpperTorso) then
		local core = RefreshCharacterCoreCache(character)
		local root = core and core.RootPart
		local high, low, left, right = nil, nil, nil, nil

		for _, obj in ipairs(GetCharacterBaseParts(character)) do
			if not high or obj.Position.Y > high.Position.Y then high = obj end
			if not low or obj.Position.Y < low.Position.Y then low = obj end
			if not left or obj.Position.X < left.Position.X then left = obj end
			if not right or obj.Position.X > right.Position.X then right = obj end
		end

		skeletonData.GenericPairs = {
			{ high, root },
			{ root, low },
			{ root, left },
			{ root, right }
		}
	end

	cache.SkeletonData = skeletonData
	cache.SkeletonStamp = now
	return skeletonData
end

function RefreshCharacterChamsPartCache(character)
	local cache = GetCharacterDataCache(character)
	if not cache then return nil, false end

	local now = tick()
	if cache.ChamsStamp and (now - cache.ChamsStamp) < CHARACTER_CACHE_TTL and cache.ChamsEntries then
		return cache.ChamsEntries, cache.ChamsHasNamed
	end

	local entries = {}
	local hasNamedPart = false

	for _, partName in ipairs(CHAMS_PART_NAMES) do
		local part = GetCharacterPart(character, partName)

		if IsValidBasePart(part) then
			hasNamedPart = true
			entries[#entries + 1] = { key = partName, part = part }
		end
	end

	if not hasNamedPart then
		local count = 0

		for _, part in ipairs(GetCharacterBaseParts(character)) do
			if part.Transparency < 1 and part.Size.Magnitude > 0.2 then
				count += 1

				if count > 30 then break end

				entries[#entries + 1] = { key = part, part = part }
			end
		end
	end

	cache.ChamsEntries = entries
	cache.ChamsHasNamed = hasNamedPart
	cache.ChamsStamp = now
	return entries, hasNamedPart
end

function GetTeamFolderFromCharacter(character)
	local model = GetCharacterModelFromAny(character)
	if not model then return nil end

	local parent = model.Parent
	if parent and parent.Parent and parent.Parent.Name == "Players" and parent ~= game then
		return parent
	end

	return nil
end

function IsPlayerEnemy(targetPlayer)
	if not targetPlayer or targetPlayer == LocalPlayer then
		return false
	end

	local redTagColor = Color3.fromRGB(255, 10, 20)
	local colorTolerance = 0.02

	if LocalPlayer.TeamColor and targetPlayer.TeamColor then
		return LocalPlayer.TeamColor ~= targetPlayer.TeamColor
	end

	if LocalPlayer.Team and targetPlayer.Team then
		return LocalPlayer.Team ~= targetPlayer.Team
	end

	local targetChar = GetPlayerCharacter(targetPlayer)
	if targetChar then
		local tinyHead = nil

		if typeof(targetChar) == "Instance" and GetEncryptedHeadPart then
			tinyHead = GetEncryptedHeadPart(targetChar)
		else
			tinyHead = GetCharacterPart(targetChar, "Head")
		end

		if tinyHead then
			local tag = tinyHead:FindFirstChild("PlayerTag", true)
			if tag and tag:IsA("TextLabel") then
				return ColorNear(tag.TextColor3, redTagColor, colorTolerance)
			end
		end
	end

	local myChar = LocalPlayer.Character
	local myTeamFolder = GetTeamFolderFromCharacter(myChar)
	local targetTeamFolder = GetTeamFolderFromCharacter(targetChar)

	if myTeamFolder and targetTeamFolder then
		return myTeamFolder ~= targetTeamFolder
	end

	return false
end

function InitRadar()
	if _G.ESPRadarComponents and _G.ESPRadarComponents.Background then
		return
	end

	_G.ESPRadarComponents = {
		Background = Drawing.new("Circle"),
		Border = Drawing.new("Circle"),
		LocalPlayerDot = Drawing.new("Circle"),
		CrosshairH = Drawing.new("Line"),
		CrosshairV = Drawing.new("Line"),
		PlayerDots = {},
		MapPolygons = {},
		PlayerAvatars = {},
		Initialized = true
	}

	_G.ESPRadarComponents.Background.ZIndex = 1
	_G.ESPRadarComponents.Border.ZIndex = 2
	_G.ESPRadarComponents.LocalPlayerDot.ZIndex = 3
	_G.ESPRadarComponents.CrosshairH.ZIndex = 3
	_G.ESPRadarComponents.CrosshairV.ZIndex = 3

	local radar = _G.ESPRadarComponents

	radar.Background.Visible = false
	radar.Background.Filled = true
	radar.Background.Color = Config.ESP.RadarBackgroundColor
	radar.Background.Transparency = Config.ESP.RadarBackgroundTransparency
	radar.Background.NumSides = Config.ESP.RadarSegments
	radar.Background.Radius = Config.ESP.RadarSize / 2

	radar.Border.Visible = false
	radar.Border.Filled = false
	radar.Border.Color = Config.ESP.RadarBorderColor
	radar.Border.Thickness = Config.ESP.RadarBorderThickness
	radar.Border.Transparency = 1
	radar.Border.NumSides = Config.ESP.RadarSegments
	radar.Border.Radius = Config.ESP.RadarSize / 2

	radar.LocalPlayerDot.Visible = false
	radar.LocalPlayerDot.Filled = true
	radar.LocalPlayerDot.Color = Config.ESP.RadarLocalPlayerColor
	radar.LocalPlayerDot.Radius = Config.ESP.RadarDotSize
	radar.LocalPlayerDot.NumSides = 30
	radar.LocalPlayerDot.Transparency = 1
	radar.LocalPlayerDot.ZIndex = 3

	radar.CrosshairH.Visible = false
	radar.CrosshairH.Color = Color3.fromRGB(100, 100, 100)
	radar.CrosshairH.Thickness = 1
	radar.CrosshairH.Transparency = 0.5

	radar.CrosshairV.Visible = false
	radar.CrosshairV.Color = Color3.fromRGB(100, 100, 100)
	radar.CrosshairV.Thickness = 1
	radar.CrosshairV.Transparency = 0.5

end

function RemoveArrow(player)
	local arrow = _G.ESPDirectionalArrows[player]
	if arrow then
		pcall(function() arrow.Triangle:Remove() end)
		pcall(function() arrow.DistanceText:Remove() end)
		_G.ESPDirectionalArrows[player] = nil
	end
end

function UpdateArrows()
	if not Config.ESP.DirectionalArrowsEnabled then
		for _, arrow in pairs(_G.ESPDirectionalArrows) do
			arrow.Triangle.Visible = false
			arrow.DistanceText.Visible = false
		end
		return
	end

	local localRoot = GetLocalRootPartForESP()
	if not localRoot then return end

	local localPos = localRoot.Position
	local viewport = ESPFrameState.ViewportSize or Camera.ViewportSize
	local screenCenter = Vector2.new(viewport.X / 2, viewport.Y / 2)
	local cameraCFrame = ESPFrameState.CameraCFrame or Camera.CFrame
	local cameraRight = cameraCFrame.RightVector
	local cameraUp = cameraCFrame.UpVector
	local seenModelArrows = {}

	local function hideArrowFor(key)
		local arrow = _G.ESPDirectionalArrows[key]
		if arrow then
			arrow.Triangle.Visible = false
			arrow.DistanceText.Visible = false
		end
	end

	local function updateArrowFor(key, targetPos)
		if not _G.ESPDirectionalArrows[key] then
			--CreateArrow(key)
		end
		local arrow = _G.ESPDirectionalArrows[key]
		if not arrow then return end

		local distance = (targetPos - localPos).Magnitude
		if distance > Config.ESP.DirectionalArrowsDistance then
			hideArrowFor(key)
			return
		end

		local targetScreenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
		if onScreen and targetScreenPos.Z > 0 then
			local targetPos2D = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
			local distanceFromCenter = (targetPos2D - screenCenter).Magnitude
			if distanceFromCenter < Config.ESP.DirectionalArrowsOffset then
				hideArrowFor(key)
				return
			end
		end

		local directionTo3D = targetPos - localPos
		if directionTo3D.Magnitude <= 0.001 then
			hideArrowFor(key)
			return
		end

		local screenX = directionTo3D:Dot(cameraRight)
		local screenY = -directionTo3D:Dot(cameraUp)
		local angleOnScreen = math.atan2(screenY, screenX)

		local arrowBaseX = screenCenter.X + math.cos(angleOnScreen) * Config.ESP.DirectionalArrowsOffset
		local arrowBaseY = screenCenter.Y + math.sin(angleOnScreen) * Config.ESP.DirectionalArrowsOffset
		local arrowBase = Vector2.new(arrowBaseX, arrowBaseY)

		local arrowSize = Config.ESP.DirectionalArrowsSize
		local tipOffset = arrowSize * 0.8
		local tip = Vector2.new(
			arrowBase.X + math.cos(angleOnScreen) * tipOffset,
			arrowBase.Y + math.sin(angleOnScreen) * tipOffset
		)

		local baseWidth = arrowSize * 0.5
		local perpAngle1 = angleOnScreen + math.rad(90)
		local perpAngle2 = angleOnScreen - math.rad(90)
		local base1 = Vector2.new(
			arrowBase.X + math.cos(perpAngle1) * baseWidth,
			arrowBase.Y + math.sin(perpAngle1) * baseWidth
		)
		local base2 = Vector2.new(
			arrowBase.X + math.cos(perpAngle2) * baseWidth,
			arrowBase.Y + math.sin(perpAngle2) * baseWidth
		)

		arrow.Triangle.PointA = tip
		arrow.Triangle.PointB = base1
		arrow.Triangle.PointC = base2
		local arrowColor = Config.ESP.Colors.Arrow
		if Config.ESP.GradientEnabled then
			local centroid = (tip + base1 + base2) / 3
			arrowColor = GetESPThemeColorAtPoint(
				ScreenToGradientSpace(centroid),
				Config.ESP.Colors.Arrow
			)
		end
		arrow.Triangle.Color = arrowColor
		arrow.Triangle.Transparency = Config.ESP.DirectionalArrowsTransparency
		arrow.Triangle.Visible = true

		if Config.ESP.DirectionalArrowsShowDistance then
			arrow.DistanceText.Text = math.floor(distance) .. "m"
			arrow.DistanceText.Position = Vector2.new(
				arrowBase.X + math.cos(angleOnScreen) * (tipOffset + 15),
				arrowBase.Y + math.sin(angleOnScreen) * (tipOffset + 15)
			)
			arrow.DistanceText.Color = arrowColor
			arrow.DistanceText.Size = Config.ESP.DirectionalArrowsDistanceTextSize
			arrow.DistanceText.Visible = true
		else
			arrow.DistanceText.Visible = false
		end
	end

	for _, player in ipairs(GetPlayersListCached() or {}) do
		if player == LocalPlayer then continue end

		if Config.ESP.TeamCheck and not IsPlayerEnemy(player) then
			hideArrowFor(player)
			continue
		end

		local character = GetPlayerCharacter(player)
		if not character then
			hideArrowFor(player)
			continue
		end

		local core = RefreshCharacterCoreCache(character)
		local rootPart = core and core.RootPart
		if not rootPart then
			hideArrowFor(player)
			continue
		end

		local humanoid = core and core.Humanoid
		if not humanoid or humanoid.Health <= 0 then
			hideArrowFor(player)
			continue
		end

		updateArrowFor(player, rootPart.Position)
	end

	for _, model in ipairs(GetEncryptedEnemyModelsCached(Config.ESP.TeamCheck)) do
		seenModelArrows[model] = true

		local aimPart = nil
		if GetEncryptedHeadPart then
			aimPart = GetEncryptedHeadPart(model)
		end
		if not aimPart then
			aimPart = GetBestBasePart(model, "HumanoidRootPart")
		end

		if not aimPart then
			hideArrowFor(model)
			continue
		end

		local hp = GetModelHealthValues(model)
		if hp and hp <= 0 then
			hideArrowFor(model)
			continue
		end

		updateArrowFor(model, aimPart.Position)
	end

	if Config.ESP.TargetNPCs then
		for _, model in ipairs(GetNpcModelsCached()) do
			if model and model.Parent then
				seenModelArrows[model] = true

				local aimPart = model:FindFirstChild("Head", true) or GetBestBasePart(model, "HumanoidRootPart")
				if not aimPart then
					hideArrowFor(model)
					continue
				end

				local hp = GetModelHealthValues(model)
				if hp and hp <= 0 then
					hideArrowFor(model)
					continue
				end

				updateArrowFor(model, aimPart.Position)
			end
		end
	end

	for key, _ in pairs(_G.ESPDirectionalArrows) do
		if typeof(key) == "Instance" and key:IsA("Model") and not seenModelArrows[key] then
			hideArrowFor(key)
		end
	end

end

function ColorNear(a, b, tolerance)
	return math.abs(a.R - b.R) <= tolerance
		and math.abs(a.G - b.G) <= tolerance
		and math.abs(a.B - b.B) <= tolerance
end

function IsTinyHeadPart(part)
	if not part or not part:IsA("BasePart") then return false end
	local size = part.Size
	return math.abs(size.X - 0.001) <= 0.0005
		and math.abs(size.Y - 0.001) <= 0.0005
		and math.abs(size.Z - 0.001) <= 0.0005
end

function IsRadarMapPart(part)
	if not part or not part:IsA("BasePart") then return false end
	if part.Transparency >= 0.95 then return false end
	local size = part.Size
	local maxAxis = math.max(size.X, size.Y, size.Z)
	local minAxis = math.min(size.X, size.Y, size.Z)
	local isFlat = minAxis < 2 and maxAxis > 4
	if not isFlat and maxAxis < 1.5 then return false end
	if not part.Anchored then return false end
	if LocalPlayer.Character and part:IsDescendantOf(LocalPlayer.Character) then return false end
	if part:FindFirstAncestorOfClass("Tool") then return false end
	local model = part:FindFirstAncestorOfClass("Model")
	if model and model:FindFirstChildOfClass("Humanoid") then return false end
	return true
end

function GetRadarMapStyle(part)
	local name = string.lower(part.Name or "")
	local material = part.Material
	local size = part.Size
	local maxAxis = math.max(size.X, size.Y, size.Z)
	local minAxis = math.min(size.X, size.Y, size.Z)

	local isTreeName = name:find("tree") or name:find("leaf") or name:find("bush") or name:find("pine") or name:find("oak") or name:find("trunk")
	if isTreeName or material == Enum.Material.Wood or material == Enum.Material.WoodPlanks then
		return Config.ESP.RadarMapTreeColor, 4
	end

	local isGround = material == Enum.Material.Grass
		or material == Enum.Material.Ground
		or material == Enum.Material.Mud
		or material == Enum.Material.Sand
		or material == Enum.Material.Slate
		or material == Enum.Material.Rock
	if isGround then
		return Config.ESP.RadarMapGroundColor, 1
	end

	local isRoad = name:find("road")
		or name:find("street")
		or name:find("highway")
		or name:find("lane")
		or material == Enum.Material.Asphalt
		or (material == Enum.Material.Concrete and minAxis <= 3 and maxAxis >= 25)
	if isRoad then
		return Config.ESP.RadarMapRoadColor, 2
	end

	local isBuilding = maxAxis >= 20
		or material == Enum.Material.Concrete
		or material == Enum.Material.Brick
		or material == Enum.Material.Metal
		or name:find("house")
		or name:find("building")
	if isBuilding then
		return Config.ESP.RadarMapBuildingColor, 3
	end

	return Config.ESP.RadarMapPropColor, 5
end

function ProjectWorldToRadar2D(worldPos, localPos, flatRight, flatLook, scale, maxRadius)
	local rel = worldPos - localPos
	local flatRel = Vector3.new(rel.X, 0, rel.Z)
	local mapX = flatRel:Dot(flatRight) * scale
	local mapY = -flatRel:Dot(flatLook) * scale
	local dist2d = math.sqrt(mapX * mapX + mapY * mapY)
	if dist2d > maxRadius and dist2d > 0 then
		local clampFactor = maxRadius / dist2d
		mapX = mapX * clampFactor
		mapY = mapY * clampFactor
	end
	return mapX, mapY
end

function GetRadarPartFootprint(part)
	local size = part.Size
	local hx = size.X * 0.5
	local hz = size.Z * 0.5
	local cf = part.CFrame
	local topCenter = cf.Position + cf.UpVector * (size.Y * 0.5)
	local flatRight = Vector3.new(cf.RightVector.X, 0, cf.RightVector.Z)
	local flatLook  = Vector3.new(cf.LookVector.X,  0, cf.LookVector.Z)

	local rightMag = flatRight.Magnitude
	local lookMag  = flatLook.Magnitude

	if rightMag < 1e-4 then
		flatRight = Vector3.new(1, 0, 0)
	else
		flatRight = flatRight / rightMag
	end

	if lookMag < 1e-4 then
		flatLook = Vector3.new(0, 0, 1)
	else
		flatLook = flatLook / lookMag
	end
	local yRatio = size.Y / math.max(size.X, size.Z, 0.01)
	local footprintScale = 1.0
	if yRatio > 1.5 then
		footprintScale = math.clamp(1.0 / yRatio, 0.15, 1.0)
	end

	local rx = hx * footprintScale
	local rz = hz * footprintScale

	return {
		topCenter + (-flatRight * rx) + (-flatLook * rz),
		topCenter + ( flatRight * rx) + (-flatLook * rz),
		topCenter + ( flatRight * rx) + ( flatLook * rz),
		topCenter + (-flatRight * rx) + ( flatLook * rz),
	}
end

function GetRadarPlayerDotRadius(rootPart, scale)
	local rootSize = rootPart and rootPart.Size or Vector3.new(2, 2, 1)
	local studRadius = math.max(rootSize.X, rootSize.Z) * 0.5
	local worldScaled = studRadius * scale
	local baseRadius = Config.ESP.RadarDotSize
	local scaled = baseRadius + worldScaled
	return math.clamp(scaled * Config.ESP.RadarScale, baseRadius * 0.7, baseRadius * 3.5)
end

function HideRadarAvatar(slot)
	if not slot then return end
	if slot.Frame then slot.Frame.Visible = false end
	if slot.Drawing then slot.Drawing.Visible = false end
end

function RemoveRadarAvatar(radar, key)
	if not radar or not radar.PlayerAvatars then return end
	local slot = radar.PlayerAvatars[key]
	if not slot then return end
	if slot.Frame then pcall(function() slot.Frame:Destroy() end) end
	radar.PlayerAvatars[key] = nil
end

function ClampToRadarDisc(mapX, mapY, clipRadius)
	local dist2 = mapX * mapX + mapY * mapY
	if dist2 > clipRadius * clipRadius then
		local d = math.sqrt(dist2)
		local scale = clipRadius / d
		return mapX * scale, mapY * scale
	end
	return mapX, mapY
end

local RadarAvatarGui = nil
local RadarBackgroundFrame = nil

local function GetOrCreateRadarAvatarGui()
	if RadarAvatarGui and RadarAvatarGui.Parent then
		return RadarAvatarGui
	end
	local playerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
	if not playerGui then return nil end
	local existing = playerGui:FindFirstChild("RadarAvatarGui")
	if existing then existing:Destroy() end
	local gui = Instance.new("ScreenGui")
	gui.Name = "RadarAvatarGui"
	gui.ResetOnSpawn = false
	gui.IgnoreGuiInset = true
	gui.DisplayOrder = 10
	gui.Parent = playerGui
	RadarAvatarGui = gui
	return gui
end

local function GetOrCreateRadarBackground()
	if RadarBackgroundFrame and RadarBackgroundFrame.Parent then
		return RadarBackgroundFrame
	end
	local gui = GetOrCreateRadarAvatarGui()
	if not gui then return nil end
	local frame = Instance.new("Frame")
	frame.Size = UDim2.fromOffset(Config.ESP.RadarSize, Config.ESP.RadarSize)
	frame.Position = UDim2.fromOffset(Config.ESP.RadarPositionX, Config.ESP.RadarPositionY)
	frame.BackgroundColor3 = Config.ESP.RadarBackgroundColor
	frame.BackgroundTransparency = Config.ESP.RadarBackgroundTransparency
	frame.BorderSizePixel = 0
	frame.ZIndex = 1
	frame.Parent = gui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = frame
	RadarBackgroundFrame = frame
	return frame
end

function EnsureRadarAvatarSlot(radar, key)
	if not radar.PlayerAvatars then
		radar.PlayerAvatars = {}
	end
	local slot = radar.PlayerAvatars[key]
	if slot then return slot end

	local gui = GetOrCreateRadarAvatarGui()
	local frame = nil
	local img = nil
	if gui then
		frame = Instance.new("Frame")
		frame.Size = UDim2.fromOffset(14, 14)
		frame.BackgroundColor3 = Config.ESP.RadarAvatarBackgroundColor
		frame.ZIndex = 12
		frame.Parent = gui

		local frameCorner = Instance.new("UICorner")
		frameCorner.CornerRadius = UDim.new(1, 0)
		frameCorner.Parent = frame
		local imgCorner = nil

		img = Instance.new("ImageLabel")
		img.BackgroundTransparency = 1
		img.Size = UDim2.new(0.85, 0, 0.85, 0)
		img.Position = UDim2.new(0.075, 0, 0.075, 0)
		img.ScaleType = Enum.ScaleType.Fit
		img.ZIndex = 13
		img.Parent = frame

		imgCorner = Instance.new("UICorner")
		imgCorner.CornerRadius = UDim.new(1, 0)
		imgCorner.Parent = img
	end

	slot = {
		Frame = frame,
		Image = img,
		UserId = nil,
		LastLoadTry = 0,
		Loaded = false,
	}

	radar.PlayerAvatars[key] = slot
	return slot
end

function EnsureRadarAvatarTexture(slot, userId)
	if not slot then return false end
	if slot.UserId == userId and slot.Loaded then return true end
	if slot.UserId ~= userId then
		slot.Loaded = false
		slot.UserId = userId
		if slot.Image then slot.Image.Image = "" end
		if slot.Drawing then slot.Drawing.Image = "" end
	end

	local now = tick()
	if (now - (slot.LastLoadTry or 0)) < 5 then return false end
	slot.LastLoadTry = now

	task.spawn(function()
		local ok, thumb = pcall(function()
			return game:GetService("Players"):GetUserThumbnailAsync(
				userId,
				Enum.ThumbnailType.HeadShot,
				Enum.ThumbnailSize.Size150x150
			)
		end)
		if ok and thumb then
			if slot.Image and slot.Image.Parent then
				slot.Image.Image = thumb
			end
			if slot.Drawing then
				slot.Drawing.Image = thumb
			end
			slot.Loaded = true
		end
	end)

	return false
end


function RefreshRadarMap(localPos)
	if not Config.ESP.RadarMapEnabled then
		table.clear(RadarMapEntries)
		return
	end

	local radius = math.max(100, tonumber(Config.ESP.RadarMapRange) or 650)
	local maxPoints = RADAR_MAP_LOCKED_MAX_POINTS

	local excludeList = {}
	if LocalPlayer.Character then
		excludeList[#excludeList + 1] = LocalPlayer.Character
	end
	local workspacePlayers = Workspace:FindFirstChild("Players")
	if workspacePlayers then
		excludeList[#excludeList + 1] = workspacePlayers
	end
	RadarOverlapParams.FilterDescendantsInstances = excludeList
	local nearbyParts = {}
	pcall(function()
		nearbyParts = Workspace:GetPartBoundsInRadius(localPos, radius, RadarOverlapParams)
	end)
	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Exclude
	rayParams.FilterDescendantsInstances = excludeList
	rayParams.IgnoreWater = true

	local floorPartsFound = {}
	local floorPartSet = {}
	local gridStep = radius / 6
	local rayOriginY = localPos.Y + 50
	local rayLength = 200

	for gx = -6, 6 do
		for gz = -6, 6 do
			local wx = localPos.X + gx * gridStep
			local wz = localPos.Z + gz * gridStep
			local distFromCenter = math.sqrt((gx * gridStep)^2 + (gz * gridStep)^2)
			if distFromCenter > radius then continue end

			local origin = Vector3.new(wx, rayOriginY, wz)
			local direction = Vector3.new(0, -rayLength, 0)
			local result = workspace:Raycast(origin, direction, rayParams)

			if result and result.Instance then
				local part = result.Instance
				if IsRadarMapPart(part) and not floorPartSet[part] then
					floorPartSet[part] = true
					floorPartsFound[#floorPartsFound + 1] = part
				end
			end
		end
	end

	local seenParts = {}
	local entries = {}
	for _, part in ipairs(floorPartsFound) do
		if not seenParts[part] then
			seenParts[part] = true
			local styleColor, stylePriority = GetRadarMapStyle(part)

			local size = part.Size
			local isFlat = size.Y < math.min(size.X, size.Z) * 0.3
			if isFlat then
				stylePriority = 0 
				styleColor = GetRadarMapStyle(part)
			end
			entries[#entries + 1] = {
				Part = part,
				Color = styleColor,
				Priority = isFlat and 0 or stylePriority,
			}
		end
	end
	for _, part in ipairs(nearbyParts) do
		if part and part.Parent and IsRadarMapPart(part) and not seenParts[part] then
			seenParts[part] = true
			local styleColor, stylePriority = GetRadarMapStyle(part)
			entries[#entries + 1] = {
				Part = part,
				Color = styleColor,
				Priority = stylePriority,
			}
		end
	end
	table.sort(entries, function(a, b)
		if a.Priority ~= b.Priority then
			return a.Priority < b.Priority
		end
		if a.Part.Size.Magnitude ~= b.Part.Size.Magnitude then
			return a.Part.Size.Magnitude > b.Part.Size.Magnitude
		end
		return tostring(a.Part) < tostring(b.Part)
	end)

	table.clear(RadarMapEntries)
	for i = 1, math.min(#entries, maxPoints) do
		RadarMapEntries[i] = {
			Part = entries[i].Part,
			Color = entries[i].Color,
		}
	end
end
_G.UpdateRadar = function()
	if not Config.ESP.RadarEnabled then
		if _G.ESPRadarComponents then
			_G.ESPRadarComponents.Background.Visible = false
			_G.ESPRadarComponents.Border.Visible = false
			_G.ESPRadarComponents.LocalPlayerDot.Visible = false
			_G.ESPRadarComponents.CrosshairH.Visible = false
			_G.ESPRadarComponents.CrosshairV.Visible = false
			for _, dot in pairs(_G.ESPRadarComponents.PlayerDots or {}) do
				if dot.Visible ~= nil then dot.Visible = false end
			end
			for _, poly in ipairs(_G.ESPRadarComponents.MapPolygons or {}) do
				if poly.Visible ~= nil then poly.Visible = false end
			end
			if RadarBackgroundFrame then
				RadarBackgroundFrame.Visible = false
			end
			if _G.ESPRadarComponents.PlayerAvatars then
				for _, slot in pairs(_G.ESPRadarComponents.PlayerAvatars) do
					if slot and slot.Drawing then
						slot.Drawing.Visible = false
					end
				end
			end
		end
		return
	end

	if not _G.ESPRadarComponents then return end
	local radar = _G.ESPRadarComponents

	local radarCenter = Vector2.new(
		Config.ESP.RadarPositionX + Config.ESP.RadarSize / 2,
		Config.ESP.RadarPositionY + Config.ESP.RadarSize / 2
	)
	local radarRadius = Config.ESP.RadarSize / 2
	local bg = GetOrCreateRadarBackground()
	if bg then
		bg.Size = UDim2.fromOffset(Config.ESP.RadarSize, Config.ESP.RadarSize)
		bg.Position = UDim2.fromOffset(Config.ESP.RadarPositionX, Config.ESP.RadarPositionY)
		bg.BackgroundColor3 = Config.ESP.RadarBackgroundColor
		bg.BackgroundTransparency = Config.ESP.RadarBackgroundTransparency
		bg.Visible = true
	end

	radar.Border.Color = Config.ESP.RadarBorderColor
	radar.Border.Thickness = Config.ESP.RadarBorderThickness
	radar.Border.NumSides = Config.ESP.RadarSegments
	radar.Border.Radius = radarRadius
	radar.Border.Position = radarCenter
	radar.Border.Transparency = 1
	radar.Border.Visible = true

	radar.Background.Visible = false
	if radar.PlayerAvatars then
		for _, slot in pairs(radar.PlayerAvatars) do
			if slot and slot.Frame then
				slot.Frame.BackgroundColor3 = Config.ESP.RadarAvatarBackgroundColor
			end
		end
	end
	radar.Background.Visible = false
	radar.LocalPlayerDot.Position = radarCenter
	radar.LocalPlayerDot.Color = Config.ESP.RadarLocalPlayerColor
	radar.LocalPlayerDot.Radius = Config.ESP.RadarDotSize
	radar.LocalPlayerDot.Visible = true

	if Config.ESP.RadarShowCrosshair then
		radar.CrosshairH.From = Vector2.new(radarCenter.X - radarRadius, radarCenter.Y)
		radar.CrosshairH.To = Vector2.new(radarCenter.X + radarRadius, radarCenter.Y)
		radar.CrosshairH.Visible = true
		radar.CrosshairV.From = Vector2.new(radarCenter.X, radarCenter.Y - radarRadius)
		radar.CrosshairV.To = Vector2.new(radarCenter.X, radarCenter.Y + radarRadius)
		radar.CrosshairV.Visible = true
	else
		radar.CrosshairH.Visible = false
		radar.CrosshairV.Visible = false
	end

	local localRoot = GetLocalRootPartForESP()
	if not localRoot then return end
	local localPos = localRoot.Position

	if not radar.PlayerDots then radar.PlayerDots = {} end
	if not radar.MapPolygons then radar.MapPolygons = {} end

	local orientationCFrame = localRoot.CFrame
	local lookVector = orientationCFrame.LookVector
	local rightVector = orientationCFrame.RightVector
	local flatLook = Vector3.new(lookVector.X, 0, lookVector.Z)
	local flatRight = Vector3.new(rightVector.X, 0, rightVector.Z)
	local flatLookMag = flatLook.Magnitude
	local flatRightMag = flatRight.Magnitude
	if flatLookMag < 1e-4 or flatRightMag < 1e-4 then return end
	flatLook = flatLook / flatLookMag
	flatRight = flatRight / flatRightMag

	local mapRange = math.max(100, tonumber(Config.ESP.RadarMapRange) or 650)
	local playerRange = Config.ESP.RadarMapEnabled and mapRange or math.max(100, tonumber(Config.ESP.RadarRange) or 500)
	local scale = radarRadius / playerRange
	local maxDotRadius = radarRadius - Config.ESP.RadarDotSize
	local now = tick()
	local scanInterval = RADAR_MAP_LOCKED_SCAN_INTERVAL
	if (now - RadarMapLastScan) >= scanInterval then
		local shouldRescan = (RadarMapLastScanPos == nil)
			or (#RadarMapEntries == 0)
			or ((localPos - RadarMapLastScanPos).Magnitude >= RADAR_MAP_RESCAN_DISTANCE)
		if shouldRescan then
			RefreshRadarMap(localPos)
			RadarMapLastScanPos = localPos
		end
		RadarMapLastScan = now
	end
	local mapScale = radarRadius / mapRange
	local mapTransparency = RADAR_MAP_LOCKED_TRANSPARENCY
	local clipRadius = radarRadius - 2
	local mapVisibleCount = 0
	if Config.ESP.RadarMapEnabled then
		for i = 1, #RadarMapEntries do
			local entry = RadarMapEntries[i]
			local part = entry and entry.Part
			if not (part and part.Parent) then continue end
			local corners = GetRadarPartFootprint(part)
			local offsets = table.create(4)
			local centroidX, centroidY = 0, 0
			for ci = 1, 4 do
				local rel = corners[ci] - localPos
				local flatRel = Vector3.new(rel.X, 0, rel.Z)
				local mapX = flatRel:Dot(flatRight) * mapScale
				local mapY = -flatRel:Dot(flatLook) * mapScale
				offsets[ci] = { x = mapX, y = mapY }
				centroidX = centroidX + mapX
				centroidY = centroidY + mapY
			end
			centroidX = centroidX * 0.25
			centroidY = centroidY * 0.25
			local insideCount = 0
			for ci = 1, 4 do
				local ox, oy = offsets[ci].x, offsets[ci].y
				if (ox * ox + oy * oy) <= (clipRadius * clipRadius) then
					insideCount = insideCount + 1
				end
			end
			local centroidInside = (centroidX * centroidX + centroidY * centroidY) <= (clipRadius * clipRadius)
			if insideCount < 2 and not centroidInside then continue end
			local projected = table.create(4)
			for ci = 1, 4 do
				local ox, oy = offsets[ci].x, offsets[ci].y
				local dist2 = ox * ox + oy * oy

				if dist2 > clipRadius * clipRadius then
					local t = 0.5
					local step = 0.25
					for _ = 1, 8 do
						local tx = ox + (centroidX - ox) * t
						local ty = oy + (centroidY - oy) * t
						if (tx * tx + ty * ty) <= (clipRadius * clipRadius) then
							t = t - step
						else
							t = t + step
						end
						step = step * 0.5
					end
					t = math.clamp(t, 0, 1)
					ox = ox + (centroidX - ox) * t
					oy = oy + (centroidY - oy) * t
					local finalDist2 = ox * ox + oy * oy
					if finalDist2 > clipRadius * clipRadius then
						local d = math.sqrt(finalDist2)
						ox = ox / d * clipRadius
						oy = oy / d * clipRadius
					end
				end

				projected[ci] = Vector2.new(radarCenter.X + ox, radarCenter.Y + oy)
			end

			mapVisibleCount = mapVisibleCount + 1

			if not radar.MapPolygons[mapVisibleCount] then
				local poly = Drawing.new("Quad")
				poly.Visible = false
				poly.Filled = true
				poly.Thickness = 1
				radar.MapPolygons[mapVisibleCount] = poly
			end

			local poly = radar.MapPolygons[mapVisibleCount]
			poly.PointA = projected[1]
			poly.PointB = projected[2]
			poly.PointC = projected[3]
			poly.PointD = projected[4]
			poly.Color = entry.Color or Config.ESP.RadarMapPropColor
			poly.Transparency = mapTransparency
			poly.Visible = true
		end
	end
	for i = mapVisibleCount + 1, #radar.MapPolygons do
		if radar.MapPolygons[i].Visible then
			radar.MapPolygons[i].Visible = false
		end
	end

	for _, player in ipairs(GetPlayersListCached()) do
		if player == LocalPlayer then continue end

		if Config.ESP.TeamCheck and not IsPlayerEnemy(player) then
			if radar.PlayerDots[player] then radar.PlayerDots[player].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[player])
			continue
		end

		local character = GetPlayerCharacter(player)
		if not character then
			if radar.PlayerDots[player] then radar.PlayerDots[player].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[player])
			continue
		end

		local core = RefreshCharacterCoreCache(character)
		local rootPart = core and core.RootPart
		if not rootPart then
			if radar.PlayerDots[player] then radar.PlayerDots[player].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[player])
			continue
		end

		local humanoid = core and core.Humanoid
		if not humanoid or humanoid.Health <= 0 then
			if radar.PlayerDots[player] then radar.PlayerDots[player].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[player])
			continue
		end

		local distance = (rootPart.Position - localPos).Magnitude
		if distance > playerRange then
			if radar.PlayerDots[player] then radar.PlayerDots[player].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[player])
			continue
		end

		if not radar.PlayerDots[player] then
			local dot = Drawing.new("Circle")
			dot.Filled = true
			dot.Radius = Config.ESP.RadarDotSize
			dot.NumSides = 30
			dot.Transparency = 1
			radar.PlayerDots[player] = dot
		end

		local dot = radar.PlayerDots[player]
		local rel = rootPart.Position - localPos
		local flatRel = Vector3.new(rel.X, 0, rel.Z)
		local radarXPos = flatRel:Dot(flatRight) * scale
		local radarYPos = -flatRel:Dot(flatLook) * scale
		local dist2 = radarXPos * radarXPos + radarYPos * radarYPos
		if dist2 > maxDotRadius * maxDotRadius then
			local d = math.sqrt(dist2)
			radarXPos = radarXPos / d * maxDotRadius
			radarYPos = radarYPos / d * maxDotRadius
		end

		local dotRadius = GetRadarPlayerDotRadius(rootPart, scale)
		local dotCenter = Vector2.new(radarCenter.X + radarXPos, radarCenter.Y + radarYPos)
		if radar.PlayerDots[player] then
			radar.PlayerDots[player].Visible = false
		end

		local pSlot = EnsureRadarAvatarSlot(radar, player)
		if pSlot then
			local activeRange = Config.ESP.RadarMapEnabled
				and (tonumber(Config.ESP.RadarMapRange) or 900)
				or (tonumber(Config.ESP.RadarRange) or 500)
			local avatarSize = math.clamp(math.floor(Config.ESP.RadarSize / (activeRange / 55)), 6, 18)
			if pSlot.Frame then
				pSlot.Frame.Size = UDim2.fromOffset(avatarSize, avatarSize)
				pSlot.Frame.Position = UDim2.fromOffset(
					math.floor(dotCenter.X - avatarSize / 2),
					math.floor(dotCenter.Y - avatarSize / 2)
				)
				pSlot.Frame.Visible = true
			end
			if pSlot.Drawing then
				pSlot.Drawing.Size = Vector2.new(avatarSize, avatarSize)
				pSlot.Drawing.Position = Vector2.new(dotCenter.X - avatarSize/2, dotCenter.Y - avatarSize/2)
				pSlot.Drawing.Visible = true
			end
			EnsureRadarAvatarTexture(pSlot, player.UserId)
		end


	end
	local seenModelDots = {}

	for _, model in ipairs(GetEncryptedEnemyModelsCached(Config.ESP.TeamCheck)) do
		local rootPart = GetBestBasePart(model, "HumanoidRootPart")
		if not rootPart then
			if radar.PlayerDots[model] then radar.PlayerDots[model].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[model])
			continue
		end

		local hp = GetModelHealthValues(model)
		if hp and hp <= 0 then
			if radar.PlayerDots[model] then radar.PlayerDots[model].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[model])
			continue
		end

		local distance = (rootPart.Position - localPos).Magnitude
		if distance > playerRange then
			if radar.PlayerDots[model] then radar.PlayerDots[model].Visible = false end
			HideRadarAvatar(radar.PlayerAvatars[model])
			continue
		end

		seenModelDots[model] = true
		if not radar.PlayerDots[model] then
			local dot = Drawing.new("Circle")
			dot.Filled = true
			dot.Radius = Config.ESP.RadarDotSize
			dot.NumSides = 30
			dot.Transparency = 1
			radar.PlayerDots[model] = dot
		end

		local dot = radar.PlayerDots[model]

		local rel = rootPart.Position - localPos
		local flatRel = Vector3.new(rel.X, 0, rel.Z)
		local radarXPos = flatRel:Dot(flatRight) * scale
		local radarYPos = -flatRel:Dot(flatLook) * scale

		local dist2 = radarXPos * radarXPos + radarYPos * radarYPos
		if dist2 > maxDotRadius * maxDotRadius then
			local d = math.sqrt(dist2)
			radarXPos = radarXPos / d * maxDotRadius
			radarYPos = radarYPos / d * maxDotRadius
		end
		local dotRadius = GetRadarPlayerDotRadius(rootPart, scale)
		local dotCenter = Vector2.new(radarCenter.X + radarXPos, radarCenter.Y + radarYPos)
		dot.Position = dotCenter
		dot.Color = Config.ESP.RadarEnemyColor
		dot.Radius = math.max(2, dotRadius * 0.65)
		dot.Visible = true
	end

	if Config.ESP.TargetNPCs then
		for _, model in ipairs(GetNpcModelsCached()) do
			if model and model.Parent then
				local rootPart = GetBestBasePart(model, "HumanoidRootPart") or model:FindFirstChild("Head", true)
				if rootPart then
					local hp = GetModelHealthValues(model)
					if not hp or hp > 0 then
						local distance = (rootPart.Position - localPos).Magnitude
						if distance <= playerRange then
							seenModelDots[model] = true
							if not radar.PlayerDots[model] then
								local dot = Drawing.new("Circle")
								dot.Filled = true
								dot.Radius = Config.ESP.RadarDotSize
								dot.NumSides = 30
								dot.Transparency = 1
								radar.PlayerDots[model] = dot
							end
							local dot = radar.PlayerDots[model]
							local rel = rootPart.Position - localPos
							local flatRel = Vector3.new(rel.X, 0, rel.Z)
							local radarXPos = flatRel:Dot(flatRight) * scale
							local radarYPos = -flatRel:Dot(flatLook) * scale
							local dist2 = radarXPos * radarXPos + radarYPos * radarYPos
							if dist2 > maxDotRadius * maxDotRadius then
								local d = math.sqrt(dist2)
								radarXPos = radarXPos / d * maxDotRadius
								radarYPos = radarYPos / d * maxDotRadius
							end
							local dotRadius = GetRadarPlayerDotRadius(rootPart, scale)
							local dotCenter = Vector2.new(radarCenter.X + radarXPos, radarCenter.Y + radarYPos)
							dot.Position = dotCenter
							dot.Color = Config.ESP.RadarEnemyColor
							dot.Radius = math.max(2, dotRadius * 0.65)
							dot.Visible = true
						end
					end
				end
			end
		end
	end
	for key, dot in pairs(radar.PlayerDots) do
		if typeof(key) == "Instance" and key:IsA("Model") and not seenModelDots[key] then
			dot.Visible = false
		end
	end
end

_G.UpdateESPSettings = function()
	for key, value in pairs(Config.ESP) do
		_G.ESPSettings[key] = value
	end
end

_G.ToggleESP = function(enabled)
	Config.ESP.Enabled = enabled

	if enabled then
		for _, player in ipairs(GetPlayersListCached()) do
			if player ~= LocalPlayer then
				if not _G.ESPDrawings[player] then
					CreateESP(player)
				end
			end
		end
	else
		for _, player in ipairs(GetPlayersListCached()) do
			if _G.ESPDrawings[player] then
				local esp = _G.ESPDrawings[player]
				if esp.Box then
					for _, line in pairs(esp.Box) do
						line.Visible = false
					end
				end
				if esp.BoxFill then
					esp.BoxFill.Visible = false
				end

				if esp.Tracer then
					esp.Tracer.Visible = false
				end

				if esp.HealthBar then
					esp.HealthBar.Outline.Visible = false
					esp.HealthBar.Fill.Visible = false
					esp.HealthBar.Text.Visible = false
				end

				if esp.Info then
					esp.Info.Name.Visible = false
					esp.Info.Distance.Visible = false
					if esp.Info.Tool then
						esp.Info.Tool.Visible = false
					end
				end

				if esp.Skeleton then
					for _, line in pairs(esp.Skeleton) do
						line.Visible = false
					end
				end
			end

			if _G.ESPHighlights[player] then
				_G.ESPHighlights[player].Enabled = false
			end
		end
	end
end

function GetHealthColor(health, maxHealth)
	local percentage = health / maxHealth
	if percentage > 0.5 then
		return Config.ESP.Colors.HealthHigh
	elseif percentage > 0.2 then
		return Config.ESP.Colors.HealthMedium
	else
		return Config.ESP.Colors.HealthLow
	end
end

function GetTracerOrigin()
	local viewportSize = Camera.ViewportSize

	if Config.ESP.TracerOrigin == "Bottom" then
		return Vector2.new(viewportSize.X / 2, viewportSize.Y)
	elseif Config.ESP.TracerOrigin == "Top" then
		return Vector2.new(viewportSize.X / 2, 0)
	elseif Config.ESP.TracerOrigin == "Mouse" then
		local mousePos = UserInputService:GetMouseLocation()
		return mousePos
	else
		return Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
	end
end

function CreateBoxes(player)
	if player == LocalPlayer then return end

	if not _G.ESPDrawings[player] then
		_G.ESPDrawings[player] = {}
	end

	_G.ESPDrawings[player].Box = {
		TopLeft = Drawing.new("Line"),
		TopRight = Drawing.new("Line"),
		BottomLeft = Drawing.new("Line"),
		BottomRight = Drawing.new("Line"),
		Top = Drawing.new("Line"),
		Bottom = Drawing.new("Line"),
		Left = Drawing.new("Line"),
		Right = Drawing.new("Line")
	}
	_G.ESPDrawings[player].BoxFill = Drawing.new("Square")
	_G.ESPDrawings[player].BoxFillTris = {}

	for _, line in pairs(_G.ESPDrawings[player].Box) do
		line.Visible = false
		line.Color = Config.ESP.Colors.Box
		line.Thickness = Config.ESP.BoxThickness
	end
	_G.ESPDrawings[player].BoxFill.Visible = false
	_G.ESPDrawings[player].BoxFill.Filled = true
	_G.ESPDrawings[player].BoxFill.Color = Config.ESP.Colors.Box
	_G.ESPDrawings[player].BoxFill.Transparency = Config.ESP.BoxFillTransparency
end

function CreateTracers(player)
	if player == LocalPlayer then return end

	if not _G.ESPDrawings[player] then
		_G.ESPDrawings[player] = {}
	end

	_G.ESPDrawings[player].Tracer = Drawing.new("Line")
	_G.ESPDrawings[player].TracerSegments = {}
	_G.ESPDrawings[player].Tracer.Visible = false
	_G.ESPDrawings[player].Tracer.Color = Config.ESP.Colors.Tracer
	_G.ESPDrawings[player].Tracer.Thickness = Config.ESP.TracerThickness
end

function CreateHealthBars(player)
	if player == LocalPlayer then return end

	if not _G.ESPDrawings[player] then
		_G.ESPDrawings[player] = {}
	end

	_G.ESPDrawings[player].HealthBar = {
		Outline = Drawing.new("Square"),
		Fill = Drawing.new("Square"),
		Text = Drawing.new("Text")
	}

	_G.ESPDrawings[player].HealthBar.Outline.Visible = false
	_G.ESPDrawings[player].HealthBar.Outline.Color = Color3.fromRGB(0, 0, 0)
	_G.ESPDrawings[player].HealthBar.Outline.Filled = true
	_G.ESPDrawings[player].HealthBar.Outline.Thickness = 1

	_G.ESPDrawings[player].HealthBar.Fill.Visible = false
	_G.ESPDrawings[player].HealthBar.Fill.Color = Config.ESP.Colors.Health
	_G.ESPDrawings[player].HealthBar.Fill.Filled = true

	_G.ESPDrawings[player].HealthBar.Text.Visible = false
	_G.ESPDrawings[player].HealthBar.Text.Color = Color3.fromRGB(255, 255, 255)
	_G.ESPDrawings[player].HealthBar.Text.Size = Config.ESP.TextSize
	_G.ESPDrawings[player].HealthBar.Text.Font = 2
	_G.ESPDrawings[player].HealthBar.Text.Outline = true
	_G.ESPDrawings[player].HealthBar.Text.Center = true
end

function CreateNames(player)
	if player == LocalPlayer then return end

	if not _G.ESPDrawings[player] then
		_G.ESPDrawings[player] = {}
	end

	_G.ESPDrawings[player].Info = {
		Name = Drawing.new("Text"),
		Distance = Drawing.new("Text"),
		Tool = Drawing.new("Text")
	}

	_G.ESPDrawings[player].Info.Name.Visible = false
	_G.ESPDrawings[player].Info.Name.Center = true
	_G.ESPDrawings[player].Info.Name.Size = Config.ESP.TextSize
	_G.ESPDrawings[player].Info.Name.Color = Config.ESP.Colors.Text
	_G.ESPDrawings[player].Info.Name.Font = 2
	_G.ESPDrawings[player].Info.Name.Outline = true

	_G.ESPDrawings[player].Info.Distance.Visible = false
	_G.ESPDrawings[player].Info.Distance.Center = true
	_G.ESPDrawings[player].Info.Distance.Size = Config.ESP.TextSize
	_G.ESPDrawings[player].Info.Distance.Color = Config.ESP.Colors.Distance
	_G.ESPDrawings[player].Info.Distance.Font = 2
	_G.ESPDrawings[player].Info.Distance.Outline = true

	_G.ESPDrawings[player].Info.Tool.Visible = false
	_G.ESPDrawings[player].Info.Tool.Center = true
	_G.ESPDrawings[player].Info.Tool.Size = Config.ESP.TextSize
	_G.ESPDrawings[player].Info.Tool.Color = Config.ESP.Colors.Text
	_G.ESPDrawings[player].Info.Tool.Font = 2
	_G.ESPDrawings[player].Info.Tool.Outline = true
end

function CreateSkeleton(player)
	if player == LocalPlayer then return end

	if not _G.ESPDrawings[player] then
		_G.ESPDrawings[player] = {}
	end

	_G.ESPDrawings[player].Skeleton = {}

	local skeletonConnections = {
		"Head", "UpperSpine", "LeftShoulder", "LeftUpperArm", "LeftLowerArm",
		"RightShoulder", "RightUpperArm", "RightLowerArm",
		"LeftHip", "LeftUpperLeg", "LeftLowerLeg",
		"RightHip", "RightUpperLeg", "RightLowerLeg"
	}

	for i = 1, 14 do
		local line = Drawing.new("Line")
		line.Visible = false
		line.Color = Config.ESP.Colors.Skeleton
		line.Thickness = Config.ESP.SkeletonThickness
		line.Transparency = Config.ESP.SkeletonTransparency
		_G.ESPDrawings[player].Skeleton[i] = line
	end
end

function NewQuad(color)
	local quad = Drawing.new("Quad")
	quad.Visible = false
	quad.PointA = Vector2.new(0,0)
	quad.PointB = Vector2.new(0,0)
	quad.PointC = Vector2.new(0,0)
	quad.PointD = Vector2.new(0,0)
	quad.Color = color
	quad.Filled = true
	quad.Thickness = 1
	quad.Transparency = 0
	return quad
end

function CreateChams(player)
	if player == LocalPlayer then return end
	if not _G.ESPDrawings[player] then
		_G.ESPDrawings[player] = {}
	end
	_G.ESPDrawings[player].ChamsQuads = {}
end

function CreateESP(player)
	if player == LocalPlayer then return end

	CreateBoxes(player)
	CreateTracers(player)
	CreateHealthBars(player)
	CreateNames(player)
	CreateSkeleton(player)
	CreateChams(player)
	--CreateArrow(player)

end

function isxraymappart(part)
	if not part or not part:IsA("BasePart") then
		return false
	end
	if LocalPlayer.Character and part:IsDescendantOf(LocalPlayer.Character) then
		return false
	end
	local model = part:FindFirstAncestorOfClass("Model")
	if model and model:FindFirstChildOfClass("Humanoid") then
		return false
	end
	return true
end

function applyxraymappart(part)
	if not isxraymappart(part) then
		return
	end
	if not xraymapcache[part] then
		xraymapcache[part] = part.LocalTransparencyModifier
	end
	part.LocalTransparencyModifier = Config.ESP.XrayMapTransparency
end

function enablexraymap()
	for _, descendant in ipairs(workspace:GetDescendants()) do
		if isxraymappart(descendant) then
			applyxraymappart(descendant)
		end
	end
	if xraymapconnection then
		xraymapconnection:Disconnect()
		xraymapconnection = nil
	end
	xraymapconnection = workspace.DescendantAdded:Connect(function(descendant)
		if Config.ESP.XrayEnabled and Config.ESP.XrayActive and isxraymappart(descendant) then
			applyxraymappart(descendant)
		end
	end)
end

function disablexraymap()
	if xraymapconnection then
		xraymapconnection:Disconnect()
		xraymapconnection = nil
	end
	for part, original in pairs(xraymapcache) do
		if part and part.Parent then
			part.LocalTransparencyModifier = original
		end
	end
	table.clear(xraymapcache)
end

function HideESPDrawings(esp)
	if not esp then return end
	if esp._hidden then return end
	if esp.Box then for _, line in pairs(esp.Box) do line.Visible = false end end
	if esp.BoxFill then esp.BoxFill.Visible = false end
	if esp.BoxFillTris then
		for _, tri in pairs(esp.BoxFillTris) do
			tri.Visible = false
		end
	end
	if esp.Tracer then esp.Tracer.Visible = false end
	if esp.TracerSegments then
		for _, seg in ipairs(esp.TracerSegments) do
			seg.Visible = false
		end
	end
	if esp.HealthBar then
		esp.HealthBar.Outline.Visible = false
		esp.HealthBar.Fill.Visible = false
		esp.HealthBar.Text.Visible = false
	end
	if esp.Info then
		esp.Info.Name.Visible = false
		esp.Info.Distance.Visible = false
		if esp.Info.Tool then
			esp.Info.Tool.Visible = false
		end
	end
	if esp.Skeleton then
		for _, line in pairs(esp.Skeleton) do line.Visible = false end
	end
	if esp.ChamsQuads then
		for _, quads in pairs(esp.ChamsQuads) do
			for _, quad in ipairs(quads) do
				quad.Visible = false
			end
		end
	end
	if esp.Avatar then
		esp.Avatar.Enabled = false
	end
	if esp.Highlight then
		esp.Highlight.Enabled = false
	end
	esp._hidden = true
end

function EnsureESPKey(key)
	if _G.ESPDrawings[key] then return end
	CreateBoxes(key)
	CreateTracers(key)
	CreateHealthBars(key)
	CreateNames(key)
	CreateSkeleton(key)
	CreateChams(key)
end

function GetLocalWorkspaceTeamFolder()
	local playersFolder = Workspace:FindFirstChild("Players")
	if not playersFolder then return nil end

	local subject = Camera and Camera.CameraSubject
	if subject then
		local model = nil
		if subject:IsA("Humanoid") then
			model = subject.Parent
		elseif subject:IsA("BasePart") then
			model = subject:FindFirstAncestorOfClass("Model")
		end
		if model and model.Parent and model.Parent.Parent == playersFolder then
			return model.Parent
		end
	end

	local myChar = LocalPlayer.Character
	if myChar and myChar.Parent and myChar.Parent.Parent == playersFolder then
		return myChar.Parent
	end

	return nil
end

GetLocalRootPartForESP = function()
	local myChar = LocalPlayer.Character
	if myChar then
		local root = myChar:FindFirstChild("HumanoidRootPart") or myChar:FindFirstChild("HumanoidRootPart", true)
		if root and root:IsA("BasePart") then
			return root
		end
	end

	local subject = Camera and Camera.CameraSubject
	if subject then
		if subject:IsA("Humanoid") and subject.Parent then
			local root = subject.Parent:FindFirstChild("HumanoidRootPart") or subject.Parent:FindFirstChildWhichIsA("BasePart", true)
			if root and root:IsA("BasePart") then
				return root
			end
		elseif subject:IsA("BasePart") then
			return subject
		end
	end

	return nil
end

GetBestBasePart = function(model, preferredName)
	local preferred = GetCharacterPart(model, preferredName or "HumanoidRootPart")
	if preferred then
		return preferred
	end

	local parts = GetCharacterBaseParts(model)
	return parts[1]
end

function GetHighestPart(model, fallbackPart)
	local highest = nil

	for _, obj in ipairs(GetCharacterBaseParts(model)) do
		if not highest or obj.Position.Y > highest.Position.Y then
			highest = obj
		end
	end

	return highest or fallbackPart
end

GetEncryptedEnemyModels = function(useTeamCheck)
	local shouldTeamCheck = useTeamCheck == true
	local playersFolder = Workspace:FindFirstChild("Players")
	if not playersFolder then return {} end
	local playersList = GetPlayersListCached()
	local playersByUserId = {}
	local playersByName = {}
	for _, plr in ipairs(playersList) do
		playersByUserId[plr.UserId] = plr
		playersByName[plr.Name] = plr
		playersByName[plr.DisplayName] = plr
	end

	local localTeamFolder = GetLocalWorkspaceTeamFolder()
	local redTagColor = Color3.fromRGB(255, 10, 20)
	local colorTolerance = 0.02

	local function FindPlayerForEncryptedModel(model)
		if not model then return nil end

		local candidateIds = {
			model:GetAttribute("UserId"),
			model:GetAttribute("userId"),
			model:GetAttribute("userid"),
			model:GetAttribute("PlayerId"),
			model:GetAttribute("playerId")
		}

		for _, id in ipairs(candidateIds) do
			if typeof(id) == "number" then
				local mapped = playersByUserId[id]
				if mapped then
					return mapped
				end
			end
		end

		return playersByName[model.Name]
	end

	local function IsLikelyLocalWorkspaceModel(model)
		if not model then return false end
		if LocalPlayer.Character and model == LocalPlayer.Character then
			return true
		end
		local subject = Camera and Camera.CameraSubject
		if subject then
			if subject:IsA("Humanoid") and subject.Parent == model then
				return true
			elseif subject:IsA("BasePart") and subject:IsDescendantOf(model) then
				return true
			end
		end
		return false
	end

	local function IsEncryptedModelEnemy(model)
		if not model then return false end
		if localTeamFolder and model.Parent == localTeamFolder then
			return false
		end

		local mappedPlayer = FindPlayerForEncryptedModel(model)
		if mappedPlayer and mappedPlayer ~= LocalPlayer then
			if LocalPlayer.TeamColor and mappedPlayer.TeamColor then
				return LocalPlayer.TeamColor ~= mappedPlayer.TeamColor
			end
			if LocalPlayer.Team and mappedPlayer.Team then
				return LocalPlayer.Team ~= mappedPlayer.Team
			end
		end

		local tinyHead = GetEncryptedHeadPart and GetEncryptedHeadPart(model)
		if tinyHead then
			local tag = tinyHead:FindFirstChild("PlayerTag", true)
			if tag and tag:IsA("TextLabel") then
				return ColorNear(tag.TextColor3, redTagColor, colorTolerance)
			end
		end

		if localTeamFolder and model.Parent then
			return model.Parent ~= localTeamFolder
		end

		return false
	end

	local function ShouldTrackEncryptedModel(model)
		if not model or not model:IsA("Model") then
			return false
		end
		if model:FindFirstAncestorOfClass("Tool") then
			return false
		end
		if not model:FindFirstChildOfClass("Humanoid") and not FindPlayerForEncryptedModel(model) then
			return false
		end
		return true
	end

	local models = {}

	for _, teamFolder in ipairs(playersFolder:GetChildren()) do
		for _, model in ipairs(teamFolder:GetChildren()) do
			if model:IsA("Model") and not IsLikelyLocalWorkspaceModel(model) and ShouldTrackEncryptedModel(model) then
				if not shouldTeamCheck or IsEncryptedModelEnemy(model) then
					table.insert(models, model)
				end
			end
		end
	end

	return models
end

GetEncryptedEnemyModelsCached = function(useTeamCheck)
	local shouldTeamCheck = useTeamCheck == true
	local now = tick()
	if EncryptedModelsCache.Models
		and EncryptedModelsCache.TeamCheck == shouldTeamCheck
		and (now - EncryptedModelsCache.Stamp) < ENCRYPTED_MODEL_CACHE_TTL then
		return EncryptedModelsCache.Models
	end

	local models = GetEncryptedEnemyModels(shouldTeamCheck)
	EncryptedModelsCache.Models = models
	EncryptedModelsCache.TeamCheck = shouldTeamCheck
	EncryptedModelsCache.Stamp = now
	return models
end

GetEncryptedHeadPart = function(model)
	if not model then return nil end

	local preferred = model:FindFirstChild("Head", true)
	if IsTinyHeadPart(preferred) then
		return preferred
	end

	local redTagColor = Color3.fromRGB(255, 10, 20)
	local tolerance = 0.02

	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") and IsTinyHeadPart(part) then
			local tag = part:FindFirstChild("PlayerTag", true)
			if tag and tag:IsA("TextLabel") and ColorNear(tag.TextColor3, redTagColor, tolerance) then
				return part
			end
		end
	end

	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") and IsTinyHeadPart(part) then
			return part
		end
	end

	return nil
end

function ResolveEncryptedName(model)
	if not model then return "unknown" end
	if EncryptedNameCache[model] then
		return EncryptedNameCache[model]
	end
	local playersList = GetPlayersListCached()

	local function cacheAndReturn(name)
		EncryptedNameCache[model] = name
		return name
	end

	local candidateIds = {
		model:GetAttribute("UserId"),
		model:GetAttribute("userId"),
		model:GetAttribute("userid"),
		model:GetAttribute("PlayerId"),
		model:GetAttribute("playerId")
	}
	for _, id in ipairs(candidateIds) do
		if typeof(id) == "number" then
			for _, plr in ipairs(playersList) do
				if plr.UserId == id then
					return cacheAndReturn(plr.DisplayName)
				end
			end
		end
	end

	for _, obj in ipairs(model:GetDescendants()) do
		if obj:IsA("StringValue") then
			local lowerName = string.lower(obj.Name)
			if lowerName:find("name") or lowerName:find("player") then
				local txt = tostring(obj.Value)
				for _, plr in ipairs(playersList) do
					if txt == plr.Name or txt == plr.DisplayName then
						return cacheAndReturn(plr.DisplayName)
					end
				end
			end
		elseif obj:IsA("TextLabel") then
			local txt = tostring(obj.Text)
			for _, plr in ipairs(playersList) do
				if txt == plr.Name or txt == plr.DisplayName then
					return cacheAndReturn(plr.DisplayName)
				end
			end
		end
	end

	return cacheAndReturn(model.Name)
end

GetModelHealthValues = function(model)
	local humanoid = model:FindFirstChildOfClass("Humanoid")
	if humanoid then
		return humanoid.Health, humanoid.MaxHealth
	end

	local healthValue = nil
	local maxValue = nil
	for _, obj in ipairs(model:GetDescendants()) do
		local lower = string.lower(obj.Name)
		if (obj:IsA("NumberValue") or obj:IsA("IntValue")) and lower:find("health") then
			if lower:find("max") then
				maxValue = obj.Value
			else
				healthValue = obj.Value
			end
		end
	end

	if healthValue then
		return healthValue, maxValue or 100
	end

	return nil, nil
end

function RemoveESP(player)
	PlayerObjectCache[player] = nil
	CharacterDataCache[player] = nil
	CharacterPartCache[player] = nil

	if _G.ESPDrawings[player] then
		if _G.ESPDrawings[player].Box then
			for _, line in pairs(_G.ESPDrawings[player].Box) do
				pcall(function() line:Remove() end)
			end
		end
		if _G.ESPDrawings[player].BoxFill then
			pcall(function() _G.ESPDrawings[player].BoxFill:Remove() end)
		end
		if _G.ESPDrawings[player].BoxFillTris then
			for _, tri in pairs(_G.ESPDrawings[player].BoxFillTris) do
				pcall(function() tri:Remove() end)
			end
		end

		if _G.ESPDrawings[player].Tracer then
			pcall(function() _G.ESPDrawings[player].Tracer:Remove() end)
		end
		if _G.ESPDrawings[player].TracerSegments then
			for _, seg in ipairs(_G.ESPDrawings[player].TracerSegments) do
				pcall(function() seg:Remove() end)
			end
		end

		if _G.ESPDrawings[player] and _G.ESPDrawings[player].ChamsQuads then
			for partName, quads in pairs(_G.ESPDrawings[player].ChamsQuads) do
				for _, quad in ipairs(quads) do
					pcall(function() quad:Remove() end)
				end
			end
			_G.ESPDrawings[player].ChamsQuads = nil
		end

		if _G.ESPDrawings[player].HealthBar then
			pcall(function() _G.ESPDrawings[player].HealthBar.Outline:Remove() end)
			pcall(function() _G.ESPDrawings[player].HealthBar.Fill:Remove() end)
			pcall(function() _G.ESPDrawings[player].HealthBar.Text:Remove() end)
		end

		if _G.ESPDrawings[player].Info then
			pcall(function() _G.ESPDrawings[player].Info.Name:Remove() end)
			pcall(function() _G.ESPDrawings[player].Info.Distance:Remove() end)
			pcall(function() _G.ESPDrawings[player].Info.Tool:Remove() end)
		end

		if _G.ESPDrawings[player].Skeleton then
			for _, line in pairs(_G.ESPDrawings[player].Skeleton) do
				pcall(function() line:Remove() end)
			end
		end

		if _G.ESPDrawings[player].Avatar then
			pcall(function() _G.ESPDrawings[player].Avatar:Destroy() end)
		end

		if _G.ESPDrawings[player].Highlight then
			pcall(function() _G.ESPDrawings[player].Highlight:Destroy() end)
		end

		_G.ESPDrawings[player] = nil
	end

	if _G.ESPHighlights[player] then
		pcall(function() _G.ESPHighlights[player]:Destroy() end)
		_G.ESPHighlights[player] = nil
	end

	RemoveArrow(player)
end

function LerpColor3(a, b, t)
	return Color3.new(
		a.R + (b.R - a.R) * t,
		a.G + (b.G - a.G) * t,
		a.B + (b.B - a.B) * t
	)
end

function GetESPThemeColor(rootPart, boxPosition, boxSize, fallback)
	if not Config.ESP.GradientEnabled then
		return fallback
	end
	return LerpColor3(Config.ESP.GradientA, Config.ESP.GradientB, 0.5)
end

function GetESPThemeColorAtPoint(localPos, fallback)
	if not Config.ESP.GradientEnabled then
		return fallback
	end
	local rotatingAngle = Config.ESP.GradientAngle
	if Config.ESP.GradientRotateEnabled then
		rotatingAngle = Config.ESP.GradientAngle + (tick() * Config.ESP.GradientRotateSpeed)
	end
	local nx = localPos.X
	local ny = localPos.Y
	local angle = math.rad(rotatingAngle)
	local dir = Vector2.new(math.cos(angle), math.sin(angle))
	local t = ((nx * dir.X + ny * dir.Y) + 0.5) % 1
	return LerpColor3(Config.ESP.GradientA, Config.ESP.GradientB, t)
end

function ScreenToGradientSpace(screenPos)
	local vs = ESPFrameState.ViewportSize or Camera.ViewportSize
	if not vs or vs.X == 0 or vs.Y == 0 then
		return Vector2.new(0, 0)
	end
	return Vector2.new((screenPos.X / vs.X) - 0.5, (screenPos.Y / vs.Y) - 0.5)
end

function GetScaledESPTextSize(baseSize, distanceStuds)
	if not distanceStuds then
		return baseSize
	end
	local scale = math.clamp(140 / math.max(distanceStuds, 40), 0.35, 1)
	return math.max(6, math.floor(baseSize * scale + 0.5))
end

function UpdateBoxes(player, esp, character, humanoid, rootPart, forcedHead)
	local function HideBoxFillTris()
		if esp.BoxFillTris then
			for _, tri in pairs(esp.BoxFillTris) do
				tri.Visible = false
			end
		end
	end

	local head = forcedHead or GetCharacterPart(character, "Head") or GetHighestPart(character, rootPart)
	if not head then
		if esp.Box then
			for _, line in pairs(esp.Box) do
				line.Visible = false
			end
		end
		if esp.BoxFill then
			esp.BoxFill.Visible = false
		end
		HideBoxFillTris()
		return nil, nil
	end

	local headPos, headOnScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
	local rootPos, rootOnScreen = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

	if not (headOnScreen and rootOnScreen) or headPos.Z < 0 or rootPos.Z < 0 then
		if esp.Box then
			for _, line in pairs(esp.Box) do
				line.Visible = false
			end
		end
		if esp.BoxFill then
			esp.BoxFill.Visible = false
		end
		HideBoxFillTris()
		return nil, nil 
	end

	local screenHeight = math.abs(headPos.Y - rootPos.Y)
	local screenWidth = screenHeight * 0.5

	local boxPosition = Vector2.new(
		headPos.X - screenWidth / 2,
		headPos.Y
	)
	local boxSize = Vector2.new(screenWidth, screenHeight)
	local themeColor = GetESPThemeColor(rootPart, boxPosition, boxSize, Config.ESP.Colors.Box)
	local isLocked = false
	if Config.ESP.LockedTargetIndicators then
		if typeof(player) == "Instance" and player:IsA("Model") then
			isLocked = player == nil
		elseif player and player.Character then
			isLocked = player.Character == nil
		end
	end
	if isLocked and Config.ESP.LockedTargetHighlightBox then
		themeColor = Config.ESP.LockedTargetHighlightColor
	end

	local centerColor = GetESPThemeColorAtPoint(Vector2.new(0, 0), themeColor)

	if esp.BoxFill then
		if Config.ESP.BoxESP and Config.ESP.BoxFilled then
			if Config.ESP.GradientEnabled then
				local minSide = math.min(boxSize.X, boxSize.Y)
				local gridDim = math.clamp(math.floor(minSide / 12), 6, 24)
				if not esp.BoxFillTris then
					esp.BoxFillTris = {}
				end
				local fillIdx = 0
				for gy = 0, gridDim - 1 do
					for gx = 0, gridDim - 1 do
						fillIdx = fillIdx + 1
						local tri = esp.BoxFillTris[fillIdx]
						if not tri then
							tri = Drawing.new("Triangle")
							esp.BoxFillTris[fillIdx] = tri
						end

						local x0 = boxPosition.X + (boxSize.X / gridDim) * gx
						local x1 = boxPosition.X + (boxSize.X / gridDim) * (gx + 1)
						local y0 = boxPosition.Y + (boxSize.Y / gridDim) * gy
						local y1 = boxPosition.Y + (boxSize.Y / gridDim) * (gy + 1)

						local p0 = Vector2.new(x0, y0)
						local p1 = Vector2.new(x1, y0)
						local p2 = Vector2.new(x0, y1)

						local cellCenter = Vector2.new((x0 + x1) / 2, (y0 + y1) / 2)
						local color = GetESPThemeColorAtPoint(ScreenToGradientSpace(cellCenter), themeColor)

						tri.PointA = p0
						tri.PointB = p1
						tri.PointC = p2
						tri.Color = color
						tri.Transparency = Config.ESP.BoxFillTransparency
						tri.Filled = true
						tri.Visible = true

						fillIdx = fillIdx + 1
						local tri2 = esp.BoxFillTris[fillIdx]
						if not tri2 then
							tri2 = Drawing.new("Triangle")
							esp.BoxFillTris[fillIdx] = tri2
						end

						local p3 = Vector2.new(x1, y0)
						local p4 = Vector2.new(x1, y1)
						local p5 = Vector2.new(x0, y1)

						tri2.PointA = p3
						tri2.PointB = p4
						tri2.PointC = p5
						tri2.Color = color
						tri2.Transparency = Config.ESP.BoxFillTransparency
						tri2.Filled = true
						tri2.Visible = true
					end
				end
				for i = fillIdx + 1, #esp.BoxFillTris do
					esp.BoxFillTris[i].Visible = false
				end
				esp.BoxFill.Visible = false
			else
				HideBoxFillTris()
				esp.BoxFill.Position = boxPosition
				esp.BoxFill.Size = boxSize
				esp.BoxFill.Color = centerColor
				esp.BoxFill.Filled = true
				esp.BoxFill.Transparency = Config.ESP.BoxFillTransparency
				esp.BoxFill.Visible = true
			end
		else
			esp.BoxFill.Visible = false
			HideBoxFillTris()
		end
	end

	if Config.ESP.BoxESP and esp.Box then
		if Config.ESP.GradientEnabled then
			for _, line in pairs(esp.Box) do
				line.Visible = false
			end

			local function draw_gradient_edge(fromPos, toPos, fromT, toT, edgeName)
				local segments = 12
				local edgeLines = {}
				for seg = 1, segments do
					local t0 = (seg - 1) / segments
					local t1 = seg / segments
					local p0 = fromPos:Lerp(toPos, t0)
					local p1 = fromPos:Lerp(toPos, t1)
					local midT = fromT + (toT - fromT) * (t0 + t1) / 2
					local gradPos = Vector2.new(math.cos(math.rad(midT)) * 0.5, math.sin(math.rad(midT)) * 0.5)
					local color = GetESPThemeColorAtPoint(gradPos, themeColor)

					local lineKey = edgeName .. "_" .. tostring(seg)
					local lineObj = esp.Box[lineKey]
					if not lineObj then
						lineObj = Drawing.new("Line")
						esp.Box[lineKey] = lineObj
					end
					table.insert(edgeLines, lineObj)
					lineObj.From = p0
					lineObj.To = p1
					lineObj.Color = color
					lineObj.Thickness = Config.ESP.BoxThickness
					lineObj.Transparency = 1
					lineObj.Visible = true
				end
				return edgeLines
			end

			if Config.ESP.BoxStyle == "Corner" then
				local cornerSize = screenWidth * 0.25
				draw_gradient_edge(boxPosition, boxPosition + Vector2.new(0, cornerSize), 225, 270, "TL_V")
				draw_gradient_edge(boxPosition, boxPosition + Vector2.new(cornerSize, 0), 270, 315, "TL_H")
				draw_gradient_edge(boxPosition + Vector2.new(boxSize.X, 0), boxPosition + Vector2.new(boxSize.X, cornerSize), 315, 0, "TR_V")
				draw_gradient_edge(boxPosition + Vector2.new(boxSize.X - cornerSize, 0), boxPosition + Vector2.new(boxSize.X, 0), 0, 45, "TR_H")
				draw_gradient_edge(boxPosition + Vector2.new(boxSize.X, boxSize.Y - cornerSize), boxPosition + Vector2.new(boxSize.X, boxSize.Y), 45, 90, "BR_V")
				draw_gradient_edge(boxPosition + Vector2.new(boxSize.X - cornerSize, boxSize.Y), boxPosition + Vector2.new(boxSize.X, boxSize.Y), 45, 90, "BR_H")
				draw_gradient_edge(boxPosition + Vector2.new(0, boxSize.Y - cornerSize), boxPosition + Vector2.new(0, boxSize.Y), 90, 135, "BL_V")
				draw_gradient_edge(boxPosition + Vector2.new(0, boxSize.Y), boxPosition + Vector2.new(cornerSize, boxSize.Y), 135, 180, "BL_H")
			else
				draw_gradient_edge(boxPosition, boxPosition + Vector2.new(0, boxSize.Y), 180, 360, "Left")
				draw_gradient_edge(boxPosition + Vector2.new(boxSize.X, 0), boxPosition + Vector2.new(boxSize.X, boxSize.Y), 0, 180, "Right")
				draw_gradient_edge(boxPosition, boxPosition + Vector2.new(boxSize.X, 0), 270, 360, "Top")
				draw_gradient_edge(boxPosition + Vector2.new(0, boxSize.Y), boxPosition + Vector2.new(boxSize.X, boxSize.Y), 0, 90, "Bottom")
			end
		else
			local leftColor = GetESPThemeColorAtPoint(Vector2.new(-0.5, 0), themeColor)
			local rightColor = GetESPThemeColorAtPoint(Vector2.new(0.5, 0), themeColor)
			local topColor = GetESPThemeColorAtPoint(Vector2.new(0, -0.5), themeColor)
			local bottomColor = GetESPThemeColorAtPoint(Vector2.new(0, 0.5), themeColor)

			if Config.ESP.BoxStyle == "Corner" then
				local cornerSize = screenWidth * 0.25

				esp.Box.TopLeft.From = boxPosition
				esp.Box.TopLeft.To = boxPosition + Vector2.new(0, cornerSize)
				esp.Box.TopLeft.Color = leftColor
				esp.Box.TopLeft.Thickness = Config.ESP.BoxThickness
				esp.Box.TopLeft.Visible = true

				esp.Box.TopRight.From = boxPosition + Vector2.new(boxSize.X, 0)
				esp.Box.TopRight.To = boxPosition + Vector2.new(boxSize.X, cornerSize)
				esp.Box.TopRight.Color = rightColor
				esp.Box.TopRight.Thickness = Config.ESP.BoxThickness
				esp.Box.TopRight.Visible = true

				esp.Box.BottomLeft.From = boxPosition + Vector2.new(0, boxSize.Y)
				esp.Box.BottomLeft.To = boxPosition + Vector2.new(0, boxSize.Y - cornerSize)
				esp.Box.BottomLeft.Color = leftColor
				esp.Box.BottomLeft.Thickness = Config.ESP.BoxThickness
				esp.Box.BottomLeft.Visible = true

				esp.Box.BottomRight.From = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
				esp.Box.BottomRight.To = boxPosition + Vector2.new(boxSize.X, boxSize.Y - cornerSize)
				esp.Box.BottomRight.Color = rightColor
				esp.Box.BottomRight.Thickness = Config.ESP.BoxThickness
				esp.Box.BottomRight.Visible = true

				esp.Box.Top.From = boxPosition
				esp.Box.Top.To = boxPosition + Vector2.new(cornerSize, 0)
				esp.Box.Top.Color = topColor
				esp.Box.Top.Thickness = Config.ESP.BoxThickness
				esp.Box.Top.Visible = true

				esp.Box.Bottom.From = boxPosition + Vector2.new(0, boxSize.Y)
				esp.Box.Bottom.To = boxPosition + Vector2.new(cornerSize, boxSize.Y)
				esp.Box.Bottom.Color = bottomColor
				esp.Box.Bottom.Thickness = Config.ESP.BoxThickness
				esp.Box.Bottom.Visible = true

				esp.Box.Left.From = boxPosition + Vector2.new(boxSize.X - cornerSize, 0)
				esp.Box.Left.To = boxPosition + Vector2.new(boxSize.X, 0)
				esp.Box.Left.Color = topColor
				esp.Box.Left.Thickness = Config.ESP.BoxThickness
				esp.Box.Left.Visible = true

				esp.Box.Right.From = boxPosition + Vector2.new(boxSize.X - cornerSize, boxSize.Y)
				esp.Box.Right.To = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
				esp.Box.Right.Color = bottomColor
				esp.Box.Right.Thickness = Config.ESP.BoxThickness
				esp.Box.Right.Visible = true
			else
				for _, line in pairs(esp.Box) do
					line.Visible = false
				end

				esp.Box.Left.From = boxPosition
				esp.Box.Left.To = boxPosition + Vector2.new(0, boxSize.Y)
				esp.Box.Left.Color = leftColor
				esp.Box.Left.Thickness = Config.ESP.BoxThickness
				esp.Box.Left.Visible = true

				esp.Box.Right.From = boxPosition + Vector2.new(boxSize.X, 0)
				esp.Box.Right.To = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
				esp.Box.Right.Color = rightColor
				esp.Box.Right.Thickness = Config.ESP.BoxThickness
				esp.Box.Right.Visible = true

				esp.Box.Top.From = boxPosition
				esp.Box.Top.To = boxPosition + Vector2.new(boxSize.X, 0)
				esp.Box.Top.Color = topColor
				esp.Box.Top.Thickness = Config.ESP.BoxThickness
				esp.Box.Top.Visible = true

				esp.Box.Bottom.From = boxPosition + Vector2.new(0, boxSize.Y)
				esp.Box.Bottom.To = boxPosition + Vector2.new(boxSize.X, boxSize.Y)
				esp.Box.Bottom.Color = bottomColor
				esp.Box.Bottom.Thickness = Config.ESP.BoxThickness
				esp.Box.Bottom.Visible = true

				esp.Box.TopLeft.Visible = false
				esp.Box.TopRight.Visible = false
				esp.Box.BottomLeft.Visible = false
				esp.Box.BottomRight.Visible = false
			end
		end
	else
		if esp.Box then
			for _, line in pairs(esp.Box) do
				line.Visible = false
			end
		end
		if esp.BoxFill then
			esp.BoxFill.Visible = false
		end
		HideBoxFillTris()
	end
	return boxPosition, boxSize
end

function UpdateTracers(player, esp, rootPart, tracerOrigin)
	if not Config.ESP.TracerESP or not esp.Tracer then
		if esp.Tracer then
			esp.Tracer.Visible = false
		end
		if esp.TracerSegments then
			for _, seg in ipairs(esp.TracerSegments) do
				seg.Visible = false
			end
		end
		return
	end

	local pos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
	if not onScreen or pos.Z < 0 then
		esp.Tracer.Visible = false
		if esp.TracerSegments then
			for _, seg in ipairs(esp.TracerSegments) do
				seg.Visible = false
			end
		end
		return
	end

	local tracerOriginValue = tracerOrigin or CachedTracerOrigin or GetTracerOrigin()
	local toPos = Vector2.new(pos.X, pos.Y)
	if Config.ESP.GradientEnabled then
		esp.Tracer.Visible = false
		if not esp.TracerSegments then
			esp.TracerSegments = {}
		end
		local segments = 12
		for i = 1, segments do
			local t0 = (i - 1) / segments
			local t1 = i / segments
			local p0 = tracerOriginValue:Lerp(toPos, t0)
			local p1 = tracerOriginValue:Lerp(toPos, t1)
			local mid = (p0 + p1) / 2
			local tracerColor = GetESPThemeColorAtPoint(ScreenToGradientSpace(mid), Config.ESP.Colors.Tracer)
			local seg = esp.TracerSegments[i]
			if not seg then
				seg = Drawing.new("Line")
				esp.TracerSegments[i] = seg
			end
			seg.From = p0
			seg.To = p1
			seg.Color = tracerColor
			seg.Thickness = Config.ESP.TracerThickness
			seg.Transparency = 1
			seg.Visible = true
		end
		for i = segments + 1, #esp.TracerSegments do
			esp.TracerSegments[i].Visible = false
		end
	else
		if esp.TracerSegments then
			for _, seg in ipairs(esp.TracerSegments) do
				seg.Visible = false
			end
		end
		local tracerColor = GetESPThemeColor(rootPart, nil, nil, Config.ESP.Colors.Tracer)
		esp.Tracer.From = tracerOriginValue
		esp.Tracer.To = toPos
		esp.Tracer.Color = tracerColor
		esp.Tracer.Thickness = Config.ESP.TracerThickness
		esp.Tracer.Visible = true
	end
end

ResolveESPFont = nil

local getMousePos = function()
	local success, pos = pcall(function()
		return UserInputService:GetMouseLocation()
	end)

	if success and pos then
		return Vector2.new(pos.X, pos.Y)
	else
		return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
	end
end

function UpdateHealthBars(player, esp, character, humanoid, boxPosition, boxSize, screenHeight, rootPart, cameraPos)
	if not Config.ESP.HealthESP or not esp.HealthBar then
		if esp.HealthBar then
			esp.HealthBar.Outline.Visible = false
			esp.HealthBar.Fill.Visible = false
			esp.HealthBar.Text.Visible = false
		end
		return
	end

	local health = humanoid.Health
	local maxHealth = humanoid.MaxHealth
	local healthPercent = math.clamp(health / maxHealth, 0, 1)
	local themeColor = GetESPThemeColor(nil, boxPosition, boxSize, Config.ESP.Colors.Health)
	local distanceStuds
	if rootPart then
		local camPos = cameraPos or ESPFrameState.CameraPos or Camera.CFrame.Position
		distanceStuds = (rootPart.Position - camPos).Magnitude
	end

	local barHeight = screenHeight * 0.9
	local barWidth = 4
	local barPos = Vector2.new(
		boxPosition.X - barWidth - 4,
		boxPosition.Y + (screenHeight - barHeight) / 2
	)

	esp.HealthBar.Outline.Size = Vector2.new(barWidth + 2, barHeight + 2)
	esp.HealthBar.Outline.Position = barPos - Vector2.new(1, 1)
	esp.HealthBar.Outline.Color = Color3.fromRGB(0, 0, 0)
	esp.HealthBar.Outline.Filled = true
	esp.HealthBar.Outline.Visible = true

	local fillHeight = barHeight * healthPercent
	esp.HealthBar.Fill.Size = Vector2.new(barWidth, fillHeight)
	esp.HealthBar.Fill.Position = Vector2.new(barPos.X, barPos.Y + barHeight - fillHeight)
	esp.HealthBar.Fill.Color = Config.ESP.GradientEnabled and themeColor or GetHealthColor(health, maxHealth)
	esp.HealthBar.Fill.Filled = true
	esp.HealthBar.Fill.Visible = true

	if Config.ESP.HealthStyle == "Both" or Config.ESP.HealthStyle == "Text" then
		esp.HealthBar.Text.Text = math.floor(health) .. (Config.ESP.HealthTextSuffix or "")
		esp.HealthBar.Text.Position = Vector2.new(barPos.X - 15, barPos.Y + barHeight / 2)
		esp.HealthBar.Text.Color = themeColor
		esp.HealthBar.Text.Size = GetScaledESPTextSize(Config.ESP.TextSize, distanceStuds)
		esp.HealthBar.Text.Font = ResolveESPFont and ResolveESPFont(Config.ESP.TextFont) or 2
		esp.HealthBar.Text.Visible = true
	else
		esp.HealthBar.Text.Visible = false
	end
end

ESPFontChoices = {
	["UI"] = 0,
	["System"] = 1,
	["Plex"] = 2,
	["Monospace"] = 3,
	["Code"] = 3,
	["Roboto"] = 1,
	["Gotham"] = 1,
	["Arial"] = 0,
	["Verdana"] = 1,
}

ResolveESPFont = function(fontValue)
	if type(fontValue) == "number" then
		return math.clamp(fontValue, 0, 3)
	end
	return ESPFontChoices[fontValue] or 2
end

function GetCharacterToolName(character)
	if not character then return nil end

	if typeof(character) == "Instance" then
		local tool = character:FindFirstChildOfClass("Tool")
		if tool and tool.Name and tool.Name ~= "" then
			return tool.Name
		end
	elseif type(character) == "table" then
		local tool = rawget(character, "Tool") or rawget(character, "tool") or rawget(character, "Weapon") or rawget(character, "weapon")
		if typeof(tool) == "Instance" and tool.Name and tool.Name ~= "" then
			return tool.Name
		elseif type(tool) == "string" and tool ~= "" then
			return tool
		end

		local model = GetCharacterModelFromAny(character)
		if model then
			local instanceTool = model:FindFirstChildOfClass("Tool")
			if instanceTool and instanceTool.Name and instanceTool.Name ~= "" then
				return instanceTool.Name
			end
		end
	end

	return nil
end

function getClosestPointOnPart(part)

	if not part then return part.Position end
	local mousePos = getMousePos()
	local ray = Camera:ViewportPointToRay(mousePos.X, mousePos.Y)

	local rayOrigin = ray.Origin
	local rayDirection = ray.Direction.Unit
	local partPosition = part.Position
	local relativePos = partPosition - rayOrigin
	local projection = relativePos:Dot(rayDirection)
	local closestPointOnRay = rayOrigin + (rayDirection * projection)

	local localPoint = part.CFrame:PointToObjectSpace(closestPointOnRay)
	local size = part.Size / 2
	local clampedPoint = Vector3.new(
		math.clamp(localPoint.X, -size.X, size.X),
		math.clamp(localPoint.Y, -size.Y, size.Y),
		math.clamp(localPoint.Z, -size.Z, size.Z)
	)

	return part.CFrame * clampedPoint
end

function UpdateNames(player, esp, character, rootPart, boxPosition, boxSize, cameraPos, isLocked)
	if not esp.Info then return end
	local camPos = cameraPos or ESPFrameState.CameraPos or Camera.CFrame.Position
	local font = ResolveESPFont(Config.ESP.TextFont)
	local distanceStuds = (rootPart.Position - camPos).Magnitude
	local textSize = GetScaledESPTextSize(Config.ESP.TextSize, distanceStuds)
	local themeColor = GetESPThemeColor(rootPart, boxPosition, boxSize, Config.ESP.Colors.Text)
	local centerX = boxPosition.X + boxSize.X / 2
	local bottomY = boxPosition.Y + boxSize.Y
	local lineHeight = textSize + 2
	local offset = 0

	if Config.ESP.NameESP and esp.Info.Name then
		local nameText = Config.ESP.NameMode == "UserName" and player.Name or player.DisplayName
		if isLocked then
			nameText = "[LOCKED] " .. nameText
		end
		esp.Info.Name.Text = nameText
		esp.Info.Name.Position = Vector2.new(
			centerX,
			boxPosition.Y - (textSize + 4)
		)
		esp.Info.Name.Color = Config.ESP.GradientEnabled
			and GetESPThemeColorAtPoint(ScreenToGradientSpace(esp.Info.Name.Position), Config.ESP.Colors.Text)
			or themeColor
		esp.Info.Name.Size = textSize
		esp.Info.Name.Font = font
		esp.Info.Name.Visible = true
	elseif esp.Info.Name then
		esp.Info.Name.Visible = false
	end

	if Config.ESP.ShowDistance and esp.Info.Distance then
		local dist = distanceStuds
		local unit = Config.ESP.DistanceUnit or "studs"
		if unit == "m" then
			dist = dist * 0.28
		end
		esp.Info.Distance.Text = string.format("[%d %s]", math.floor(dist), unit)
		esp.Info.Distance.Position = Vector2.new(centerX, bottomY + 3 + offset)
		esp.Info.Distance.Color = Config.ESP.GradientEnabled
			and GetESPThemeColorAtPoint(ScreenToGradientSpace(esp.Info.Distance.Position), Config.ESP.Colors.Text)
			or Config.ESP.Colors.Text
		esp.Info.Distance.Size = textSize
		esp.Info.Distance.Font = font
		esp.Info.Distance.Visible = true
		offset = offset + lineHeight
	elseif esp.Info.Distance then
		esp.Info.Distance.Visible = false
	end

	if Config.ESP.ToolESP and esp.Info.Tool then
		local toolName = GetCharacterToolName(character)
		if toolName then
			esp.Info.Tool.Text = "[" .. toolName .. "]"
			esp.Info.Tool.Position = Vector2.new(centerX, bottomY + 3 + offset)
			esp.Info.Tool.Color = Config.ESP.GradientEnabled
				and GetESPThemeColorAtPoint(ScreenToGradientSpace(esp.Info.Tool.Position), Config.ESP.Colors.Text)
				or themeColor
			esp.Info.Tool.Size = textSize
			esp.Info.Tool.Font = font
			esp.Info.Tool.Visible = true
		else
			esp.Info.Tool.Visible = false
		end
	elseif esp.Info.Tool then
		esp.Info.Tool.Visible = false
	end
end

function UpdateSkeleton(player, esp, character, rootPart)
	if not Config.ESP.SkeletonESP or not esp.Skeleton then
		esp._lastSkeletonUpdate = nil
		if esp.Skeleton then
			for _, line in pairs(esp.Skeleton) do
				line.Visible = false
			end
		end
		return
	end

	local now = tick()
	if esp._lastSkeletonUpdate and (now - esp._lastSkeletonUpdate) < SKELETON_UPDATE_INTERVAL then
		return
	end
	esp._lastSkeletonUpdate = now

	local skeletonData = RefreshCharacterSkeletonCache(character)
	if not skeletonData then return end
	local skeletonFallback = Config.ESP.Colors.Skeleton

	if skeletonData.GenericPairs then
		for i = 1, #esp.Skeleton do
			local line = esp.Skeleton[i]
			local pair = skeletonData.GenericPairs[i]
			if pair and pair[1] and pair[2] then
				local fromPos, fromOnScreen = Camera:WorldToViewportPoint(pair[1].Position)
				local toPos, toOnScreen = Camera:WorldToViewportPoint(pair[2].Position)
				if fromOnScreen and toOnScreen and fromPos.Z > 0 and toPos.Z > 0 then
					line.From = Vector2.new(fromPos.X, fromPos.Y)
					line.To = Vector2.new(toPos.X, toPos.Y)
					local mid = (line.From + line.To) / 2
					line.Color = Config.ESP.GradientEnabled
						and GetESPThemeColorAtPoint(ScreenToGradientSpace(mid), skeletonFallback)
						or skeletonFallback
					line.Thickness = Config.ESP.SkeletonThickness
					line.Transparency = Config.ESP.SkeletonTransparency
					line.Visible = true
				else
					line.Visible = false
				end
			else
				line.Visible = false
			end
		end
		return
	end

	local bones = skeletonData.Bones
	for i, keys in ipairs(SKELETON_CONNECTION_KEYS) do
		local from, to = bones[keys[1]], bones[keys[2]]
		local line = esp.Skeleton[i]

		if from and to and line and IsPartInCharacter(from, character) and IsPartInCharacter(to, character) then
			local fromPos, fromOnScreen = Camera:WorldToViewportPoint(from.Position)
			local toPos, toOnScreen = Camera:WorldToViewportPoint(to.Position)

			if fromOnScreen and toOnScreen and fromPos.Z > 0 and toPos.Z > 0 then
				line.From = Vector2.new(fromPos.X, fromPos.Y)
				line.To = Vector2.new(toPos.X, toPos.Y)
				local mid = (line.From + line.To) / 2
				line.Color = Config.ESP.GradientEnabled
					and GetESPThemeColorAtPoint(ScreenToGradientSpace(mid), skeletonFallback)
					or skeletonFallback
				line.Thickness = Config.ESP.SkeletonThickness
				line.Transparency = Config.ESP.SkeletonTransparency
				line.Visible = true
			else
				line.Visible = false
			end
		elseif line then
			line.Visible = false
		end
	end
end

function UpdateChams(player, character, rootPart, cameraPos, isLocked)
	if not Config.ESP.ChamsEnabled then
		local esp = _G.ESPDrawings[player]
		if esp then
			esp._lastChamsUpdate = nil
			if esp.ChamsQuads then
				for _, quads in pairs(esp.ChamsQuads) do
					for _, quad in ipairs(quads) do
						quad.Visible = false
					end
				end
			end
		end
		return
	end

	if player == LocalPlayer or not character then
		return
	end

	local core = RefreshCharacterCoreCache(character)
	local humanoid = core and core.Humanoid
	if humanoid and humanoid.Health <= 0 then
		local esp = _G.ESPDrawings[player]
		if esp and esp.ChamsQuads then
			for _, quads in pairs(esp.ChamsQuads) do
				for _, quad in ipairs(quads) do
					quad.Visible = false
				end
			end
		end
		return
	end

	local esp = _G.ESPDrawings[player]
	if not esp then
		esp = {}
		_G.ESPDrawings[player] = esp
	end
	local quadsForPlayer = esp.ChamsQuads
	if not quadsForPlayer then
		quadsForPlayer = {}
		esp.ChamsQuads = quadsForPlayer
	end
	local now = tick()
	if esp._lastChamsUpdate and now - esp._lastChamsUpdate < CHAMS_UPDATE_INTERVAL then
		return
	end
	esp._lastChamsUpdate = now
	local fillColor = Config.ESP.Colors.Chams
	local transparency = Config.ESP.ChamsTransparency
	local rootPartValue = rootPart or (core and core.RootPart)
	local camPos = cameraPos or ESPFrameState.CameraPos or Camera.CFrame.Position
	if rootPartValue then
		fillColor = GetESPThemeColor(rootPartValue, nil, nil, Config.ESP.Colors.Chams)
		if Config.ESP.MaxDistanceCheck then
			local dist = (rootPartValue.Position - camPos).Magnitude
			if dist > Config.ESP.MaxDistance then
				for _, quads in pairs(quadsForPlayer) do
					for _, quad in ipairs(quads) do
						quad.Visible = false
					end
				end
				return
			end
		end
	end

	local ViewportSize = ESPFrameState.ViewportSize or Camera.ViewportSize
	local chamsEntries = RefreshCharacterChamsPartCache(character)
	local corners = table.create(8)
	local points = table.create(8)

	for _, entry in ipairs(chamsEntries) do
		local partKey = entry.key
		local part = entry.part
		if part and part:IsA("BasePart") and part:IsDescendantOf(character) then
			if not quadsForPlayer[partKey] then
				local newQuads = {}
				for i = 1, 6 do
					newQuads[i] = NewQuad(fillColor)
				end
				quadsForPlayer[partKey] = newQuads
			end
			local quads = quadsForPlayer[partKey]
			local sz = part.Size
			local cf = part.CFrame
			local hx, hy, hz = sz.X * 0.5, sz.Y * 0.5, sz.Z * 0.5
			corners[1] = cf * Vector3.new(-hx,  hy, -hz)
			corners[2] = cf * Vector3.new(-hx,  hy,  hz)
			corners[3] = cf * Vector3.new( hx,  hy,  hz)
			corners[4] = cf * Vector3.new( hx,  hy, -hz)
			corners[5] = cf * Vector3.new(-hx, -hy, -hz)
			corners[6] = cf * Vector3.new(-hx, -hy,  hz)
			corners[7] = cf * Vector3.new( hx, -hy,  hz)
			corners[8] = cf * Vector3.new( hx, -hy, -hz)

			local anyVisible, allBehind = false, true
			for i = 1, 8 do
				local pos = Camera:WorldToViewportPoint(corners[i])
				points[i] = Vector2.new(pos.X, pos.Y)
				if pos.Z > 0 then
					allBehind = false
					if pos.X >= 0 and pos.X <= ViewportSize.X and pos.Y >= 0 and pos.Y <= ViewportSize.Y then
						anyVisible = true
					end
				end
			end

			if not allBehind and anyVisible then
				local partColor = fillColor
				if Config.ESP.GradientEnabled then
					local screenPos = Camera:WorldToViewportPoint(part.Position)
					if screenPos.Z > 0 then
						partColor = GetESPThemeColorAtPoint(
							ScreenToGradientSpace(Vector2.new(screenPos.X, screenPos.Y)),
							fillColor
						)
					end
				end
				for idx, face in ipairs(CHAMS_FACES) do
					local quad = quads[idx]
					quad.PointA = points[face[1]]
					quad.PointB = points[face[2]]
					quad.PointC = points[face[3]]
					quad.PointD = points[face[4]]
					quad.Color = partColor
					quad.Transparency = transparency
					quad.Visible = true
				end
			else
				for i = 1, 6 do
					quads[i].Visible = false
				end
			end
		end
	end

	for key, quads in pairs(quadsForPlayer) do
		local keep = false

		if typeof(key) == "Instance" then
			keep = key.Parent ~= nil and IsPartInCharacter(key, character)
		elseif type(key) == "string" then
			keep = GetCharacterPart(character, key) ~= nil
		end

		if not keep then
			for _, q in ipairs(quads) do q.Visible = false end
		end
	end
end

function UpdateESP(player)
	if not Config.ESP.Enabled then
		if _G.ESPDrawings[player] then
			HideESPDrawings(_G.ESPDrawings[player])
		end
		return
	end

	local esp = _G.ESPDrawings[player]
	if not esp then return end

	local function HideAllESP() HideESPDrawings(esp) end
	local character = GetPlayerCharacter(player)

	if player == LocalPlayer or not character then
		HideAllESP()
		return
	end

	if Config.ESP.TeamCheck and not IsPlayerEnemy(player) then
		HideAllESP()
		return
	end
	local core = RefreshCharacterCoreCache(character)
	local humanoid = core and core.Humanoid
	local rootPart = core and core.RootPart
	local cameraPos = ESPFrameState.CameraPos or Camera.CFrame.Position
	local isLocked = Config.ESP.LockedTargetIndicators

	if not (humanoid and rootPart and humanoid.Health > 0) then 
		HideAllESP()
		return 
	end

	local distance = (rootPart.Position - cameraPos).Magnitude

	if Config.ESP.MaxDistanceCheck and distance > Config.ESP.MaxDistance then 
		HideAllESP()
		return 
	end

	local needsBoxProjection = Config.ESP.BoxESP
		or Config.ESP.HealthESP
		or Config.ESP.NameESP
		or Config.ESP.ShowDistance
		or Config.ESP.ToolESP
	local boxPosition, boxSize, screenHeight

	if needsBoxProjection then
		local headPart = core and core.HeadPart
		boxPosition, boxSize = UpdateBoxes(player, esp, character, humanoid, rootPart, headPart)
		if not boxPosition or not boxSize then
			HideAllESP()
			return
		end
		screenHeight = boxSize.Y
	else
		if esp.Box then
			for _, line in pairs(esp.Box) do
				line.Visible = false
			end
		end
		if esp.BoxFill then
			esp.BoxFill.Visible = false
		end
	end

	esp._hidden = false

	UpdateTracers(player, esp, rootPart, CachedTracerOrigin)
	if needsBoxProjection then
		UpdateHealthBars(player, esp, character, humanoid, boxPosition, boxSize, screenHeight, rootPart, cameraPos)
		UpdateNames(player, esp, character, rootPart, boxPosition, boxSize, cameraPos, isLocked)
	end

	UpdateSkeleton(player, esp, character, rootPart)
	UpdateChams(player, character, rootPart, cameraPos, isLocked)

	local headPart = core and core.HeadPart
	if isLocked then
		if Config.ESP.LockedTargetAvatar and headPart then
			if not esp.Avatar then
				esp.Avatar = Instance.new("BillboardGui")
				esp.Avatar.Parent = headPart
				esp.Avatar.Adornee = headPart
				esp.Avatar.Size = UDim2.new(0, Config.ESP.LockedTargetAvatarSize, 0, Config.ESP.LockedTargetAvatarSize)
				esp.Avatar.StudsOffset = Vector3.new(0, 2, 0)
				esp.Avatar.AlwaysOnTop = true
				local image = Instance.new("ImageLabel")
				image.Parent = esp.Avatar
				image.Size = UDim2.new(1, 0, 1, 0)
				image.BackgroundTransparency = 1
				image.Image = ""
				local corner = Instance.new("UICorner")
				corner.CornerRadius = UDim.new(0.5, 0)
				corner.Parent = image
				task.spawn(function()
					local success, thumb = pcall(function()
						return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
					end)
					if success then
						image.Image = thumb
					end
				end)
			end
			esp.Avatar.Size = UDim2.new(0, Config.ESP.LockedTargetAvatarSize, 0, Config.ESP.LockedTargetAvatarSize)
			esp.Avatar.Enabled = true
		else
			if esp.Avatar then
				esp.Avatar.Enabled = false
			end
		end

		if Config.ESP.LockedTargetGlow then
			if not esp.Highlight then
				esp.Highlight = Instance.new("Highlight")
				esp.Highlight.Parent = character
				esp.Highlight.FillColor = Config.ESP.LockedTargetGlowColor
				esp.Highlight.OutlineColor = Config.ESP.LockedTargetGlowColor
				esp.Highlight.FillTransparency = Config.ESP.LockedTargetGlowTransparency
				esp.Highlight.OutlineTransparency = 0
			end
			esp.Highlight.Enabled = true
		else
			if esp.Highlight then
				esp.Highlight.Enabled = false
			end
		end
	else
		if esp.Avatar then
			esp.Avatar.Enabled = false
		end
		if esp.Highlight then
			esp.Highlight.Enabled = false
		end
	end
end

function UpdateEncryptedModelESP(model)
	if not Config.ESP.Enabled then return end
	if not model or not model.Parent then return end

	EnsureESPKey(model)
	local esp = _G.ESPDrawings[model]
	if not esp then return end
	if model:FindFirstAncestorOfClass("Tool") then
		HideESPDrawings(esp)
		return
	end

	local humanoid = model:FindFirstChildOfClass("Humanoid")
	local tinyHead = GetEncryptedHeadPart and GetEncryptedHeadPart(model)
	if not humanoid and not tinyHead then
		HideESPDrawings(esp)
		return
	end
	local rootPart = GetBestBasePart(model, "HumanoidRootPart")
	if not rootPart then
		HideESPDrawings(esp)
		return
	end

	if humanoid and humanoid.Health <= 0 then
		HideESPDrawings(esp)
		return
	end

	local cameraPos = ESPFrameState.CameraPos or Camera.CFrame.Position
	local distance = (rootPart.Position - cameraPos).Magnitude
	if Config.ESP.MaxDistanceCheck and distance > Config.ESP.MaxDistance then
		HideESPDrawings(esp)
		return
	end

	local hp, maxHp = GetModelHealthValues(model)
	local dummyHumanoid = humanoid or (hp and {Health = hp, MaxHealth = maxHp}) or {Health = 100, MaxHealth = 100}
	local needsBoxProjection = Config.ESP.BoxESP
		or Config.ESP.HealthESP
		or Config.ESP.NameESP
		or Config.ESP.ShowDistance
		or Config.ESP.ToolESP
	local boxPosition, boxSize

	if needsBoxProjection then
		local headPart = model:FindFirstChild("Head", true) or tinyHead or GetHighestPart(model, rootPart)
		boxPosition, boxSize = UpdateBoxes(model, esp, model, dummyHumanoid, rootPart, headPart)
		if not boxPosition or not boxSize then
			HideESPDrawings(esp)
			return
		end
	else
		if esp.Box then
			for _, line in pairs(esp.Box) do
				line.Visible = false
			end
		end
		if esp.BoxFill then
			esp.BoxFill.Visible = false
		end
	end

	esp._hidden = false

	UpdateTracers(model, esp, rootPart, CachedTracerOrigin)
	if needsBoxProjection then
		if humanoid then
			UpdateHealthBars(model, esp, model, humanoid, boxPosition, boxSize, boxSize.Y, rootPart, cameraPos)
		elseif hp then
			UpdateHealthBars(model, esp, model, {Health = hp, MaxHealth = maxHp}, boxPosition, boxSize, boxSize.Y, rootPart, cameraPos)
		elseif esp.HealthBar then
			esp.HealthBar.Outline.Visible = false
			esp.HealthBar.Fill.Visible = false
			esp.HealthBar.Text.Visible = false
		end

		local resolvedName = ResolveEncryptedName(model)
		local pseudoPlayer = {Name = resolvedName, DisplayName = resolvedName}
		UpdateNames(pseudoPlayer, esp, model, rootPart, boxPosition, boxSize, cameraPos, false)
	elseif esp.HealthBar then
		esp.HealthBar.Outline.Visible = false
		esp.HealthBar.Fill.Visible = false
		esp.HealthBar.Text.Visible = false
	end
	UpdateSkeleton(model, esp, model, rootPart)
	UpdateChams(model, model, rootPart, cameraPos, false)
end

function UpdateEncryptedTargets()
	local models = GetEncryptedEnemyModelsCached(Config.ESP.TeamCheck)
	local seenModels = {}

	for _, model in ipairs(models) do
		seenModels[model] = true
		UpdateEncryptedModelESP(model)
	end

	if Config.ESP.TargetNPCs then
		for _, model in ipairs(GetNpcModelsCached()) do
			if model and model.Parent then
				seenModels[model] = true
				UpdateEncryptedModelESP(model)
			end
		end
	end

	for key, esp in pairs(_G.ESPDrawings) do
		if typeof(key) == "Instance" and key:IsA("Model") then
			if not key.Parent or not seenModels[key] then
				HideESPDrawings(esp)
			end
		end
	end
end

function CleanupRadar()
	if not _G.ESPRadarComponents then return end

	local radar = _G.ESPRadarComponents
	if radar.PlayerDots then
		for key, dot in pairs(radar.PlayerDots) do
			if dot and dot.Remove then
				pcall(function() dot:Remove() end)
			end
		end
		radar.PlayerDots = {}
	end

	if radar.MapPolygons then
		for _, poly in ipairs(radar.MapPolygons) do
			if poly and poly.Remove then
				pcall(function() poly:Remove() end)
			end
		end
		radar.MapPolygons = {}
	end

	if radar.PlayerAvatars then
		for key, slot in pairs(radar.PlayerAvatars) do
			if slot then
				if slot.Border and slot.Border.Remove then pcall(function() slot.Border:Remove() end) end
				if slot.Fill and slot.Fill.Remove then pcall(function() slot.Fill:Remove() end) end
				if slot.Image and slot.Image.Remove then pcall(function() slot.Image:Remove() end) end
				if slot.Drawing and slot.Drawing.Remove then pcall(function() slot.Drawing:Remove() end) end
			end
		end
		radar.PlayerAvatars = {}
	end

	if RadarBackgroundFrame and RadarBackgroundFrame.Parent then
		RadarBackgroundFrame:Destroy()
		RadarBackgroundFrame = nil
	end
	if RadarAvatarGui and RadarAvatarGui.Parent then
		RadarAvatarGui:Destroy()
		RadarAvatarGui = nil
	end

	if radar.Background and radar.Background.Remove then pcall(function() radar.Background:Remove() end) end
	if radar.Border and radar.Border.Remove then pcall(function() radar.Border:Remove() end) end
	if radar.LocalPlayerDot and radar.LocalPlayerDot.Remove then pcall(function() radar.LocalPlayerDot:Remove() end) end
	if radar.CrosshairH and radar.CrosshairH.Remove then pcall(function() radar.CrosshairH:Remove() end) end
	if radar.CrosshairV and radar.CrosshairV.Remove then pcall(function() radar.CrosshairV:Remove() end) end

	_G.ESPRadarComponents = nil
end

function ToggleRadar(enabled)
	Config.ESP.RadarEnabled = enabled
	if enabled then
		if not _G.ESPRadarComponents or not _G.ESPRadarComponents.Background then
			InitRadar()
		end
	else
		CleanupRadar()
	end
end

function ToggleDirectionalArrows(enabled)
	Config.ESP.DirectionalArrowsEnabled = enabled
	if not enabled then
		for player, arrow in pairs(_G.ESPDirectionalArrows) do
			arrow.Triangle.Visible = false
			arrow.DistanceText.Visible = false
		end
	end
end

InitRadar()

lastESPUpdate = 0
lastRadarUpdate = 0
lastArrowUpdate = 0
wasESPEnabled = false
wasRadarEnabled = false
wasDirectionalArrowsEnabled = false

VisualState = {
	CameraFovDefault = nil,
}

local function apply_camera_fov()
	local cam = workspace.CurrentCamera
	if not cam then return end
	if Config.Visuals.CameraFovEnabled then
		if VisualState.CameraFovDefault == nil then
			VisualState.CameraFovDefault = cam.FieldOfView
		end
		cam.FieldOfView = Config.Visuals.CameraFov
	elseif VisualState.CameraFovDefault ~= nil then
		cam.FieldOfView = VisualState.CameraFovDefault
		VisualState.CameraFovDefault = nil
	end
end

local function apply_visual_overrides()
	apply_camera_fov()
end

RunService.RenderStepped:Connect(function(dt)
	local currentTime = tick()
	apply_visual_overrides()
	local cameraCFrame = Camera.CFrame
	ESPFrameState.CameraCFrame = cameraCFrame
	ESPFrameState.CameraPos = cameraCFrame.Position
	ESPFrameState.ViewportSize = Camera.ViewportSize

	if Config.ESP.Enabled and (currentTime - lastESPUpdate) >= Config.ESP.RefreshRate then
		if Config.ESP.TracerESP then
			CachedTracerOrigin = GetTracerOrigin()
		else
			CachedTracerOrigin = nil
		end
		for _, player in ipairs(GetPlayersListCached()) do
			if player ~= LocalPlayer then
				if not _G.ESPDrawings[player] then
					CreateESP(player)
				end
				UpdateESP(player)
			end
		end
		UpdateEncryptedTargets()
		lastESPUpdate = currentTime
		wasESPEnabled = true
	elseif not Config.ESP.Enabled and wasESPEnabled then
		for _, player in ipairs(GetPlayersListCached()) do
			if _G.ESPDrawings[player] then
				HideESPDrawings(_G.ESPDrawings[player])
			end
			if _G.ESPHighlights[player] then
				_G.ESPHighlights[player].Enabled = false
			end
		end
		for key, esp in pairs(_G.ESPDrawings) do
			if typeof(key) == "Instance" and key:IsA("Model") then
				HideESPDrawings(esp)
			end
		end
		wasESPEnabled = false
	end

	if Config.ESP.RadarEnabled then
		wasRadarEnabled = true
	end
	if Config.ESP.RadarEnabled and (currentTime - lastRadarUpdate) >= (1/30) then
		_G.UpdateRadar()
		lastRadarUpdate = currentTime
	elseif wasRadarEnabled and not Config.ESP.RadarEnabled then
		_G.UpdateRadar()
		wasRadarEnabled = false
	end

	if Config.ESP.DirectionalArrowsEnabled then
		wasDirectionalArrowsEnabled = true
	end
	if Config.ESP.DirectionalArrowsEnabled and (currentTime - lastArrowUpdate) >= (1/30) then
		UpdateArrows()
		lastArrowUpdate = currentTime
	elseif wasDirectionalArrowsEnabled and not Config.ESP.DirectionalArrowsEnabled then
		UpdateArrows()
		wasDirectionalArrowsEnabled = false
	end
end)

Players.PlayerAdded:Connect(function(player)
	if player ~= LocalPlayer then
		CreateESP(player)
	end
end)

Players.PlayerRemoving:Connect(RemoveESP)

for _, player in ipairs(GetPlayersListCached()) do
	if player ~= LocalPlayer then
		CreateESP(player)
	end
end
