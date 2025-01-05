function _init()
    poke(0x5f36,0x2)

    airwolf = TheLady:new()
    enemy = EnemyAircraft:new()

    music(0)
end

function _update()
    airwolf:update()
    if enemy:update() then
        -- For now just respawn the enemy.
        enemy = EnemyAircraft:new()
    end

    if stat(54) == -1 then
        -- The startup music has finished playing.
        -- Start playing the background music.
        music(2, 200)
    end
end

function _draw()
    map(0, 0, 0, 0, 16, 16)
    airwolf:draw()
    enemy:draw()
end
