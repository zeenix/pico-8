Entity = {}
Entity.__index = Entity

-- width+height in number of sprites (IOW multiple of 8 pixels)
function Entity:new(x, y, sprite, width, height, is_enemy, bullet_props)
    local this = setmetatable({}, Entity)
    this.x = x
    this.y = y
    this.sprite_num = sprite
    this.width = width
    this.height = height
    this.is_enemy = is_enemy
    this.bullet_props = bullet_props
    this.last_bullet = time()

    return this
end

function Entity:update()
    if self:bullet_cool_down() then
        self:shoot()
    end
end

function Entity:draw()
    spr(self.sprite_num, self.x, self.y, self.width, self.height)
end

function Entity:shoot()
    if not(self.is_enemy) and not(btn(buttons.o)) then
        return
    end

    local props = self.bullet_props
    local b = Bullet:new(self.x + props.x_offset, self.y + props.y_offset, self.is_enemy);
    bullets:add(b)
    self.last_bullet = time()
end

-- Returns true if there has been sufficient time since the last bullet.
function Entity:bullet_cool_down()
    return time() - self.last_bullet > self.bullet_props.interval
end