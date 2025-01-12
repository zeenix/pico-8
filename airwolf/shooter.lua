Shooter = {}
Shooter.__index = Shooter

function Shooter:new(bullet_props)
    local this = setmetatable({}, Shooter)
    this.bullet_props = bullet_props
    this.last_bullet = time()

    return this
end

function Shooter:update(entity)
    if (self:bullet_cool_down()) self:shoot(entity)
end

function Shooter:shoot(entity)
    if (not(entity.is_enemy) and not(btn(buttons.o))) return

    local p = self.bullet_props
    local e = entity
    local b = Bullet:new(e.x + p.x_offset, e.y + p.y_offset, p.width, p.height, e.is_enemy);
    entities:add_bullet(b)
    self.last_bullet = time()
end

-- Returns true if there has been sufficient time since the last bullet.
function Shooter:bullet_cool_down()
    return time() - self.last_bullet > self.bullet_props.interval
end