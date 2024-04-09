local round = 4
local optionsforbot = {"Papel", "Piedra", "Tigera"}

function GetRandomNumber()
    math.randomseed(os.time())
    return math.random(1,3)
end

function checkifwin(jugada, numero)
    if jugada == "Papel" or jugada == "Piedra" or jugada == "Tigera" then
        if optionsforbot[numero] == jugada then
            return "Empate"

           else

            if optionsforbot[numero] == "Papel" then
                if jugada == "Piedra" then
                    return "No Ganastes"
                    elseif  jugada == "Tigera" then
                        return "OK GANAS"
                end
                elseif optionsforbot[numero] == "Piedra" then
                    if jugada == "Tigera" then
                        return "No Ganastes"
                        elseif  jugada == "Papel" then
                            return "OK GANAS"
                    end  
                elseif optionsforbot[numero] == "Tigera" then
                    if jugada == "Papel" then
                        return "No Ganastes"
                        elseif  jugada == "Piedra" then
                            return "OK GANAS"
                    end 
            end
        end
        else
            return "PIEDRA PAPEL O TIGERA HDP"
    end
end

for i = 1, round do
    local random = GetRandomNumber()
    print("Elige: Piedra Papel y Tigera (recuerda es CapsSensitive yes yes)\n")
    local Jugada = io.read()
    Jugada =  tostring(Jugada)

    local ganoOno = checkifwin(Jugada, random)
    print("Opcion que eligio el bot: " .. optionsforbot[random])
    print ("Opcion que elegistes: " .. Jugada)
    print("y " .. ganoOno)

end