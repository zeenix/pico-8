TheLady = {}
TheLady.__index = TheLady

function TheLady:new()
    local this = setmetatable({}, TheLady)
    this.x = 20
    this.y = 20
    this.sprite_num = 0
     -- width+height in number of sprites (IOW multiple of 8 pixels)
    this.width = 2
    this.height = 2
    this.angle = 0

    return this
end

function TheLady:update()
    self:move()
    self:update_main_rotor()
end

function TheLady:draw()
    spr(self.sprite_num, self.x, self.y, self.width, self.height)

    local coords = self.blade_coords
    -- The main rotor
    line(coords.x1, coords.y1, coords.x2, coords.y2, 5)

    -- The tail rotor
    circ(self.x + 8, self.y + 14, 1, colors.lavender)
end

function TheLady:move()
    local b = buttons

    if btn(b.left) then self.x -= 1
    elseif btn(b.right) then self.x += 1 end

    if btn(b.down) then self.y += 1
    elseif btn(b.up) then self.y -= 1 end
end

function TheLady:update_main_rotor()
    local speed = 4
    local blade_length = 6

    self.angle += speed
    -- Keep within 0 to 2*pi
    self.angle = self.angle % (2 * pi)

    local a = (self.angle / (2 * pi)) + 0.5  -- Convert to brads
    self.blade_coords = {
        x1 = self.x + cos(a) * blade_length + 8,
        y1 = self.y + sin(a) * blade_length + 6,
        x2 = self.x - cos(a) * blade_length + 8,
        y2 = self.y - sin(a) * blade_length + 6,
    }
end

