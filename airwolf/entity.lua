Entity = {}
Entity.__index = Entity

-- width+height in number of sprites (IOW multiple of 8 pixels)
function Entity:new(x, y, sprite, width, height, is_enemy)
    local this = setmetatable({}, Entity)
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
