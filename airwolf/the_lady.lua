TheLady = {}
TheLady.__index = TheLady

function TheLady:new()
    local this = setmetatable({}, TheLady)
    local sprite = { num = 1, w = 1, h = 1 }
    local size = { w = 8, h = 8 }
    this.entity = Entity:new(63, 111, sprite, "airwolf", size)
    local bullet_props = {
        x_offset = 0,
        y_offset = -1,
        interval = 0.4,
        sw = 1,
        sh = 1,
    }
    this.shooter = Shooter:new(bullet_props)
    this.main_rotor = Rotor:new({x = 4, y = 3, length = 4})
    this.tail_rotor = Rotor:new({x = 4, y = 7, length = 1})

    return this
end

-- Returns true if the aircraft has gone outside the screen.
function TheLady:update()
    local outside = false
    if scene == "game" then
        outside = self:move()
    end

    self.shooter:update(self.entity)
    self.main_rotor:update(self.entity)
    self.tail_rotor:update(self.entity)

    return outside
end

function TheLady:draw()
    self.entity:draw()
    self.main_rotor:draw()
    self.tail_rotor:draw()
end

function TheLady:move()
    local e = self.entity

    local can_l = e.x > -1
    local can_r = (e.x + e.size.w) < 126
    local can_u = e.y > 0
    local can_d = (e.y + e.size.h) < 128
    local can_lu = can_l and can_u
    local can_ld = can_l and can_d
    local can_ru = can_r and can_u
    local can_rd = can_r and can_d

    local d = nil
    local m = buttons.mask
    local b = btn()
    if b & m.left_up == m.left_up then
        if can_lu then d = "left-up"
        elseif can_l then d = "left"
        elseif can_u then d = "up" end
    elseif b & m.left_down == m.left_down then
        if can_ld then d = "left-down"
        elseif can_l then d = "left"
        elseif can_d then d = "down" end
    elseif b & m.right_up == m.right_up then
        if can_ru then d = "right-up"
        elseif can_r then d = "right"
        elseif can_u then d = "up" end
    elseif b & m.right_down == m.right_down then
        if can_rd then d = "right-down"
        elseif can_r then d = "right"
        elseif can_d then d = "down" end
    elseif b & m.left == m.left and can_l then d = "left"
    elseif b & m.right == m.right and can_r then d = "right"
    elseif b & m.up == m.up and can_u then d = "up"
    elseif b & m.down == m.down and can_d then d = "down"
    end

    local on_collision = function(victim)
        if victim.entity.type == "enemy-bullet" then
            self:hit()
        end
    end
    self.entity:move(d, 0.7, on_collision)

    return false
end

function TheLady:hit()
    sfx(1)

    -- TODO: Should be able to take a few hits before game over.
    game_over()
end