Entities = {}
Entities.__index = Entities

function Entities:new()
    local this = setmetatable({}, Entities)
    this.entities = {}
    this.enemy_spawn = time() -- Last time an enemy was spawned.

    return this
end

function Entities:update()
    -- Spawn an enemy aircraft every 2-6 seconds.
    if time() - self.enemy_spawn > 2 + flr(rnd(6)) then
        local e = EnemyAircraft:new()
        add(self.entities, e)
        self.enemy_spawn = time()
    end

    for i, e in ipairs(self.entities) do
        if e:update() then
            deli(self.entities, i)
        end
    end

    assert(count(self.entities) < 100) -- Ensure entities are removed.
end

function Entities:draw()
    for e in all(self.entities) do
        e:draw()
    end
end

function Entities:add_bullet(bullet)
    add(self.entities, bullet)
end