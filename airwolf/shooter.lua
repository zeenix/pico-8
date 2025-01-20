Shooter = {}
Shooter.__index = Shooter

function Shooter:new(bprops)
    local this = setmetatable({}, Shooter)
    this.bprops = bprops -- Bullet properties.
    this.lb = time() -- Time last bullet was fired.

    return this
end

function Shooter:update(entity) if (self:bullet_cool_down()) self:shoot(entity) end

function Shooter:shoot(entity)
    if (scene != "game") return
    if (not(entity:is_enemy()) and not(btn(buttons.o))) return

    local p = self.bprops
    local e = entity
    local type = (entity:is_enemy()) and "enemy-bullet" or "airwolf-bullet"
    local b = Bullet:new(e.x + p.x_offset, e.y + p.y_offset, type, p.sw, p.sh);
    entities:add_bullet(b)
    self.lb = time()
end

-- Returns true if there has been sufficient time since the last bullet.
function Shooter:bullet_cool_down() return t() - self.lb > self.bprops.interval end