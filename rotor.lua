Rotor = {}
Rotor.__index = Rotor

function Rotor:new(type)
    local this = setmetatable({}, Rotor)
    this.angle = 0
    if type == "main" then
        this.length = 6
        this.x_offset = 8
        this.y_offset = 6
        this.color = colors.dark_grey
    else
        this.length = 2
        this.x_offset = 8
        this.y_offset = 14
        this.color = colors.dark_grey
    end

    return this
end

function Rotor:update(x, y)
    local speed = 4

    self.angle += speed
    -- Keep within 0 to 2*pi
    self.angle = self.angle % (2 * pi)

    local a = (self.angle / (2 * pi)) + 0.5  -- Convert to brads
    self.coords = {
        x1 = x + cos(a) * self.length + self.x_offset,
        y1 = y + sin(a) * self.length + self.y_offset,
        x2 = x - cos(a) * self.length + self.x_offset,
        y2 = y - sin(a) * self.length + self.y_offset,
    }
end

function Rotor:draw()
    local coords = self.coords
    line(coords.x1, coords.y1, coords.x2, coords.y2, self.color)
end

