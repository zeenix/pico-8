Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y, is_enemy)
    local this = setmetatable({}, Bullet)
    this.x = x
    this.y = y
    this.is_enemy = is_enemy

    sfx(0)

    return this
end

-- Returns true when the bullet is outside the screen.
function Bullet:update()
    if self.enemy then
        self.y -= 3
        return (self.y == 0)
    else
        self.y += 3
        return (self.y == 127)
    end
end

function Bullet:draw()
    pset(self.x, self.y, colors.black)
end
