Entities = {}
Entities.__index = Entities

function Entities:new()
    local this = setmetatable({}, Entities)
    this.entities = { TheLady:new() }
    this.enemy_spawn = time() -- Last time an enemy was spawned.

    return this
end

function Entities:update()
    -- Spawn an enemy aircraft every 1-4 seconds in game mode.
    if scene == "game" and time() - self.enemy_spawn > 1 + flr(rnd(3)) then
        local e = EnemyAircraft:new()
        add(self.entities, e)
        self.enemy_spawn = time()
    end

    for i, e in ipairs(self.entities) do
        if (e:update()) deli(self.entities, i)
    end

    assert(count(self.entities) < 100) -- Ensure entities are removed.
end

function Entities:draw()
    for e in all(self.entities) do
        e:draw()
    end
end

function Entities:add_bullet(bullet) add(self.entities, bullet) end

function Entities:airwolf() return self.entities[1] end