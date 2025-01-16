function _init()
    poke(0x5f36,0x2)

    entities = Entities:new()
    scene = "start"
    score = 0
    got_to = 3 -- Game over time out.
    hscore = 0 -- High score.
end

function _update60()
    entities:update()

    if scene == "start" or (scene == "game-over" and time() > got + got_to)  then
        if btnp(buttons.o) then
            scene = "game"
            score = 0
            entities = Entities:new()
            music(0)
        end
    elseif scene == "game" then
        if stat(54) == -1 then
            -- The startup music has finished playing.
            -- Start playing the background music.
            music(2, 200)
        end
    end
end

function _draw()
    map(0, 0, 0, 0, 16, 16)

    entities:draw()

    if scene == "start" then print("press o to start", 30, 70, colors.white)
    elseif scene == "game-over" then
        print("game over", 40, 70, colors.white)
        if time() > got + got_to then
            print("press o to restart", 30, 80, colors.white)
        end
    end

    if scene == "game" or scene == "game-over" then
        print(score, 1, 123, colors.white)
    end

    if hscore > 0 then
        local digits = 128 - 4 * #tostr(hscore)
        print(hscore, digits, 123, colors.white)
    end
end

function game_over()
    scene = "game-over"
    music(-1)
    got = time() -- Game over time.
    if score > hscore then
        hscore = score
    end
end