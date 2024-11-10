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

local function CaidaLibre(Values)
    if Values.v0 <= 0 then 
        if not Values.t then
            local a = -(1 / 2) * Values.g
            local b = Values.v0 
            local c = (Values.y0 - Values.y1)
            Values.t = solveQuadratic(a, b, c) or 0
        end

        for i = 0, Values.t + Values.t_increment, Values.t_increment do
            local y = Values.y0 + Values.v0 * i - (1 / 2) * Values.g * (i ^ 2)
            print(string.format("%.2fs : %.3fm", i, y))
        end

    else
        Values.t = Values.v0 / Values.g
        local y_peak = Values.y0 + Values.v0 * Values.t - (1 / 2) * Values.g * (Values.t ^ 2)

        print("-----------Subiendo-----------")
        for i = 0, Values.t, Values.t_increment do
            local y = Values.y0 + Values.v0 * i - (1 / 2) * Values.g * (i ^ 2)
            print(string.format("%.2fs : %.3fm", i, y))
        end

        local a = -(1 / 2) * Values.g
        local b = 0
        local c = y_peak - Values.y1
        local t_fall = solveQuadratic(a, b, c) or 0

        print("-----------Bajando-----------")
        for i = 0, t_fall + Values.t_increment, Values.t_increment do
            local y = y_peak - (1 / 2) * Values.g * (i ^ 2)
            print(string.format("%.2fs : %.3fm", Values.t + i, y))
        end
    end
end

CaidaLibre({
    g = 9.80665,

    v0 = -30, -- Positivo = Subiendo 2 tramos ("y1" y "t" no es necesario) | Negativo = Bajando

    y0 = 100,
    y1 = 40,

    t = nil,
    t_increment = 0.01
})