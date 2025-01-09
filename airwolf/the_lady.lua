TheLady = {}
TheLady.__index = TheLady

function TheLady:new()
    local this = setmetatable({}, TheLady)
    local bullet_props = {x_offset = 8, y_offset = -1, interval = 0.2}
    this.entity = Entity:new(63, 111, 0, 2, 2, false, bullet_props) 
    this.main_rotor = Rotor:new({x = 8, y = 6, length = 6})
    this.tail_rotor = Rotor:new({x = 8, y = 14, length = 2})

    return this
end

-- Returns true if the aircraft has gone outside the screen.
function TheLady:update()
    local outside = self:move()

    self.entity:update()
    self.main_rotor:update(self.entity)
    self.tail_rotor:update(self.entity)

    return outside
end

function TheLady:draw()
    self.entity:draw()
    self.main_rotor:draw()
    self.tail_rotor:draw()
end

-- Returns true if the aircraft has gone outside the screen.
function TheLady:move()
    local b = buttons

    if btn(b.left) then self.entity.x -= 1
    elseif btn(b.right) then self.entity.x += 1 end

    if btn(b.down) then self.entity.y += 1
    elseif btn(b.up) then self.entity.y -= 1 end

    local e = self.entity
    return (e.x < 0 or e.x > 127 or e.y < 0 or e.y > 127)
end
