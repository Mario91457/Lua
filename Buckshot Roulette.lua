local numOfRounds = 3
local numOfLifesInEachRound = {3, 4, 6}
local Turn = "Player"

local PlayerWins = 0
local BotWins = 0

math.randomseed(os.time())

function GetRandomNumber(x, d)
    return math.random(x, d)
end

function LiveOrBlank(Rounds)
    local Table = {}
    local Live = 0
    local Blank = 0
    for i = 1, Rounds do
        local bool = GetRandomNumber(0, 1) == 1

        if bool then
            Live = Live + 1
        else
            Blank = Blank + 1
        end

        table.insert(Table, bool)
    end
    return Table, Live, Blank
end

function PlayerTurn(Rounds)
    while true do
        print("Who will you pull the trigger on?: Player or Bot?")
        local answer = io.read()
        if answer == "Player" or "Bot" then
            local PlayerOrBot = answer
            local Hit = Rounds[1]
            table.remove(Rounds, 1)
            return Rounds, answer, Hit
        end
    end
end

function BotTurn(Rounds)
    local PlayerOrBot = GetRandomNumber(0, 1) == 1
    local Target = PlayerOrBot and "Player" or "Bot"
    local Hit = Rounds[1]
    table.remove(Rounds, 1)
    return Rounds, Target, Hit
end


for i = 1, numOfRounds do
    local numOfLifesInEachRoundNOTFOUND = GetRandomNumber(2,6)
    local BotLives = numOfLifesInEachRound[i] or numOfLifesInEachRoundNOTFOUND
    local PlayerLives = numOfLifesInEachRound[i] or numOfLifesInEachRoundNOTFOUND

    if i == 1 then
        print("Hello Welcome to the funniest game every: russian roulette i mean BuckShot Roulette your objective is to survive, goodluck :=)\n(press enter to continue)")
        io.read()
    end

    print("Round: " .. i)

    while BotLives > 0 and PlayerLives > 0 do
        local numOfRounds = GetRandomNumber(3, 6)

        local LiveOrBlankTable = {}
        local Live = 0
        local Blank = 0
        local WhowasShot
        local Result
        
        repeat
            LiveOrBlankTable, Live, Blank = LiveOrBlank(numOfRounds)
        until Live > 0 and Blank > 0

        print("Number Of Rounds In Chamber: " .. numOfRounds .. ", LiveRounds: " .. Live .. ", BlankRounds:" .. Blank)

         for e = 1, numOfRounds do
            if Turn == "Player" then
                print("--------------Player--------------")
                LiveOrBlankTable, WhowasShot, Result = PlayerTurn(LiveOrBlankTable)
                Turn = "Bot"
            else
                print("--------------Bot--------------")
                print("Reveal Bot choice (press enter)")
                io.read()
                LiveOrBlankTable, WhowasShot, Result = BotTurn(LiveOrBlankTable)
                Turn = "Player"
            end

            if Result then
                if WhowasShot == "Player" then
                    print("--Player got Shot--\n")
                    PlayerLives = PlayerLives - 1
                    print("Your Lives: " .. PlayerLives)
                    print("Bot Lives: " .. BotLives .. "\n")
                    if PlayerLives == 0 then
                        BotWins = BotWins + 1
                        break
                    end
                else
                    print("--Bot got Shot--\n")
                    BotLives = BotLives - 1
                    print("Your Lives: " .. PlayerLives)
                    print("Bot Lives: " .. BotLives .. "\n")
                    if BotLives == 0 then
                        PlayerWins = PlayerWins + 1
                        break
                    end
                end
            else
                if WhowasShot == "Player" then
                    print("--Player got Shot But it was BlankBullet--\n")
                    print("Your Lives: " .. PlayerLives)
                    print("Bot Lives: " .. BotLives .. "\n")
                    Turn = "Player"
                else
                    print("--Bot got Shot But it was BlankBullet--\n")
                    print("Your Lives: " .. PlayerLives)
                    print("Bot Lives: " .. BotLives .. "\n")
                    Turn = "Bot"
                end
            end
        end
    end
    print("--------------Game Results--------------")
    print("PlayerWins: " .. PlayerWins)
    print("BotWins: " .. BotWins)
    Turn = "Player"
    print("----------------------------------------")
end
