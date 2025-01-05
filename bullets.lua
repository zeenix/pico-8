Bullets = {}
Bullets.__index = Bullets

function Bullets:new()
    local this = setmetatable({}, Bullets)
    this.bullets = {}

    return this
end

function Bullets:update(x, y)
    for i, b in ipairs(self.bullets) do
        if b:update() then
            deli(self.bullets, i)
        end
    end
end

function Bullets:draw()
    for b in all(self.bullets) do
        b:draw()
    end
end

function Bullets:add(bullet)
    add(self.bullets, bullet)
end