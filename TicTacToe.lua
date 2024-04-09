local board = {
    {" ", " ", " "},
    {" ", " ", " "},
    {" ", " ", " "}
}

local Column
local Row
local Turn

function GetMove()
    if Turn == "X" then
        io.write("X Turn \nColumn: ")
        Column = io.read("n")
        io.write("Row: ")
        Row = io.read("n")
    else
        io.write("O Turn \nColumn: ")
        Column = io.read("n")
        io.write("Row: ")
        Row = io.read("n")
    end
end

function UpdBoard()
    Column = Column <= 3 and Column or 3
    Row = Row <= 3 and Row or 3
    if board[Column][Row] == " " then
        board[Column][Row] = Turn
    else
        print("you just wasted a Turn")
    end
end

function PrintBoard()
    local idgaf = 0
    for e = 1,5 do
        if e % 2 == 0 then
            print("---+---+---")
        else   
            idgaf = idgaf + 1
            print(" "..board[idgaf][1].." | "..board[idgaf][2].." | "..board[idgaf][3])
        end
    end
end

function CheckForWinner()
    for e = 1,3 do
        if board[e][1] == Turn and board[e][2] == Turn and board[e][3] == Turn then
            return true, "Horizontal"
        end
        if board[1][e] == Turn and board[2][e] == Turn and board[3][e] == Turn then
            return true, "Vertical"
        end
    end
    -- no se como complicar esto
    if board[1][1] == Turn and board[2][2] == Turn and board[3][3] == Turn then
        return true, "Diagonal"
    end
    if board[1][3] == Turn and board[2][2] == Turn and board[3][1] == Turn then
        return true, "Diagonal"
    end
end

for i = 1,9 do
    Turn = i % 2 == 0 and "X" or "O"
    GetMove()
    UpdBoard()
    PrintBoard()
    if i >= 5 then
        local Win, Type = CheckForWinner()
        if Win then
            print("We got a Winner: "..Turn.." Type: "..Type)
            break
        end
    end
end