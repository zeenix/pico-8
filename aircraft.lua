Aircraft = {}
Aircraft.__index = Aircraft

function Aircraft:new(x, y, width, height, sprite, rotor_props)
    local this = setmetatable({}, Aircraft)
    this.x = x
    this.y = y
    this.sprite_num = sprite
     -- width+height in number of sprites (IOW multiple of 8 pixels)
    this.width = width
    this.height = height
    local enemy = this:is_enemy()
    this.bullets = Bullets:new(is_enemy)
    this.main_rotor = Rotor:new(rotor_props[1])
    this.tail_rotor = Rotor:new(rotor_props[2])

    return this
end

function Aircraft:airwolf()
    local rotor_props = {
        {x = 8, y = 6, length = 6}, -- Main rotor
        {x = 8, y = 14, length = 2}, -- Tail rotor
    }
    return Aircraft:new(63, 111, 2, 2, 0, rotor_props)
end

function Aircraft:enemy_heli_small()
    local rotor_props = {
        {x = 4, y = 4, length = 2}, -- Main rotor
        {x = 3, y = 0, length = 1}, -- Tail rotor
    }
    return Aircraft:new(20, 0, 1, 1, 2, rotor_props)
end

-- Returns true if the aircraft has gone outside the screen.
function Aircraft:update()
    if self:move() then return true end

    self.main_rotor:update(self.x, self.y)
    self.tail_rotor:update(self.x, self.y)
    self.bullets:update(self.x, self.y)

    return false
end

function Aircraft:draw()
    spr(self.sprite_num, self.x, self.y, self.width, self.height)

    self.main_rotor:draw()
    self.tail_rotor:draw()

    self.bullets:draw()
end

-- Returns true if the aircraft has gone outside the screen.
function Aircraft:move()
    if self:is_enemy() then
        -- Enemy aircraft just moves slowly down the screen but horizontally
        -- towards the player.
        self.y += 0.5
        if self.x < airwolf.x then self.x += 0.3
        elseif self.x > airwolf.x then self.x -= 0.3 end
    else
        local b = buttons

        if btn(b.left) then self.x -= 1
        elseif btn(b.right) then self.x += 1 end

        if btn(b.down) then self.y += 1
        elseif btn(b.up) then self.y -= 1 end
    end

    return (self.x < 0 or self.x > 127 or self.y < 0 or self.y > 127)
end

function Aircraft:is_enemy()
    return fget(self.sprite_num, 7)
end