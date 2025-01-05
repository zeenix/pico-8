TheLady = {}
TheLady.__index = TheLady

function TheLady:new()
    local this = setmetatable({}, TheLady)
    this.x = 63
    this.y = 111
    this.sprite_num = sprite
     -- width+height in number of sprites (IOW multiple of 8 pixels)
    this.width = 2
    this.height = 2
    this.main_rotor = Rotor:new({x = 8, y = 6, length = 6})
    this.tail_rotor = Rotor:new({x = 8, y = 14, length = 2})
    this.last_bullet = time()

    return this
end

-- Returns true if the aircraft has gone outside the screen.
function TheLady:update()
    local outside = self:move()

    self.main_rotor:update(self.x, self.y)
    self.tail_rotor:update(self.x, self.y)

    if self:bullet_cool_down() then
        self:shoot(x, y)
    end

    return outside
end

function TheLady:draw()
    spr(self.sprite_num, self.x, self.y, self.width, self.height)

    self.main_rotor:draw()
    self.tail_rotor:draw()
end

-- Returns true if the aircraft has gone outside the screen.
function TheLady:move()
    local b = buttons

    if btn(b.left) then self.x -= 1
    elseif btn(b.right) then self.x += 1 end

    if btn(b.down) then self.y += 1
    elseif btn(b.up) then self.y -= 1 end

    return (self.x < 0 or self.x > 127 or self.y < 0 or self.y > 127)
end

function TheLady:shoot(x, y)
    if not(btn(buttons.o)) then
        return
    end

    local b = Bullet:new(self.x + 8, self.y - 1, false);
    bullets:add(b)
    self.last_bullet = time()
end

-- Returns true if there has been sufficient time since the last bullet.
function TheLady:bullet_cool_down()
    return time() - self.last_bullet > 0.2
end