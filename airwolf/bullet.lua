Bullet = {}
Bullet.__index = Bullet

function Bullet:new(x, y, type, sw, sh)
    local this = setmetatable({}, Bullet)
    local e = (type == "enemy-bullet")
    local size = e and { w = 1, h = 6 } or { w = 6, h = 8 }
    local sprite = {
        num = e and 65 or 64,
        w = sw,
        h = sh,
    }
    this.entity = Entity:new(x, y, sprite, type, size)

    sfx(0)

    return this
end

-- Returns true when the bullet is outside the screen.
function Bullet:update()
    local destroyed = false
    local is_enemy = self.entity:is_enemy()
    local on_collision = function(victim)
        local t = victim.entity.type
        if (is_enemy and t == "airwolf") or (not is_enemy and t == "enemy") then
            victim:hit()

            destroyed = true
        end
    end

    if is_enemy then
        self.entity:move("down", 2, on_collision)
        return destroyed or self.entity.y > 127
    else
        self.entity:move("up", 2, on_collision)
        return destroyed or self.entity.y < 0
    end
end

function Bullet:draw() self.entity:draw() end
