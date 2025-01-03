Bullets = {}
Bullets.__index = Bullets

function Bullets:new(x, y)
    local this = setmetatable({}, Bullets)
    this.bullets = {}
    this.last_bullet = time()

    return this
end

function Bullets:update(x, y)
    for i, b in ipairs(self.bullets) do
        if b:update() then
            deli(self.bullets, i)
        end
    end
    if time() - self.last_bullet > 0.2 then
        if btn(buttons.o) then
            add(self.bullets, Bullet:new(x + 8, y - 1))
            self.last_bullet = time()
        end
    end
end

function Bullets:draw()
    for b in all(self.bullets) do
        b:draw()
    end
end
