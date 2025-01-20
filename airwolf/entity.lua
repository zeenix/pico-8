Entity = {}
Entity.__index = Entity

local id = 0 -- Used to assign unique IDs to entities.

function Entity:new(x, y, sprite, type, size)
    local this = setmetatable({}, Entity)
    id += 1
    this.id = id
    this.x = x
    this.y = y
    this.sprite = sprite
    this.type = type
    this.size = size

    return this
end

function Entity:draw()
    -- ensure the entity is always at the middle of the pixel to avoid the
    -- "cobblestone effect" in case of diagonal movements.
    local x = flr(self.x) + 0.5
    local y = flr(self.y) + 0.5
    spr(self.sprite.num, x, y, self.sprite.w, self.sprite.h)
end

function Entity:move(dir, speed, on_collision)
    if dir == nil then return end

    local e = self

    if dir == "left" then e.x -= speed
    elseif dir == "right" then e.x += speed
    elseif dir == "up" then e.y -= speed
    elseif dir == "down" then e.y += speed
    elseif dir == "left-up" then
        e.x -= speed
        e.y -= speed
    elseif dir == "right-up" then
        e.x += speed
        e.y -= speed
    elseif dir == "left-down" then
        e.x -= speed
        e.y += speed
    elseif dir == "right-down" then
        e.x += speed
        e.y += speed
    end

    local airwolf = entities:airwolf()
    local victim = e:collided_with()
    if victim != nil then
        on_collision(victim)
    end
end

function Entity:collided_with()
    for e in all(entities.entities) do
        if (self:collided(e.entity)) return e
    end
end

function Entity:collided(other)
    if (self.id == other.id) return false -- Skip self.

    local e = {
        x = self.x,
        y = self.y,
        w = self.size.w,
        h = self.size.h,
    }
    local o = {
        x = other.x,
        y = other.y,
        w = other.size.w,
        h = other.size.h,
    }

    return e.x < o.x + o.w and
           e.x + e.w > o.x and
           e.y < o.y + o.h and
           e.y + e.h > o.y
end

function Entity:is_enemy() return (sub(self.type, 1, 5) == "enemy") end
