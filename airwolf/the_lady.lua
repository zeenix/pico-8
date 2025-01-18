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

    local lpossible = e.x > -1
    local rpossible = (e.x + e.size.w) < 126
    local upossible = e.y > 0
    local dpossible = (e.y + e.size.h) < 128
    local lupossible = lpossible and upossible
    local ldpossible = lpossible and dpossible
    local rupossible = rpossible and upossible
    local rdpossible = rpossible and dpossible

    local d = nil
    local btns = buttons
    local b = btn()
    if b & btns.l_u == btns.l_u then
        if lupossible then d = "left-up"
        elseif lpossible then d = "left"
        elseif upossible then d = "up" end
    elseif b & btns.l_d == btns.l_d then
        if ldpossible then d = "left-down"
        elseif lpossible then d = "left"
        elseif dpossible then d = "down" end
    elseif b & btns.r_u == btns.r_u then
        if rupossible then d = "right-up"
        elseif rpossible then d = "right"
        elseif upossible then d = "up" end
    elseif b & btns.r_d == btns.r_d then
        if rdpossible then d = "right-down"
        elseif rpossible then d = "right"
        elseif dpossible then d = "down" end
    elseif b & btns.l == btns.l and lpossible then d = "left"
    elseif b & btns.r == btns.r and rpossible then d = "right"
    elseif b & btns.u == btns.u and upossible then d = "up"
    elseif b & btns.d == btns.d and dpossible then d = "down"
    end

    local on_collision = function(victim)
        if victim == "enemy-bullet" then
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