Radian, Rand, Ceil = math.rad, math.random, math.ceil
Angle = CFrame.Angles
Vector = Vector3.new
Service = game.GetService

local Root = nil

local Config = {
	Desync = {
		Desyncenabled = false,
		Mode = "random",
		DesyncV2Enabled = false,
		DesyncFFlagsEnabled = false,
		VoidDesyncEnabled = false,
		tickRate = false,
		timeRelease = 0.015,
		timeChoke = 0.105,
		velMax = 16384,
		desyncRunning = false,
		desyncConnections = {},
		desyncLoop = nil,
		desyncIndicator = nil,
		desyncOriginCFrame = nil,
		voidDesyncConnections = { Heartbeat = nil, Render = nil },
		voidDesyncState = { voidCFrame = nil, originCFrame = nil, originVel = nil },
	}
}

local DESYNC_V3_FLAGS = {
	LargeReplicatorEnabled9 = true,
	GameNetDontSendRedundantNumTimes = 1,
	MaxTimestepMultiplierAcceleration = 2147483647,
	InterpolationFrameVelocityThresholdMillionth = 5,
	CheckPVDifferencesForInterpolationMinRotVelThresholdRadsPerSecHundredth = 1,
	TimestepArbiterVelocityCriteriaThresholdTwoDt = 2147483646,
	GameNetPVHeaderLinearVelocityZeroCutoffExponent = -5000,
	TimestepArbiterHumanoidTurningVelThreshold = 1,
	LargeReplicatorSerializeWrite4 = true,
	SimExplicitlyCappedTimestepMultiplier = 2147483646,
	InterpolationFrameRotVelocityThresholdMillionth = 5,
	ServerMaxBandwith = 52,
	LargeReplicatorSerializeRead3 = true,
	GameNetDontSendRedundantDeltaPositionMillionth = 1,
	PhysicsSenderMaxBandwidthBps = 20000,
	CheckPVCachedVelThresholdPercent = 10,
	NextGenReplicatorEnabledWrite4 = true,
	LargeReplicatorWrite5 = true,
	MaxMissedWorldStepsRemembered = -2147483648,
	StreamJobNOUVolumeCap = 2147483647,
	CheckPVLinearVelocityIntegrateVsDeltaPositionThresholdPercent = 1,
	DisableDPIScale = true,
	WorldStepMax = 30,
	InterpolationFramePositionThresholdMillionth = 5,
	MaxAcceptableUpdateDelay = 1,
	TimestepArbiterOmegaThou = 1073741823,
	CheckPVCachedRotVelThresholdPercent = 10,
	StreamJobNOUVolumeLengthCap = 2147483647,
	S2PhysicsSenderRate = 15000,
	MaxTimestepMultiplierBuoyancy = 2147483647,
	SimOwnedNOUCountThresholdMillionth = 2147483647,
	ReplicationFocusNouExtentsSizeCutoffForPauseStuds = 2147483647,
	LargeReplicatorRead5 = true,
	CheckPVDifferencesForInterpolationMinVelThresholdStudsPerSecHundredth = 1,
	MaxDataPacketPerSend = 2147483647,
	MaxTimestepMultiplierContstraint = 2147483647,
	DebugSendDistInSteps = -2147483648,
	GameNetPVHeaderRotationalVelocityZeroCutoffExponent = -5000,
	AngularVelocityLimit = 360
}

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

local function runDesyncEngine()
	ApplyDesyncV3FFlags()
end

function getroot()
	local char = game:GetService('Players').LocalPlayer.Character
	if not char then return nil end
	Root = char:FindFirstChild("HumanoidRootPart")
	return Root
end

local function InitRandom()
	local root = getroot()
	if not root then return end

	local rootVel = root.Velocity
	local rootAng = math.random(-180, 180)
	local rootOffset do
		local X = math.random(-Config.Desync.velMax, Config.Desync.velMax)
		local Y = math.random(0, Config.Desync.velMax)
		local Z = math.random(-Config.Desync.velMax, Config.Desync.velMax)
		rootOffset = Vector3.new(X, -Y, Z)
	end

	root.CFrame = root.CFrame * Angle(0, Radian(rootAng), 0)
	root.Velocity = rootOffset

	game:GetService('RunService').RenderStepped:Wait()

	root.CFrame = root.CFrame * Angle(0, Radian(-rootAng), 0)
	root.Velocity = rootVel
end

local function InitVoid()
	local root = getroot()
	if not root then return end

	local rootVel = root.Velocity
	local rootOffset = Vector3.new(0, -Config.Desync.velMax, 0)

	root.Velocity = rootOffset

	game:GetService('RunService').RenderStepped:Wait()

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

local function RunVoidDesyncOnce(mode)
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

	game:GetService('RunService').RenderStepped:Wait()

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

local function StartVoidDesyncLock(mode)
	local root = getroot()
	if not root then return end

	local originCF = root.CFrame
	local originVel = root.AssemblyLinearVelocity
	desyncOriginCFrame = originCF

	if mode == "desync v2" then
		SetFFlagValue("NextGenReplicatorEnabledWrite4", true)
	elseif mode == "desync v3" then
		runDesyncEngine()
	end

	local rotOnly = originCF - originCF.Position
	local voidPos = originCF.Position + Vector3.new(0, 100000000000000000, 0)
	local voidCF = CFrame.new(voidPos) * rotOnly

	voidDesyncState.voidCFrame = voidCF
	voidDesyncState.originCFrame = originCF
	voidDesyncState.originVel = originVel

	--CreateLKPIndicator(voidCF)

	root.CFrame = originCF
	root.AssemblyLinearVelocity = originVel

	if Config.Desync.voidDesyncConnections.Render then
		Config.Desync.voidDesyncConnections.Render:Disconnect()
	end
	if Config.Desync.voidDesyncConnections.Heartbeat then
		Config.Desync.voidDesyncConnections.Heartbeat:Disconnect()
	end

	Config.Desync.voidDesyncConnections.Render = game:GetService('RunService').RenderStepped:Connect(function()
		if not desyncRunning or not Config.Desync.Desyncenabled then return end
		if root and root.Parent then
			root.CFrame = Config.Desync.voidDesyncState.originCFrame or root.CFrame
			if Config.Desync.voidDesyncState.originVel then
				root.AssemblyLinearVelocity = Config.Desync.voidDesyncState.originVel
			end
		end
	end)

	voidDesyncConnections.Heartbeat = game:GetService('RunService').Heartbeat:Connect(function()
		if not desyncRunning or not Config.Desync.Desyncenabled then return end
		if root and root.Parent and Config.Desync.voidDesyncState.voidCFrame then
			root.CFrame = Config.Desync.voidDesyncState.voidCFrame
		end
	end)
end

function StartDesync()
	if desyncRunning then return end

	desyncRunning = true
	getroot()

	if not Root then
		desyncRunning = false
		return
	end
	if Config.Desync.VoidDesyncEnabled
		and (Config.Desync.Mode == "desync v2" or Config.Desync.Mode == "desync v3") then
		StartVoidDesyncLock(Config.Desync.Mode)
		return
	end

	local initFunc = InitRandom
	if Config.Desync.Mode == "void" then
		initFunc = InitVoid
	end

	local beatConn = game:GetService('RunService').Heartbeat:Connect(initFunc)
	table.insert(Config.Desync.desyncConnections, beatConn)
	
	Config.Desync.desyncLoop = task.spawn(function()
		while desyncRunning and Config.Desync.Desyncenabled do
			if Config.Desync.Mode == "desync v3" then
				runDesyncEngine()
			end
			local chokeClient = game:GetService('RunService').Heartbeat:Connect(Sleep)
			local chokeServer = game:GetService('RunService').RenderStepped:Connect(Sleep)
			task.wait(Config.Desync.timeChoke)

			chokeClient:Disconnect()
			chokeServer:Disconnect()
			task.wait(Config.Desync.timeRelease)
		end
	end)
end

function StopDesync(keepIndicatorSeconds)
	desyncRunning = false

	if Config.Desync.Mode == "desync v2" then
		SetFFlagValue("NextGenReplicatorEnabledWrite4", false)
	elseif Config.Desync.Mode == "desync v3" then
		for key in pairs(DESYNC_V3_FLAGS) do
			SetFFlagValue(key, false)
		end
	end

	if Config.Desync.voidDesyncConnections.Render then
		Config.Desync.voidDesyncConnections.Render:Disconnect()
		Config.Desync.voidDesyncConnections.Render = nil
	end
	if Config.Desync.voidDesyncConnections.Heartbeat then
		Config.Desync.voidDesyncConnections.Heartbeat:Disconnect()
		Config.Desync.voidDesyncConnections.Heartbeat = nil
	end
	local root = getroot()
	local restoreCF = Config.Desync.voidDesyncState.originCFrame or desyncOriginCFrame
	if root and restoreCF then
		local restoreLV = Config.Desync.voidDesyncState.originVel or root.AssemblyLinearVelocity
		local restoreAV = root.AssemblyAngularVelocity
		root.CFrame = restoreCF
		root.AssemblyLinearVelocity = restoreLV
		root.AssemblyAngularVelocity = restoreAV
		--QueueRestore(root, restoreCF, restoreLV, restoreAV, "xylo_void_restore")
	end
	Config.Desync.voidDesyncState.voidCFrame = nil
	Config.Desync.voidDesyncState.originCFrame = nil
	Config.Desync.voidDesyncState.originVel = nil

	if keepIndicatorSeconds and keepIndicatorSeconds > 0 then
		task.delay(keepIndicatorSeconds, function()
			--DestroyLKPIndicator()
		end)
	else
		--DestroyLKPIndicator()
	end
	desyncOriginCFrame = nil

	for _, conn in ipairs(Config.Desync.desyncConnections) do
		if conn then
			pcall(function() conn:Disconnect() end)
		end
	end
	table.clear(Config.Desync.desyncConnections)

	if Config.Desync.desyncLoop then
		task.cancel(Config.Desync.desyncLoop)
		Config.Desync.desyncLoop = nil
	end
end

return {
	RunVoidDesyncOnce = RunVoidDesyncOnce,
	StartVoidDesyncLock = StartVoidDesyncLock,
	ApplyVoidShift = ApplyVoidShift,
	StartDesync = StartDesync,
	StopDesync = StopDesync,
	Config = Config,
}
