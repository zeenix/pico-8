function _init()
    poke(0x5f36,0x2)

    entities = Entities:new()
    scene = "start"
end

function _update()
    entities:update()

    if scene == "start" then
        if btnp(buttons.o) then
            scene = "game"
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

    if (scene == "start") print("Press O to start", 30, 70, colors.white)
end

function game_over()
    scene = "game-over"
    music(-1)
end