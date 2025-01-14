Entity = {}
Entity.__index = Entity

local id = 0 -- Used to assign unique IDs to entities.

function Entity:new(x, y, sprite, type)
    local this = setmetatable({}, Entity)
    id += 1
    this.id = id
    this.x = x
    this.y = y
    this.sprite = sprite
    this.type = type

    return this
end

function Entity:draw() spr(self.sprite.num, self.x, self.y, self.sprite.w, self.sprite.h) end

function Entity:collided_with()
    for e in all(entities.entities) do
        if (self:collided(e.entity)) return e.entity.type
    end
end

function Entity:collided(other)
    local e = self
    local o = other

    if (e.id == o.id) return false -- Skip self.

    return e.x < o.x + (o.sprite.w * 8) and
           e.x + (e.sprite.w * 8) > o.x and
           e.y < o.y + (o.sprite.h * 8) and
           e.y + (e.sprite.h * 8) > o.y
end

function Entity:is_enemy() return (sub(self.type, 1, 5) == "enemy") end
