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

    if not Values.v0 then 
        print("usa la funcion calcularVelocidadInicial para sacar v0")
        return
    end

    if Values.v0 <= 0 then 
        -- bajando

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
        -- subiendo

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

local function calcularVelocidadInicial(g, t, direccion) -- siendo velocidad final siempre 0
    if not g and not t and not direccion then return end

    local v0
    if direccion == "+" then
        v0 = g * t   
    elseif direccion == "-" then
        v0 = -g * t
    end

    print(v0)
    return v0
end

CaidaLibre({
    g = 9.81,

    -- Positivo = Subiendo, 2 tramos ("y1" y "t" no es necesario)
    -- Negativo = Bajando
    -- nil = usar la funcion calcularVelocidadInicial. g = gravedad, t = tiempo, direccion = "+" (arriba) o "-" (abajo)
    v0 = 10,

    y0 = 0,
    y1 = 0,

    t = 3,
    t_increment = 0.01
})
