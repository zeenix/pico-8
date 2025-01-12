function _init()
    poke(0x5f36,0x2)

    airwolf = TheLady:new()
    entities = Entities:new()

    music(0)
end

function _update()
    airwolf:update()
    entities:update()

    if stat(54) == -1 then
        -- The startup music has finished playing.
        -- Start playing the background music.
        music(2, 200)
    end
end

function _draw()
    map(0, 0, 0, 0, 16, 16)
    airwolf:draw()
    entities:draw()
end
