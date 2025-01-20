EnemyAircraft = {}
EnemyAircraft.__index = EnemyAircraft

function EnemyAircraft:new()
    local this = setmetatable({}, EnemyAircraft)

    local x = flr(rnd(127))
    local sprite = { num = 32, w = 1, h = 1 }
    local size = { w = 6, h = 8 }
    this.entity = Entity:new(x, -8, sprite, "enemy", size)
    -- Longer duration for enemy bullets because they shoot continuously &
    -- automatically.
    local bullet_props = {
        x_offset = 3,
        y_offset = 4,
        interval = 1,
        sw = 1,
        sh = 1,
    }
    this.shooter = Shooter:new(bullet_props)
    this.main_rotor = Rotor:new({x = 3, y = 4, length = 2})
    this.tail_rotor = Rotor:new({x = 3, y = 0, length = 1})
    this.alive = true

    return this
end

-- Returns true if the aircraft has gone outside the screen.
function EnemyAircraft:update()
    if not self.alive then return true end

    local outside = false
    if scene == "game" then
        outside = self:move()
    end

    self.shooter:update(self.entity)
    self.main_rotor:update(self.entity)
    self.tail_rotor:update(self.entity)

    return outside
end

function EnemyAircraft:draw()
    self.entity:draw()
    self.main_rotor:draw()
    self.tail_rotor:draw()
end

-- Returns true if the aircraft has gone outside the screen or gotten destroyed.
function EnemyAircraft:move()
    local e = self.entity
    local x = e.x
    local y = e.y
    -- Enemy aircraft just moves slowly down the screen but horizontally
    -- towards the player.
    local d = nil
    local airwolf = entities:airwolf()
    if e.x < airwolf.entity.x then d = "right-down"
    elseif e.x > airwolf.entity.x then d = "left-down" end

    local on_collision = function(victim)
        local type = victim.entity.type
        if type == "airwolf" then
            airwolf:hit()

            self:hit()
        elseif type == "enemy" then
            -- Just move the enemy aircraft back to its previous position.
            e.x = x
            e.y = y
        end
    end

    e:move(d, 0.3, on_collision)

    return (not self.alive) or e.x < 0 or e.x > 127 or e.y > 127
end

function EnemyAircraft:hit()
    sfx(2)
    self.alive = false
end