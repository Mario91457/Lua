local Folder =  workspace.Tri
local startPos = Folder.Part.Position

local color = Color3.new()

local function createConnectingPart(startPart, endPart)
	-- gpt

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



function createFunction(vals)
	
	local random = Random.new(tick() * 20)

	color = Color3.new(random:NextInteger(1,255),random:NextInteger(1,255),random:NextInteger(1,255))
	
	local old
	local new

	for i = 1, 360 * vals.loops do
		task.wait()
		local newPart = Instance.new("Part", Folder)
		newPart.Anchored = true
		newPart.Size = Vector3.new(.5,.5,.5)
		newPart.Material = Enum.Material.SmoothPlastic
		newPart.Transparency = 1
		newPart.Position = Vector3.new(startPos.X + i + 1 + (vals.amp * 0.1) ,startPos.Y + (vals.amp  * vals.func(math.rad(i*vals.freq))), startPos.Z)

		
		if i ~= 1 then
			old = new
			new = newPart
			createConnectingPart(old, new)
		else
			new = newPart
		end
	end
end

createFunction({
	func 	=	math.sin,
	loops 	=	1,
	freq 	=	10,
	amp  	=	5
})

createFunction({
	func 	=	math.cos,
	loops 	=	1,
	freq 	=	10,
	amp  	=	5
})


createFunction({
	func 	=	math.tan,
	loops 	=	1,
	freq 	=	3,
	amp  	=	2
})
