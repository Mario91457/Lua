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

    local ymax = (Values.v0^2 * math.sin(thetaRad)^2) / (2 * Values.g)
    --local T_max = math.sqrt(2*Values.height/Values.g) solo para caida

	for t = 0, T_max, Values.t_increment do
		local x = v0x * t
		local y = Values.height + v0y * t - 0.5 * Values.g * t^2
        local Vy = v0y - Values.g * t 

        local V = math.sqrt(v0x^2 + Vy^2)
        local current_theta = math.deg(math.atan(Vy/v0x))
        if y == ymax then
            print("Altura maxima")
        end
        print(string.format("Tiempo: %.2fs | X: %.3fm | Y: %.3fm | Altura: %.3fm | Velocidad: %.3fm/s | Vy: %.3fm/s | Angulo: %.3f", t, x, y, y, V, Vy, current_theta))
	end
    print(string.format("Altura maxima (ymax): %.3fm", ymax+Values.height))
end

Parabola({
    g = 9.80665,
    v0 = 18,
    height = 50,
    theta = 45,
    t_increment = 0.01
})

