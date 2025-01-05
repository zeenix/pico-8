function _init()
    poke(0x5f36,0x2)

    airwolf = Aircraft:airwolf()
    enemy = Aircraft:enemy_heli_small()

    music(0)
end

function _update()
    airwolf:update()
    if enemy:update() then
        -- For now just respawn the enemy.
        enemy = Aircraft:enemy_heli_small()
    end

    if stat(54) == -1 then
        music(2, 200)
    end
end

function _draw()
    map(0, 0, 0, 0, 16, 16)
    airwolf:draw()
    enemy:draw()
end
