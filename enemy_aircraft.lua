EnemyAircraft = {}
EnemyAircraft.__index = EnemyAircraft

function EnemyAircraft:new()
    local this = setmetatable({}, EnemyAircraft)

    local x = flr(rnd(128))
    -- Longer duration for enemy bullets because they shoot continuously &
    -- automatically.
    local bullet_props = {x_offset = 4, y_offset = 4, interval = 1}
    this.entity = Entity:new(x, -3, 32, 1, 1, true, bullet_props) 
    this.main_rotor = Rotor:new({x = 4, y = 4, length = 2})
    this.tail_rotor = Rotor:new({x = 3, y = 0, length = 1})

    return this
end

-- Returns true if the aircraft has gone outside the screen.
function EnemyAircraft:update()
    local outside = self:move()

    self.entity:update()
    self.main_rotor:update(self.entity)
    self.tail_rotor:update(self.entity)

    return outside
end

function EnemyAircraft:draw()
    self.entity:draw()
    self.main_rotor:draw()
    self.tail_rotor:draw()
end

-- Returns true if the aircraft has gone outside the screen.
function EnemyAircraft:move()
    -- Enemy aircraft just moves slowly down the screen but horizontally
    -- towards the player.
    self.entity.y += 0.5
    if self.entity.x < airwolf.entity.x then self.entity.x += 0.3
    elseif self.entity.x > airwolf.entity.x then self.entity.x -= 0.3 end

    return (self.entity.x > 127 or self.entity.y > 127)
end