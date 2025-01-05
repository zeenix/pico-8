EnemyAircraft = {}
EnemyAircraft.__index = EnemyAircraft

function EnemyAircraft:new()
    local this = setmetatable({}, EnemyAircraft)
    this.x = flr(rnd(128))
    this.y = -3
    this.sprite_num = 32
     -- width+height in number of sprites (IOW multiple of 8 pixels)
    this.width = 1
    this.height = 1
    this.bullets = Bullets:new(true)
    this.main_rotor = Rotor:new({x = 4, y = 4, length = 2})
    this.tail_rotor = Rotor:new({x = 3, y = 0, length = 1})

    return this
end

-- Returns true if the aircraft has gone outside the screen.
function EnemyAircraft:update()
    local outside = self:move()

    self.main_rotor:update(self.x, self.y)
    self.tail_rotor:update(self.x, self.y)
    self.bullets:update(self.x, self.y)

    return outside
end

function EnemyAircraft:draw()
    spr(self.sprite_num, self.x, self.y, self.width, self.height)

    self.main_rotor:draw()
    self.tail_rotor:draw()

    self.bullets:draw()
end

-- Returns true if the aircraft has gone outside the screen.
function EnemyAircraft:move()
    -- Enemy aircraft just moves slowly down the screen but horizontally
    -- towards the player.
    self.y += 0.5
    if self.x < airwolf.x then self.x += 0.3
    elseif self.x > airwolf.x then self.x -= 0.3 end

    return (self.x > 127 or self.y > 127)
end
