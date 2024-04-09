local tablaPeriodica = { {N = "Hidrogeno", S = "H"}, {N = "Helio", S = "He"}, {N = "Litio", S = "Li"}, {N = "Berilio", S = "Be"}, {N = "Boro", S = "B"}, {N = "Carbono", S = "C"}, {N = "Nitrogeno", S = "N"}, {N = "Oxigeno", S = "O"}, {N = "Fluor", S = "F"}, {N = "Neon", S = "Ne"}, {N = "Sodio", S = "Na"}, {N = "Magnesio", S = "Mg"}, {N = "Aluminio", S = "Al"}, {N = "Silicio", S = "Si"}, {N = "Fosforo", S = "P"}, {N = "Azufre", S = "S"}, {N = "Cloro", S = "Cl"}, {N = "Argon", S = "Ar"}, {N = "Potasio", S = "K"}, {N = "Calcio", S = "Ca"}, {N = "Escandio", S = "Sc"}, {N = "Titanio", S = "Ti"}, {N = "Vanadio", S = "V"}, {N = "Cromo", S = "Cr"}, {N = "Manganeso", S = "Mn"}, {N = "Hierro", S = "Fe"}, {N = "Cobalto", S = "Co"}, {N = "Niquel", S = "Ni"}, {N = "Cobre", S = "Cu"}, {N = "Zinc", S = "Zn"}, {N = "Galio", S = "Ga"}, {N = "Germanio", S = "Ge"}, {N = "Arsenico", S = "As"}, {N = "Selenio", S = "Se"}, {N = "Bromo", S = "Br"}, {N = "Kripton", S = "Kr"}, {N = "Rubidio", S = "Rb"}, {N = "Estroncio", S = "Sr"}, {N = "Itrio", S = "Y"}, {N = "Circonio", S = "Zr"}, {N = "Niobio", S = "Nb"}, {N = "Molibdeno", S = "Mo"}, {N = "Tecnecio", S = "Tc"}, {N = "Rutenio", S = "Ru"}, {N = "Rodio", S = "Rh"}, {N = "Paladio", S = "Pd"}, {N = "Plata", S = "Ag"}, {N = "Cadmio", S = "Cd"}, {N = "Indio", S = "In"}, {N = "Estaño", S = "Sn"}, {N = "Antimonio", S = "Sb"}, {N = "Telurio", S = "Te"}, {N = "Yodo", S = "I"}, {N = "Xenon", S = "Xe"}, {N = "Cesio", S = "Cs"}, {N = "Bario", S = "Ba"}, {N = "Lantano", S = "La"}, {N = "Cerio", S = "Ce"}, {N = "Praseodimio", S = "Pr"}, {N = "Neodimio", S = "Nd"}, {N = "Prometio", S = "Pm"}, {N = "Samario", S = "Sm"}, {N = "Europio", S = "Eu"}, {N = "Gadolinio", S = "Gd"}, {N = "Terbio", S = "Tb"}, {N = "Disprosio", S = "Dy"}, {N = "Holmio", S = "Ho"}, {N = "Erbio", S = "Er"}, {N = "Tulio", S = "Tm"}, {N = "Iterbio", S = "Yb"}, {N = "Lutecio", S = "Lu"}, {N = "Hafnio", S = "Hf"}, {N = "Tantalo", S = "Ta"}, {N = "Wolframio", S = "W"}, {N = "Renio", S = "Re"}, {N = "Osmio", S = "Os"}, {N = "Iridio", S = "Ir"}, {N = "Platino", S = "Pt"}, {N = "Oro", S = "Au"}, {N = "Mercurio", S = "Hg"}, {N = "Talio", S = "Tl"}, {N = "Plomo", S = "Pb"}, {N = "Bismuto", S = "Bi"}, {N = "Polonio", S = "Po"}, {N = "Astato", S = "At"}, {N = "Radon", S = "Rn"}, {N = "Francio", S = "Fr"}, {N = "Radio", S = "Ra"}, {N = "Actinio", S = "Ac"}, {N = "Torio", S = "Th"}, {N = "Protactinio", S = "Pa"}, {N = "Uranio", S = "U"}, {N = "Neptunio", S = "Np"}, {N = "Plutonio", S = "Pu"}, {N = "Americio", S = "Am"}, {N = "Curio", S = "Cm"}, {N = "Berkelio", S = "Bk"}, {N = "Californio", S = "Cf"}, {N = "Einstenio", S = "Es"}, {N = "Fermio", S = "Fm"}, {N = "Mendelevio", S = "Md"}, {N = "Nobelio", S = "No"}, {N = "Lawrencio", S = "Lr"}, {N = "Rutherfordio", S = "Rf"}, {N = "Dubnio", S = "Db"}, {N = "Seaborgio", S = "Sg"}, {N = "Bohrio", S = "Bh"}, {N = "Hassio", S = "Hs"}, {N = "Meitnerio", S = "Mt"}, {N = "Darmstatio", S = "Ds"}, {N = "Roentgenio", S = "Rg"}, {N = "Copernicio", S = "Cn"}, {N = "Nihonio", S = "Nh"}, {N = "Flerovio", S = "Fl"}, {N = "Moscovio", S = "Mc"}, {N = "Livermorio", S = "Lv"}, {N = "Tenesino", S = "Ts"}, {N = "Oganeson", S = "Og"} }

function GetRandomNumber()
    math.randomseed(os.time())
    return math.random(1, 118)
end

print("Que quieres aprender?: Los Nombres o los Simbolos quimico (N = Nombre, S = Simbolos quimicos): ")
print("Recuerda que los tienes que escribir con mayuscula")
local nombreOsimbolo = io.read()
print("Repeticiones: ")
local Repeticiones = io.read("n")

if nombreOsimbolo == "S" or nombreOsimbolo == "N" then
    local Invertir = (nombreOsimbolo == "S") and "N" or "S"
    for i = 1, Repeticiones do
        local randomNumber = GetRandomNumber()
        print("Que es: "..tablaPeriodica[randomNumber][Invertir])
        local respuesta = io.read()
        if respuesta == tablaPeriodica[randomNumber][nombreOsimbolo] then
            print("Correcto\n")
        else
            print("Malo: "..tablaPeriodica[randomNumber][nombreOsimbolo].."\n") 
        end
    end
end