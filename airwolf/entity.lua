Entity = {}
Entity.__index = Entity

local id = 0 -- Used to assign unique IDs to entities.

-- width+height in number of sprites (IOW multiple of 8 pixels)
function Entity:new(x, y, sprite, type, width, height)
    local this = setmetatable({}, Entity)
    id += 1
    this.id = id
    this.x = x
    this.y = y
    this.sprite_num = sprite
    this.type = type
    this.width = width or 1
    this.height = height or 1

    return this
end

function Entity:draw() spr(self.sprite_num, self.x, self.y, self.width, self.height) end

function Entity:collided_with()
    for e in all(entities.entities) do
        if (self:collided(e.entity)) return e.entity.type
    end
end

function Entity:collided(other)
    local e = self
    local o = other

    if (e.id == o.id) return false -- Skip self.

    return e.x < o.x + (o.width * 8) and
           e.x + (e.width * 8) > o.x and
           e.y < o.y + (o.height * 8) and
           e.y + (e.height * 8) > o.y
end

function Entity:is_enemy() return (sub(self.type, 1, 5) == "enemy") end
