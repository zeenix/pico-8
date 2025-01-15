Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y, type, sw, sh)
    local this = setmetatable({}, Bullet)
    local e = (type == "enemy-bullet")
    local bbox = e and { x = 3, y = 2, w = 1, h = 6 } or { x = 1, y = 0, w = 6, h = 8 }
    local sprite = {
        num = e and 65 or 64,
        w = sw,
        h = sh,
    }
    this.entity = Entity:new(x, y, sprite, type, bbox)

    sfx(0)

    return this
end

-- Returns true when the bullet is outside the screen.
function Bullet:update()
    if self.entity:is_enemy() then
        self.entity.y += 2
        return (self.entity.y > 127)
    else
        self.entity.y -= 2
        return (self.entity.y < 0)
    end
end

function Bullet:draw() self.entity:draw() end
