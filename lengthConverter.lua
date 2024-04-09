local Units = {
    mm = {m = 0.001, cm = 0.1, km = 1e-6, pies = 0.00328084, pulgadas = 0.0393701, yd = 0.00109361},
    cm = {m = 0.01, mm = 10, km = 1e-5, pies = 0.0328084, pulgadas = 0.393701, yd = 0.0109361},
    m = {mm = 1000, cm = 100, km = 0.001, pies = 3.28084, pulgadas = 39.3701, yd = 1.09361},
    km = {m = 1000, mm = 1e+6, cm = 1e+5, pies = 3280.84, pulgadas = 39370.1, yd = 1093.61},
    pies = {m = 0.3048, mm = 304.8, cm = 30.48, km = 0.0003048, pulgadas = 12, yd = 0.333333},
    pulgadas = {m = 0.0254, mm = 25.4, cm = 2.54, km = 2.54e-5, pies = 0.0833333, yd = 0.0277778},
    yd = {m = 0.9144, mm = 914.4, cm = 91.44, km = 0.0009144, pies = 3, pulgadas = 36}
}

print("Conversor de las unidades de SI (Soporte: mm, cm, m, km, pies, pulgadas, yd)\n")

print("Unidad inicial: ")
local UI = io.read()
print("Unidad Final: ")
local UF = io.read()
print("Valor: ")
local Val = io.read("n")

if Units[UI] and Units[UI][UF] then
    print(string.format("De %s a %s, Valor Final: %s", UI, UF, Val * Units[UI][UF] .. UF))
end