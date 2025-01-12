Entities = {}
Entities.__index = Entities

function Entities:new()
    local this = setmetatable({}, Entities)
    this.entities = {}
    this.enemy_spawn = time() -- Last time an enemy was spawned.

    return this
end

function Entities:update(x, y)
    -- Spawn an enemy aircraft every 1-4 seconds.
    if time() - self.enemy_spawn > 1 + flr(rnd(4)) then
        local e = EnemyAircraft:new()
        add(self.entities, e)
        self.enemy_spawn = time()
    end

    for i, e in ipairs(self.entities) do
        if e:update() then
            deli(self.entities, i)
        end
    end
end

function Entities:draw()
    for e in all(self.entities) do
        e:draw()
    end
end

function Entities:add_bullet(bullet)
    add(self.entities, bullet)
end