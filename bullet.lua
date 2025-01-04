Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y)
    local this = setmetatable({}, Bullet)
    this.x = x
    this.y = y

    sfx(0)

    return this
end

-- Returns true when the bullet is outside the screen.
function Bullet:update()
    self.y -= 3
    return (self.y == 0)
end

function Bullet:draw()
    pset(self.x, self.y - 2, colors.black)
end
