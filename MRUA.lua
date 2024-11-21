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

local function MRUA(Values)
    if not Values.t then
        -- t = -(0.5)a + (v_1 - v_2) + (x0_1 - x0_2)
        local a = -(0.5)*Values.a
        local b = Values.v_1 - Values.v_2
        local c = Values.x0_1 - Values.x0_2

        Values.t = solveQuadratic(a, b, c)
    end

    for i = 0, Values.t, Values.t_increment do
        local x1_1 = (Values.v_1 * i) + Values.x0_1
        local x1_2 = (0.5 * Values.a * i^2) + (Values.v_2 * i) + Values.x0_2

        print(string.format("-----------%.2fs-----------\nobj_1: %.3fs\nobj_2: %.3fs", i, x1_1, x1_2))
    end
end


MRUA({
    --obj_1: MRU
    v_1 = 10,
    x0_1 = 10,

    --obj_2: MRUA
    v_2 = 0,
    x0_2 = 1,
    a = 4,

    -- misc values
    t = nil, -- set to nil
    t_increment = 0.1
})