Rotor = {}
Rotor.__index = Rotor

function Rotor:new()
    local this = setmetatable({}, Rotor)
    this.angle = 0

    return this
end

function Rotor:update(x, y)
    local speed = 4
    local length = 6

    self.angle += speed
    -- Keep within 0 to 2*pi
    self.angle = self.angle % (2 * pi)

    local a = (self.angle / (2 * pi)) + 0.5  -- Convert to brads
    self.coords = {
        x1 = x + cos(a) * length + 8,
        y1 = y + sin(a) * length + 6,
        x2 = x - cos(a) * length + 8,
        y2 = y - sin(a) * length + 6,
    }
end

function Rotor:draw()
    local coords = self.coords
    line(coords.x1, coords.y1, coords.x2, coords.y2, 5)
end

