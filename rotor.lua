Rotor = {}
Rotor.__index = Rotor

function Rotor:new(props)
    local this = setmetatable({}, Rotor)
    this.angle = 0
    this.x_offset = props.x
    this.y_offset = props.y
    this.length = props.length
    this.color = colors.dark_grey

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
    if coords == nil then return end
    line(coords.x1, coords.y1, coords.x2, coords.y2, self.color)
end

