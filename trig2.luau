local Folder =  workspace.Tri2
local startPos = Folder.Part.Position
local separations = 2 

local color = Color3.new()

local function createConnectingPart(startPart, endPart)
	--gpt
	
	local startPos = startPart.Position
	local endPos = endPart.Position
	local direction = (endPos - startPos).unit
	local distance = (endPos - startPos).magnitude

	local connectingPart = Instance.new("Part", Folder)
	connectingPart.Anchored = true
	connectingPart.Material = Enum.Material.SmoothPlastic
	connectingPart.Color = color
	connectingPart.Size = Vector3.new(.25, .25, distance) 
	connectingPart.CFrame = CFrame.new(startPos:Lerp(endPos, 0.5), endPos) 
end

function createTrigFunc(vals)
	local T = (vals.func == math.tan) and math.pi/math.abs(vals.freq) or 2*math.pi/math.abs(vals.freq) -- already in rads
	
	local random = Random.new(tick() * 40)
	color = Color3.new(random:NextInteger(1,255),random:NextInteger(1,255),random:NextInteger(1,255))

	local Rotations = math.deg(T) * vals.loops
	local count = 0
	
	

	local old = nil
	local new = nil
	
	local isuck = vals.divisions and Rotations/vals.divisions or 1
	for i = 0, Rotations, isuck do
		task.wait()
		local newPart = Instance.new("Part", Folder)
		newPart.Size = Vector3.new(.5,.5,.5)
		newPart.Anchored = true
		newPart.Transparency = 1
		newPart.Position = Vector3.new(startPos.X + (i + 1), startPos.Y + (vals.amp * vals.func(math.rad(vals.freq * i))), startPos.Z)

		count += 2
		
		if new then
			old = new
			new = newPart
			createConnectingPart(new, old)
		else
			new = newPart
		end
	end
end

createTrigFunc({
	func = math.sin,
	amp = 5,
	freq = 10,
	loops = 5,
	divisions = 100
})

createTrigFunc({
	func = math.cos,
	amp = 5,
	freq = 10,
	loops = 5,
	divisions = 100
})

createTrigFunc({
	func = math.tan,
	amp = 2,
	freq = 3,
	loops = 3,
	divisions = nil --because it can bug sometimes 
})

