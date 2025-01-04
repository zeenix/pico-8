TheLady = {}
TheLady.__index = TheLady

function TheLady:new()
    local this = setmetatable({}, TheLady)
    this.x = 20
    this.y = 20
    this.sprite_num = 0
     -- width+height in number of sprites (IOW multiple of 8 pixels)
    this.width = 2
    this.height = 2
    this.bullets = Bullets:new("up")
    this.main_rotor = Rotor:new("main")
    this.tail_rotor = Rotor:new("tail")

    return this
end

function TheLady:update()
    self:move()
    self.main_rotor:update(self.x, self.y)
    self.tail_rotor:update(self.x, self.y)
    self.bullets:update(self.x, self.y)
end

function TheLady:draw()
    spr(self.sprite_num, self.x, self.y, self.width, self.height)

    self.main_rotor:draw()
    self.tail_rotor:draw()

    self.bullets:draw()
end

function TheLady:move()
    local b = buttons

    if btn(b.left) then self.x -= 1
    elseif btn(b.right) then self.x += 1 end

    if btn(b.down) then self.y += 1
    elseif btn(b.up) then self.y -= 1 end
end

