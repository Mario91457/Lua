local round = 4
local Options = {
    Piedra = {Gana = "Tijera", Pierde = "Papel"},
    Papel = {Gana = "Piedra", Pierde = "Tijera"},
    Tijera = {Gana = "Papel", Pierde = "Roca"},
}
local optionsforbot = {"Papel", "Piedra", "Tijera"}

function GetRandomNumber()
    math.randomseed(os.time())
    return math.random(1,3)
end

function Checkiffun(jugada, numero)
    if not Options[jugada] then return "e" end
    if optionsforbot[numero] == jugada then
        return "Empate"
    else
        if optionsforbot[numero] == Options[jugada].Gana then
            return "Ganastes"
        else
            return "Perdistes"
        end
    end
end

for _ = 1, round do
    local random = GetRandomNumber()
    print("Elige: Piedra Papel y Tijera (recuerda es CapsSensitive yes yes)\n")
    local Jugada = io.read()
    Jugada =  tostring(Jugada)

    local ganoOno = Checkiffun(Jugada, random)
    print("Opcion que eligio el bot: " .. optionsforbot[random])
    print ("Opcion que elegistes: " .. Jugada)
    print("y " .. ganoOno)

end
