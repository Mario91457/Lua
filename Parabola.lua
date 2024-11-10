local function solveQuadratic(a, b, c)
    local discriminant = b^2 - 4 * a * c
    if discriminant < 0 then
        print("Discriminante negativo")
        return
    end

    local pRoot = (-b + math.sqrt(discriminant)) / (2 * a)
    local nRoot = (-b - math.sqrt(discriminant)) / (2 * a)

    if pRoot >= 0 and nRoot >= 0 then
        return math.min(pRoot, nRoot)
    elseif pRoot >= 0 then
        return pRoot
    elseif nRoot >= 0 then
        return nRoot
    else
        print("Los dos tiempos son negativo?!??!")
        return
    end
end

local function Parabola(Values)
	local thetaRad = math.rad(Values.theta)  
	local v0x = Values.v0 * math.cos(thetaRad)
	local v0y = Values.v0 * math.sin(thetaRad)

	local a = 0.5 * Values.g
	local b = -v0y
	local c = -Values.height

    local T_max = solveQuadratic(a, b, c) or 0
    
	for t = 0, T_max + Values.t_increment, Values.t_increment do
		local x = v0x * t
		local y = Values.height + v0y * t - 0.5 * Values.g * t^2
        
        print(string.format("%.2fs, X: %.3fm, Y: %.3fm", t, x, y))
	end
end

Parabola({
    g = 9.80665,
    v0 = 30,
    height = 100,
    theta = 90,
    t_increment = 0.01
})

