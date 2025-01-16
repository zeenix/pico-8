TheLady = {}
TheLady.__index = TheLady

function TheLady:new()
    local this = setmetatable({}, TheLady)
    local sprite = { num = 1, w = 2, h = 2 }
    local size = { w = 10, h = 16 }
    this.entity = Entity:new(63, 111, sprite, "airwolf", size)
    local bullet_props = {
        x_offset = 3,
        y_offset = -1,
        interval = 0.4,
        sw = 1,
        sh = 1,
    }
    this.shooter = Shooter:new(bullet_props)
    this.main_rotor = Rotor:new({x = 6, y = 6, length = 6})
    this.tail_rotor = Rotor:new({x = 6, y = 14, length = 2})

    return this
end

-- Returns true if the aircraft has gone outside the screen.
function TheLady:update()
    local outside = false
    if scene == "game" then
        outside = self:move()
    end

    self.shooter:update(self.entity)
    self.main_rotor:update(self.entity)
    self.tail_rotor:update(self.entity)

    return outside
end

function TheLady:draw()
    self.entity:draw()
    self.main_rotor:draw()
    self.tail_rotor:draw()
end

function TheLady:move()
    local b = buttons

    local e = self.entity
    if e.x > -1 and btn(b.left) then self.entity.x -= 1
    elseif (e.x + e.size.w) < 126 and btn(b.right) then self.entity.x += 1 end

    if (e.y + e.size.h) < 128 and btn(b.down) then self.entity.y += 1
    elseif e.y > 0 and btn(b.up) then self.entity.y -= 1 end

    if self.entity:collided_with() == "enemy-bullet" then
        self:hit()
    end

    return false
end

function TheLady:hit()
    sfx(1)
    self.entity.x = 63
    self.entity.y = 111

    -- TODO: Should be able to take a few hits before game over.
    game_over()
end