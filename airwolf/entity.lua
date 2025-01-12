Entity = {}
Entity.__index = Entity

local id = 0 -- Used to assign unique IDs to entities.

-- width+height in number of sprites (IOW multiple of 8 pixels)
function Entity:new(x, y, sprite, width, height, is_enemy)
    local this = setmetatable({}, Entity)
    id += 1
    this.id = id
    this.x = x
    this.y = y
    this.sprite_num = sprite
    this.width = width
    this.height = height
    this.is_enemy = is_enemy

    return this
end

function Entity:draw()
    spr(self.sprite_num, self.x, self.y, self.width, self.height)
end

function Entity:collided_with()
    if self:collided(airwolf.entity) then return "airwolf"
    else
        for e in all(entities.entities) do
            local e = e.entity
            if self:collided(e) then
                if e.sprite_num == 64 then return "airwolf-bullet"
                elseif e.sprite_num == 65 then return "enemy-bullet"
                else return "enemy" end
            end
        end
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
