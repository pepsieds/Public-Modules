local Root = nil

local getfflag = getfflag
local setfflag = setfflag
local sethiddenproperty = sethiddenproperty
local raknet = raknet

local LocalPlayer = game:GetService('Players').LocalPlayer
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local GameID = game.GameId

local Property, Wait = sethiddenproperty, wait
local Radian, Rand, Ceil = math.rad, math.random, math.ceil
local Angle = CFrame.Angles
local Vector = Vector3.new
local Service = game.GetService

local raknetHooked = false

local FPSPing = 10
local lkpWorldPos    = nil
local lkpFrozenCF    = nil
local lkpFrozenRotCF = nil
local lkpRigType     = "R6"

local RENDER_STEP_PREFIX = "erme_restore_step"
local RenderStepCounter = 0

local posIndicatorOuterCircle = nil
local posIndicatorInnerCircle = nil
local posIndicatorRenderConn  = nil

SenderRateOriginal = nil
NetworkDesyncSleeping = false

local Config = {}
local voidDesyncConnections = { Heartbeat = nil, Render = nil }
local voidDesyncState = { voidCFrame = nil, originCFrame = nil, originVel = nil, originAngularVel = nil }

RagebotVelocityHistory = setmetatable({}, { __mode = "k" })
FakePositionState = {LastRefresh = 0,FreezeUntil = 0,LastSleepToggle = 0,Position = nil,Sleeping = false,}
VoidHideState = {Connection = nil,WindowFocused = true,LastCycle = os.clock(),LastBait = 0,BaitPosition = nil,LastMetaSwitch = 0,LastMetaSwitch2 = 0,LastMetaCFrame = CFrame.new(),InVoid = false,}
Config.Desync={Desyncenabled=false,Mode="random",DesyncV2Enabled=false,DesyncFFlagsEnabled=false,VoidDesyncEnabled=false,Keybind=Enum.KeyCode.X,PositionIndicator={Enabled=false,Color=Color3.fromRGB(255,80,80),OutlineColor=Color3.fromRGB(0,0,0),Transparency=1,Size=8},SenderRate={Enabled=false,Mode="automatic",Rate=15},VelocityDesync={Enabled=false,Type="low",Rotate=false,DisableWhenAboveHealth=false,HealthThreshold=100},NetworkDesync={Enabled=false},FakePosition={Enabled=false,RefreshEvery=0.3,FreezeTime=0.1,SafeMode=false,SleepRate=30,Notifications=false,Keybind=Enum.KeyCode.F6},VoidHide={Enabled=false,Keybind=Enum.KeyCode.F7,Type=game.PlaceId==7213786345 and "vc server" or "random",Offset=100,TeleportTime=0.12,VoidTime=0.85,StopIfForced=false,BaitDistance=150,BaitTime=0.2,BaitCooldown=0.5,ForceWhenTabbedOut=false,ForceWhenNotFullHealth=false,ForceWhenLowHealth=false,ForceHealthThreshold=25,ForceWhenReloading=false,ForceWhenNoGunEquipped=false,ForceWhenKnocked=false,ForceWhenGunEquipped=false,DisableWhenForcedPosition=false,DisableWhenFullHealth=false,DisableWhenRagebotActive=false,DisableWhenFollowTarget=false,DisableWhenReloading=false},tickRate=false,timeRelease=0.015,timeChoke=0.105,velMax=16384}
Config.Overlays={KeyloggerX=20,KeyloggerY=400,FPSPingX=20,FPSPingY=20,KeybindListX=20,KeybindListY=100}
DESYNC_V3_FLAGS={LargeReplicatorEnabled9=true,GameNetDontSendRedundantNumTimes=1,MaxTimestepMultiplierAcceleration=2147483647,InterpolationFrameVelocityThresholdMillionth=5,CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth=1,TimestepArbiterVelocityCriteriaThresholdTwoDt=2147483646,GameNetPVHeaderLinearVelocityZeroCutoffExponent=-5000,TimestepArbiterHumanoidTurningVelThreshold=1,LargeReplicatorSerializeWrite4=true,SimExplicitlyCappedTimestepMultiplier=2147483646,InterpolationFrameRotVelocityThresholdMillionth=5,ServerMaxBandwith=52,LargeReplicatorSerializeRead3=true,GameNetDontSendRedundantDeltaPositionMillionth=1,PhysicsSenderMaxBandwidthBps=20000,CheckPVCachedVelThresholdPercent=10,NextGenReplicatorEnabledWrite4=true,LargeReplicatorWrite5=true,MaxMissedWorldStepsRemembered=-2147483648,StreamJobNOUVolumeCap=2147483647,CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent=1,DisableDPIScale=true,WorldStepMax=30,InterpolationFramePositionThresholdMillionth=5,MaxAcceptableUpdateDelay=1,TimestepArbiterOmegaThou=1073741823,CheckPVCachedRotVelThresholdPercent=10,StreamJobNOUVolumeLengthCap=2147483647,S2PhysicsSenderRate=15000,MaxTimestepMultiplierBuoyancy=2147483647,SimOwnedNOUCountThresholdMillionth=2147483647,ReplicationFocusNouExtentsSizeCutoffForPauseStuds=2147483647,LargeReplicatorRead5=true,CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth=1,MaxDataPacketPerSend=2147483647,MaxTimestepMultiplierContstraint=2147483647,DebugSendDistInSteps=-2147483648,GameNetPVHeaderRotationalVelocityZeroCutoffExponent=-5000,AngularVelocityLimit=360}


local function rakhook(packet)
	if packet.PacketId == 0x1B then
		local buf = packet.AsBuffer
		buffer.writeu32(buf, 1, 0xFFFFFFFF)
		packet:SetData(buf)
	end
end

local function EnableRakNetHook()
	if not raknetHooked then
		raknet.add_send_hook(rakhook)
		raknetHooked = true
	end
end

local function DisableRakNetHook()
	if raknetHooked then
		raknet.remove_send_hook(rakhook)
		raknetHooked = false
	end
end

local function SetFFlagValue(flagName, value)
	pcall(function()
		setfflag(tostring(flagName), tostring(value))
	end)
end

local function ApplyDesyncV3FFlags()
	for key, value in pairs(DESYNC_V3_FLAGS) do
		SetFFlagValue(key, value)
	end
end


local function GetRigType()
	local char = LocalPlayer and LocalPlayer.Character
	if not char then return "R6" end
	if char:FindFirstChild("UpperTorso") then return "R15" end
	return "R6"
end

local function runDesyncEngine()
	ApplyDesyncV3FFlags()
end

local function GetSenderRateOriginal()
	if SenderRateOriginal ~= nil then
		return SenderRateOriginal
	end

	local ok, value = pcall(function()
		return getfflag("S2PhysicsSenderRate")
	end)
	SenderRateOriginal = ok and tostring(value) or "15"
	return SenderRateOriginal
end

local function FormatSenderRateValue(value)
	local numeric = tonumber(value) or 15
	numeric = math.floor((numeric * 10) + 0.5) / 10
	local text = tostring(numeric)
	text = text:gsub("%.?0+$", "")
	return text
end

local function GetApproxLocalFps()
	if FPSPing and tonumber(FPSPing.fps) and FPSPing.fps > 0 then
		return FPSPing.fps
	end
	return 60
end

local function ApplySenderRateConfig()
	local cfg = Config.Desync and Config.Desync.SenderRate
	if not cfg or not cfg.Enabled then
		SetFFlagValue("S2PhysicsSenderRate", GetSenderRateOriginal())
		return
	end

	if cfg.Mode == "custom" then
		SetFFlagValue("S2PhysicsSenderRate", tostring(math.floor(tonumber(cfg.Rate) or 15)))
	else
		SetFFlagValue("S2PhysicsSenderRate", FormatSenderRateValue(GetApproxLocalFps()))
	end
end

local function GetVelocityDesyncVector(desyncType)
	if desyncType == "zero" then
		return Vector3.new(0, 0, 0)
	elseif desyncType == "y high" then
		return Vector3.new(0, 16384, 0)
	elseif desyncType == "high" then
		return Vector3.new(
			math.random(0, 1) == 0 and -16384 or 16384,
			math.random(0, 1) == 0 and -16384 or 16384,
			math.random(0, 1) == 0 and -16384 or 16384
		)
	elseif desyncType == "limit" then
		return Vector3.new(
			math.random(-1000000, 1000000),
			math.random(-1000000, 1000000),
			math.random(-1000000, 1000000)
		)
	end

	return Vector3.new(
		math.random(0, 1) == 0 and -300 or 300,
		math.random(0, 1) == 0 and -300 or 300,
		math.random(0, 1) == 0 and -300 or 300
	)
end

local function NextStepName(prefix)
	RenderStepCounter = RenderStepCounter + 1
	return string.format("%s_%d", prefix or RENDER_STEP_PREFIX, RenderStepCounter)
end

local function QueueRestore(hrp, cf, lv, av, prefix)
	if not hrp then return end
	local name = NextStepName(prefix)
	RunService:BindToRenderStep(name, 199, function()
		if hrp.Parent then
			hrp.CFrame = cf
			hrp.AssemblyLinearVelocity = lv
			hrp.AssemblyAngularVelocity = av
		end
		RunService:UnbindFromRenderStep(name)
	end)
end

local function getroot()
	local char = LocalPlayer.Character
	if not char then return nil end
	Root = char:FindFirstChild("HumanoidRootPart")
	return Root
end

local function SetCFramePos(hrp, newCF, prefix)
	if not hrp or not hrp.Parent then return false end
	local cf = hrp.CFrame
	hrp.CFrame = newCF
	local name = NextStepName(prefix)
	RunService:BindToRenderStep(name, 199, function()
		if hrp.Parent then
			hrp.CFrame = cf
		end
		RunService:UnbindFromRenderStep(name)
	end)
	return true
end

local function UpdateVelocityDesync()
	local cfg = Config.Desync and Config.Desync.VelocityDesync
	if not cfg or not cfg.Enabled then
		return
	end

	local root = getroot()
	if not root or not root.Parent then
		return
	end

	if cfg.DisableWhenAboveHealth then
		local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if humanoid and humanoid.MaxHealth > 0 then
			local ratio = humanoid.Health / humanoid.MaxHealth
			if ratio >= ((tonumber(cfg.HealthThreshold) or 100) / 100) then
				return
			end
		end
	end

	local oldCF = root.CFrame
	local oldLV = root.AssemblyLinearVelocity
	local oldAV = root.AssemblyAngularVelocity
	local velocity = GetVelocityDesyncVector(cfg.Type)

	root.AssemblyLinearVelocity = velocity
	if cfg.Rotate then
		root.AssemblyAngularVelocity = velocity
	end

	QueueRestore(root, oldCF, oldLV, oldAV, "erme_velocity_desync")
end

local function UpdateNetworkDesync()
	local cfg = Config.Desync and Config.Desync.NetworkDesync
	if not cfg or not cfg.Enabled then
		return
	end

	local root = getroot()
	if not root or not root.Parent then
		return
	end

	NetworkDesyncSleeping = not NetworkDesyncSleeping
	pcall(function()
		sethiddenproperty(root, "NetworkIsSleeping", NetworkDesyncSleeping)
	end)
end

-- Store LKP data; the unified indicator renders it
local function CreateLKPIndicator(frozenCFrame, labelText)
	if Config.Desync.Mode ~= "desync v2" and Config.Desync.Mode ~= "desync v3" then return end
	lkpWorldPos    = frozenCFrame.Position
	lkpFrozenCF    = frozenCFrame
	lkpFrozenRotCF = frozenCFrame - frozenCFrame.Position
	lkpRigType     = GetRigType()
end

local function DestroyLKPIndicator()
	lkpWorldPos    = nil
	lkpFrozenCF    = nil
	lkpFrozenRotCF = nil
end

local function UpdateFakePositionIndicatorState() end
local function DestroyFakePositionIndicator() end

local function StartPositionIndicator()
	if posIndicatorRenderConn then
		posIndicatorRenderConn:Disconnect()
		posIndicatorRenderConn = nil
	end

	posIndicatorRenderConn = RunService.Heartbeat:Connect(function()
		local cfg = Config.Desync and Config.Desync.PositionIndicator
		if not cfg or not cfg.Enabled then
			posIndicatorOuterCircle.Visible = false
			posIndicatorInnerCircle.Visible = false
			return
		end

		local camera = workspace.CurrentCamera
		if not camera then return end

		-- Determine which world position to show
		-- Priority: LKP (desync v2/v3) > FakePos > TruePos
		local worldPos
		if lkpWorldPos and (Config.Desync.Mode == "desync v2" or Config.Desync.Mode == "desync v3") then
			worldPos = lkpWorldPos
		else
			local root = getroot()
			if not root then
				posIndicatorOuterCircle.Visible = false
				posIndicatorInnerCircle.Visible = false
				return
			end
			if FakePositionState and FakePositionState.Position and
				Config.Desync.FakePosition and Config.Desync.FakePosition.Enabled then
				worldPos = FakePositionState.Position
			else
				worldPos = root.Position
			end
		end

		local screenPos, onScreen = camera:WorldToViewportPoint(worldPos)
		if not onScreen or screenPos.Z <= 0 then
			posIndicatorOuterCircle.Visible = false
			posIndicatorInnerCircle.Visible = false
			return
		end

		local pos2d   = Vector2.new(screenPos.X, screenPos.Y)
		local radius  = math.max(2, tonumber(cfg.Size) or 8)
		local color   = cfg.Color or Color3.fromRGB(255, 80, 80)
		local outline = cfg.OutlineColor or Color3.fromRGB(0, 0, 0)
		local transp  = cfg.Transparency or 1

		posIndicatorOuterCircle.Position    = pos2d
		posIndicatorOuterCircle.Radius      = radius + 2
		posIndicatorOuterCircle.Color       = outline
		posIndicatorOuterCircle.Transparency = transp
		posIndicatorOuterCircle.Visible     = true

		posIndicatorInnerCircle.Position    = pos2d
		posIndicatorInnerCircle.Radius      = radius
		posIndicatorInnerCircle.Color       = color
		posIndicatorInnerCircle.Transparency = transp
		posIndicatorInnerCircle.Visible     = true
	end)
end

local function StopPositionIndicator()
	if posIndicatorRenderConn then
		posIndicatorRenderConn:Disconnect()
		posIndicatorRenderConn = nil
	end
	if posIndicatorOuterCircle then posIndicatorOuterCircle.Visible = false end
	if posIndicatorInnerCircle then posIndicatorInnerCircle.Visible = false end
end

local function GetFakePositionRandomCFrame(root)
	local rotOnly = root.CFrame - root.CFrame.Position
	local randomPosition = Vector3.new(
		math.random(-2147483647, 2147483647),
		math.random(-400, 2147483647),
		math.random(-2147483647, 2147483647)
	)
	return (CFrame.new(randomPosition) * rotOnly) * CFrame.Angles(
		math.rad(math.random(1, 359)),
		math.rad(math.random(1, 359)),
		math.rad(math.random(1, 359))
	)
end

local function NotifyFakePosition(text)
	print(text)
end

local function ResetFakePositionState()
	FakePositionState.LastRefresh = 0
	FakePositionState.FreezeUntil = 0
	FakePositionState.LastSleepToggle = 0
	FakePositionState.Position = nil
	FakePositionState.Sleeping = false
	DestroyFakePositionIndicator()
	local root = getroot()
	if root and root.Parent then
		pcall(function()
			sethiddenproperty(root, "NetworkIsSleeping", false)
		end)
	end
end

local function UpdateFakePosition()
	local cfg = Config.Desync and Config.Desync.FakePosition
	if not cfg or not cfg.Enabled then
		if FakePositionState.Position ~= nil or FakePositionState.Sleeping then
			ResetFakePositionState()
		end
		return
	end

	local root = getroot()
	local character = LocalPlayer and LocalPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	if not root or not root.Parent or not humanoid or humanoid.Health <= 0 then
		return
	end

	local now = os.clock()
	local sleepRate = tonumber(cfg.SleepRate) or 30
	local sleepInterval = sleepRate >= 100 and 0 or math.max(0.01, (101 - sleepRate) / 100)

	if sleepInterval > 0 and (now - (FakePositionState.LastSleepToggle or 0)) >= sleepInterval then
		FakePositionState.LastSleepToggle = now
		FakePositionState.Sleeping = not FakePositionState.Sleeping
		pcall(function()
			sethiddenproperty(root, "NetworkIsSleeping", FakePositionState.Sleeping)
		end)
	end

	if now < (FakePositionState.FreezeUntil or 0) then
		SetFFlagValue("S2PhysicsSenderRate", "1")
	end

	local refreshEvery = math.max(0.05, tonumber(cfg.RefreshEvery) or 0.3)
	if (now - (FakePositionState.LastRefresh or 0)) < refreshEvery then
		UpdateFakePositionIndicatorState()
		return
	end

	FakePositionState.LastRefresh = now
	FakePositionState.FreezeUntil = now + math.max(0.01, tonumber(cfg.FreezeTime) or 0.1)
	FakePositionState.Position = root.CFrame.Position

	local oldCF = root.CFrame
	local oldLV = root.AssemblyLinearVelocity
	local oldAV = root.AssemblyAngularVelocity

	if cfg.SafeMode then
		root.CFrame = GetFakePositionRandomCFrame(root)
	else
		root.CFrame = GetFakePositionRandomCFrame(root)
		root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
		root.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
	end

	SetFFlagValue("S2PhysicsSenderRate", "1")
	QueueRestore(root, oldCF, oldLV, oldAV, "erme_fake_position")
	UpdateFakePositionIndicatorState()

	if cfg.Notifications then
		NotifyFakePosition("fake position refreshed")
	end
end

GetSenderRateOriginal()

local function InitRandom()
	local root = getroot()
	if not root then return end

	local rootVel = root.Velocity
	local rootOffset = Vector3.new(
		math.random(-Config.Desync.velMax, Config.Desync.velMax),
		- math.random(0, Config.Desync.velMax),
		math.random(-Config.Desync.velMax, Config.Desync.velMax)
	)

	local rootAng
	if Config.Desync.Mode == "random" then
		rootAng = math.random(-180, 180)
		root.CFrame = root.CFrame * Angle(0, Radian(rootAng), 0)
	end

	root.Velocity = rootOffset

	RunService.RenderStepped:Wait()

	if rootAng then
		root.CFrame = root.CFrame * Angle(0, Radian(-rootAng), 0)
	end
	root.Velocity = rootVel
end

local function InitVoid()
	local root = getroot()
	if not root then return end

	local rootVel = root.Velocity
	local rootOffset = Vector3.new(0, -Config.Desync.velMax, 0)

	root.Velocity = rootOffset

	RunService.RenderStepped:Wait()

	root.Velocity = rootVel
end

local function ApplyVoidShift(root)
	if not root then return nil end
	local originCF = desyncOriginCFrame or root.CFrame
	local originVel = root.Velocity
	local rotOnly = originCF - originCF.Position

	local TP_Position = originCF.Position + Vector3.new(
		math.random(-999999, 999999),
		math.random(0, 999999),
		math.random(-999999, 999999)
	)

	root.CFrame = CFrame.new(TP_Position) * rotOnly
	return originCF, originVel
end

local function SaveVoidDesyncOrigin(root)
	root = root or getroot()
	if not root then
		return false
	end

	local originCF = voidDesyncState.originCFrame or desyncOriginCFrame or root.CFrame
	voidDesyncState.originCFrame = originCF
	voidDesyncState.originVel = root.AssemblyLinearVelocity
	voidDesyncState.originAngularVel = root.AssemblyAngularVelocity
	desyncOriginCFrame = originCF
	return true
end

local function RestoreVoidDesyncOrigin()
	local root = getroot()
	local restoreCF = voidDesyncState.originCFrame or desyncOriginCFrame
	if not root or not restoreCF then
		return
	end

	local restoreLV = voidDesyncState.originVel or Vector3.new()
	local restoreAV = voidDesyncState.originAngularVel or Vector3.new()
	root.CFrame = restoreCF
	root.AssemblyLinearVelocity = restoreLV
	root.AssemblyAngularVelocity = restoreAV
	QueueRestore(root, restoreCF, restoreLV, restoreAV, "erme_void_restore")
end

function RunVoidDesyncOnce(mode)
	local root = getroot()
	if not root then return end

	local originCF = desyncOriginCFrame or root.CFrame
	local originVel = root.Velocity
	desyncOriginCFrame = originCF

	originCF, originVel = ApplyVoidShift(root)
	if not originCF then return end

	if mode == "desync v2" then
		SetFFlagValue("NextGenReplicatorEnabledWrite4", true)
	elseif mode == "desync v3" then
		runDesyncEngine()
	end

	RunService.RenderStepped:Wait()

	root.CFrame = originCF
	root.Velocity = originVel or root.Velocity

	if mode == "desync v2" then
		SetFFlagValue("NextGenReplicatorEnabledWrite4", false)
	elseif mode == "desync v3" then
		for key in pairs(DESYNC_V3_FLAGS) do
			SetFFlagValue(key, false)
		end
	end
end

function GetVoidHideCFrame(root, now, cfg)
	local offset = math.max(0, math.floor(tonumber(cfg.Offset) or 0))
	local rotOnly = root.CFrame - root.CFrame.Position

	if cfg.Type == "bait" then
		local diff = now - VoidHideState.LastBait
		if diff > (tonumber(cfg.BaitCooldown) or 0.5) then
			VoidHideState.LastBait = now
			local baitRange = math.max(0, math.floor(tonumber(cfg.BaitDistance) or 150))
			VoidHideState.BaitPosition = CFrame.new(
				math.random(-baitRange, baitRange),
				math.random(-200, 200),
				math.random(-baitRange, baitRange)
			)
		elseif diff < (tonumber(cfg.BaitTime) or 0.2) and VoidHideState.BaitPosition then
			local jitter = Vector3.new(
				math.random(-offset, offset),
				math.random(-offset, offset),
				math.random(-offset, offset)
			)
			return VoidHideState.BaitPosition + jitter
		end
	elseif cfg.Type == "meta" then
		local diff = now - VoidHideState.LastMetaSwitch
		if diff > 0.2 then
			if diff > 0.35 then
				VoidHideState.LastMetaSwitch = now
			end
			if diff < 0.21 then
				VoidHideState.LastMetaCFrame = VoidHideState.LastMetaCFrame - Vector3.new(0, 30, 0)
			end
		else
			if now - VoidHideState.LastMetaSwitch2 > 0.09 then
				VoidHideState.LastMetaSwitch2 = now
				local offsets = {
					Vector3.new(-1414, 0, -1414),
					Vector3.new(1414, 0, -1414),
					Vector3.new(-1414, 0, 1414),
					Vector3.new(1414, 0, 1414),
					Vector3.new(1414, 1414, 1414),
					Vector3.new(-1414, 1414, 1414),
					Vector3.new(1414, 1414, -1414),
				}
				local selected = offsets[math.random(1, #offsets)]
				VoidHideState.LastMetaCFrame = CFrame.new(selected) * CFrame.Angles(
					math.rad(math.random(1, 359)),
					math.rad(math.random(1, 359)),
					math.rad(math.random(1, 359))
				)
			end
		end
		return VoidHideState.LastMetaCFrame
	end

	local basePosition
	if cfg.Type == "vc server" then
		basePosition = Vector3.new(0, math.random(-2147483647, 2147483647), 0)
	else
		basePosition = Vector3.new(
			math.random(-2147483647, 2147483647),
			math.random(-400, 2147483647),
			math.random(-2147483647, 2147483647)
		)
	end
	local jitter = Vector3.new(
		math.random(-offset, offset),
		math.random(-offset, offset),
		math.random(-offset, offset)
	)
	return (CFrame.new(basePosition + jitter) * rotOnly) * CFrame.Angles(
		math.rad(math.random(1, 359)),
		math.rad(math.random(1, 359)),
		math.rad(math.random(1, 359))
	)
end

function StopVoidHide()
	VoidHideState.InVoid = false
	if VoidHideState.Connection then
		VoidHideState.Connection:Disconnect()
		VoidHideState.Connection = nil
	end
end

function StartVoidHide()
	StopVoidHide()
	VoidHideState.LastCycle = os.clock()
	VoidHideState.Connection = RunService.Heartbeat:Connect(function()
		local cfg = Config.Desync and Config.Desync.VoidHide
		if not cfg or not cfg.Enabled then
			StopVoidHide()
			return
		end

		local root = getroot()
		local character = LocalPlayer and LocalPlayer.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not root or not humanoid or humanoid.Health <= 0 then
			VoidHideState.InVoid = false
			return
		end

		local now = os.clock()
		local cycleElapsed = now - (VoidHideState.LastCycle or now)
		local teleportTime = math.max(0, tonumber(cfg.TeleportTime) or 0.12)
		local voidTime = math.max(teleportTime + 0.01, tonumber(cfg.VoidTime) or 0.85)

		if cycleElapsed > voidTime then
			VoidHideState.LastCycle = now
			cycleElapsed = 0
		end

		if cycleElapsed < teleportTime then
			VoidHideState.InVoid = false
			return
		end

		local oldCF = root.CFrame
		local oldLV = root.AssemblyLinearVelocity
		local oldAV = root.AssemblyAngularVelocity
		local newCF = GetVoidHideCFrame(root, now, cfg)
		if not newCF then
			VoidHideState.InVoid = false
			return
		end

		VoidHideState.InVoid = true
		root.CFrame = newCF
		QueueRestore(root, oldCF, oldLV, oldAV, "erme_void_hide")
	end)
end

function StartVoidDesyncLock(mode)
	local root = getroot()
	if not root then return end

	SaveVoidDesyncOrigin(root)
	local originCF = voidDesyncState.originCFrame or root.CFrame
	local originVel = voidDesyncState.originVel or root.AssemblyLinearVelocity

	local rotOnly = originCF - originCF.Position
	local voidPos = originCF.Position + Vector3.new(0, 1000000, 0)
	local voidCF = CFrame.new(voidPos) * rotOnly

	root.CFrame = voidCF
	root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)

	if mode == "desync v2" then
		EnableRakNetHook()
	elseif mode == "desync v3" then
		runDesyncEngine()
	end

	CreateLKPIndicator(originCF, "serverpos")
	wait(1)

	root.CFrame = originCF
	root.AssemblyLinearVelocity = originVel

	voidDesyncState.voidCFrame = voidCF
	voidDesyncState.originCFrame = originCF
	voidDesyncState.originVel = originVel

	if voidDesyncConnections.Heartbeat then
		voidDesyncConnections.Heartbeat:Disconnect()
		voidDesyncConnections.Heartbeat = nil
	end
	if voidDesyncConnections.Render then
		voidDesyncConnections.Render:Disconnect()
		voidDesyncConnections.Render = nil
	end

	voidDesyncConnections.Heartbeat = RunService.Heartbeat:Connect(function()
		if not root or not root.Parent then return end
		root.CFrame = voidCF
		root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
	end)

	voidDesyncConnections.Render = RunService.RenderStepped:Connect(function()
		if not root or not root.Parent then return end
		root.CFrame = originCF
		root.AssemblyLinearVelocity = originVel
		if workspace.CurrentCamera then
			workspace.CurrentCamera.CFrame = CFrame.new(originCF.Position, originCF.Position + workspace.CurrentCamera.CFrame.LookVector)
		end
	end)
end


--========================================================--
--  START / STOP
--========================================================--

desyncRunning = false
desyncConnections = {}

function startDes()
	if desyncRunning then return end

	desyncRunning = true
	activeDesyncMode = Config.Desync.Mode
	DesyncV2ForcedVoidHide = false
	getroot()

	if not Root then
		desyncRunning = false
		return
	end

	if activeDesyncMode == "desync v2" and not Config.Desync.VoidDesyncEnabled then
		DesyncV2ForcedVoidHide = true
		StartVoidHide()
	end

	if Config.Desync.VoidDesyncEnabled
		and (activeDesyncMode == "desync v2" or activeDesyncMode == "desync v3") then
		StartVoidDesyncLock(activeDesyncMode)
		return
	end


	if activeDesyncMode == "desync v2" or activeDesyncMode == "desync v3" then
		CreateLKPIndicator(Root.CFrame, "serverpos")
	end

	if activeDesyncMode == "desync v2" then
		EnableRakNetHook()
	end

	local initFunc = InitRandom
	if activeDesyncMode == "void" then
		initFunc = InitVoid
	end

	local beatConn = RunService.Heartbeat:Connect(initFunc)
	table.insert(desyncConnections, beatConn)

	desyncLoop = task.spawn(function()
		while desyncRunning and Config.Desync.Desyncenabled do
			if activeDesyncMode == "desync v3" then
				runDesyncEngine()
			end
			local chokeClient = RunService.Heartbeat:Connect(Sleep)
			local chokeServer = RunService.RenderStepped:Connect(Sleep)
			task.wait(Config.Desync.timeChoke)

			chokeClient:Disconnect()
			chokeServer:Disconnect()
			task.wait(Config.Desync.timeRelease)
		end
	end)
end

function StopDes(keepIndicatorSeconds)
	desyncRunning = false
	local stopMode = activeDesyncMode or Config.Desync.Mode
	local shouldStopForcedVoidHide = DesyncV2ForcedVoidHide and not (Config.Desync and Config.Desync.VoidHide and Config.Desync.VoidHide.Enabled)
	DesyncV2ForcedVoidHide = false

	if stopMode == "desync v2" then
		DisableRakNetHook()
	elseif stopMode == "desync v3" then
		for key in pairs(DESYNC_V3_FLAGS) do
			SetFFlagValue(key, false)
		end
	end

	if voidDesyncConnections.Render then
		voidDesyncConnections.Render:Disconnect()
		voidDesyncConnections.Render = nil
	end
	if voidDesyncConnections.Heartbeat then
		voidDesyncConnections.Heartbeat:Disconnect()
		voidDesyncConnections.Heartbeat = nil
	end

	RestoreVoidDesyncOrigin()

	DestroyLKPIndicator()
	voidDesyncState.voidCFrame = nil
	voidDesyncState.originCFrame = nil
	voidDesyncState.originVel = nil
	voidDesyncState.originAngularVel = nil

	if keepIndicatorSeconds and keepIndicatorSeconds > 0 then
		task.delay(keepIndicatorSeconds, function()
			DestroyLKPIndicator()
		end)
	else
		DestroyLKPIndicator()
	end
	desyncOriginCFrame = nil

	for _, conn in ipairs(desyncConnections) do
		if conn then
			pcall(function() conn:Disconnect() end)
		end
	end
	table.clear(desyncConnections)

	if desyncLoop then
		task.cancel(desyncLoop)
		desyncLoop = nil
	end

	if shouldStopForcedVoidHide then
		StopVoidHide()
	end
	activeDesyncMode = nil
end

StopDes()

return {
	StartDesy = startDes,
	StopDesy = StopDes,
	Configuration = Config
}
