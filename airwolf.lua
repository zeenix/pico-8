function _init()
    poke(0x5f36,0x2)

    airwolf = TheLady:new()
end

function _update()
    airwolf:update()
end

function _draw()
    map(0, 0, 0, 0, 16, 16)
    airwolf:draw()
end
