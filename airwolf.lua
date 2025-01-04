function _init()
    poke(0x5f36,0x2)

    airwolf = Aircraft:airwolf()
    enemy = Aircraft:enemy_heli_small()
end

function _update()
    airwolf:update()
    if enemy:update() then
        -- For now just respawn the enemy.
        enemy = Aircraft:enemy_heli_small()
    end
end

function _draw()
    map(0, 0, 0, 0, 16, 16)
    airwolf:draw()
    enemy:draw()
end
