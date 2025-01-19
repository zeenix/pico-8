function _init()
    poke(0x5f36,0x2)

    smap = SMap:new()
    entities = Entities:new()
    scene = "start"
    score = 0
    go_to = 3 -- Game over time out.
    hscore = 0 -- High score.
end

function _update60()
    smap:update()
    entities:update()

    if scene == "start" or (scene == "game-over" and time() > got + go_to)  then
        if btnp(buttons.o) then
            scene = "game"
            score = 0
            entities = Entities:new()
            smap = SMap:new()
            music(0, nil, 7)
            start_time = time()
        end
    elseif scene == "game" then
        if time() - start_time > 30 then
            -- Stop the music after 30s.
            music(-1, 5000)
        end
    end
end

function _draw()
    smap:draw()
    entities:draw()

    if scene == "start" then print("press o to start", 30, 70, colors.white)
    elseif scene == "game-over" then
        print("game over", 40, 70, colors.white)
        if time() > got + go_to then
            print("press o to restart", 30, 80, colors.white)
        end
    end

    if scene == "game" or scene == "game-over" then
        print(score, 1, 122, colors.white)
    end

    if hscore > 0 then
        local x = 128 - 4 * #tostr(hscore)
        print(hscore, x, 122, colors.white)
    end
end

function game_over()
    scene = "game-over"
    entities:remove_airwolf()
    music(-1)
    smap:stop_scroll()
    got = time() -- Game over time.
    if score > hscore then
        hscore = score
    end
end