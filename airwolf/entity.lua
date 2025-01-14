Entity = {}
Entity.__index = Entity

local id = 0 -- Used to assign unique IDs to entities.

function Entity:new(x, y, sprite, type, bbox)
    local this = setmetatable({}, Entity)
    id += 1
    this.id = id
    this.x = x
    this.y = y
    this.sprite = sprite
    this.type = type
    this.bbox = bbox

    return this
end

function Entity:draw() spr(self.sprite.num, self.x, self.y, self.sprite.w, self.sprite.h) end

function Entity:collided_with()
    for e in all(entities.entities) do
        if (self:collided(e.entity)) return e.entity.type
    end
end

function Entity:collided(other)
    if (self.id == other.id) return false -- Skip self.

    local e = {
        x = self.x + self.bbox.x,
        y = self.y + self.bbox.y,
        w = self.bbox.w,
        h = self.bbox.h,
    }
    local o = {
        x = other.x + other.bbox.x,
        y = other.y + other.bbox.y,
        w = other.bbox.w,
        h = other.bbox.h,
    }

    return e.x < o.x + o.w and
           e.x + e.w > o.x and
           e.y < o.y + o.h and
           e.y + e.h > o.y
end

function Entity:is_enemy() return (sub(self.type, 1, 5) == "enemy") end
