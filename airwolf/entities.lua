Entities = {}
Entities.__index = Entities

function Entities:new()
    local this = setmetatable({}, Entities)
    this.bullets = {}
    this.enemy = EnemyAircraft:new()

    return this
end

function Entities:update(x, y)
    if self.enemy:update() then
        -- For now just respawn the enemy.
        self.enemy = EnemyAircraft:new()
    end

    for i, b in ipairs(self.bullets) do
        if b:update() then
            deli(self.bullets, i)
        end
    end
end

function Entities:draw()
    self.enemy:draw()

    for b in all(self.bullets) do
        b:draw()
    end
end

function Entities:add_bullet(bullet)
    add(self.bullets, bullet)
end