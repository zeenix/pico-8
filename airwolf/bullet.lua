Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y, width, height, is_enemy)
    local this = setmetatable({}, Bullet)
    local sprite_num = is_enemy and 65 or 64
    this.entity = Entity:new(x, y, sprite_num, width, height, is_enemy)

    sfx(0)

    return this
end

-- Returns true when the bullet is outside the screen.
function Bullet:update()
    if self.entity.is_enemy then
        self.entity.y += 3
        return (self.entity.y > 127)
    else
        self.entity.y -= 3
        return (self.entity.y < 0)
    end
end

function Bullet:draw()
    self.entity:draw()
end
