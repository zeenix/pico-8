function _init()
    poke(0x5f36,0x2)

    airwolf = TheLady:new()
end

function _update()
    airwolf:update()
end

function _draw()
    cls(3)
    airwolf:draw()
end
