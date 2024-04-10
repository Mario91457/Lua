local map = {
    {0, 0, 1, 0},
    {0, 0, 1, 0},
    {0, 1, 0, 0},
    {0, 1, 0, 0}
}

-- hello
local total_boats = 0
local number_of_total_runs = 5
local misses = 0
local hits = 0

-- get boats
for i,v in ipairs(map) do
    for i,v in ipairs(v) do
        if v == 1 then
            total_boats = total_boats + 1
        end
    end
end

for i = 1, number_of_total_runs do
    -- main
    io.write("Selecting coordinates \n")
    io.write("Column 1 to 4: ")
    local Column = io.read("n")
    io.write("Row 1 to 4: ")
    local Row = io.read("n")

    -- check if number bigger than the map size
    if Column > #map then
        Column = 4
    end
    -- check for hits
    if map[Column][Row] == 1 then
        hits = hits + 1
        print("hit")
        map[Column][Row] = 2
    elseif map[Column][Row] == 2 then
        misses = misses + 1
        print("you hit it again")
    else
        misses = misses + 1
        print("miss")
    end
    
    if i == number_of_total_runs then
        if hits == total_boats then
            print("You Win: Misses: ".. misses.." Hits: " .. hits )
        else
            print("You Lost: Misses: "..misses.." Hits: "..hits)
        end
    end
end
