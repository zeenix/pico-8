Bullets = {}
Bullets.__index = Bullets

function Bullets:new(is_enemy)
    local this = setmetatable({}, Bullets)
    this.bullets = {}
    this.last_bullet = time()
    this.is_enemy = is_enemy

    return this
end

function Bullets:update(x, y)
    for i, b in ipairs(self.bullets) do
        if b:update() then
            deli(self.bullets, i)
        end
    end
    if self:bullet_cool_down() then
        if self.is_enemy then
            self:enemy_shoot(x, y)
        else
            self:airworlf_shoot(x, y)
        end
    end
end

function Bullets:draw()
    for b in all(self.bullets) do
        b:draw()
    end
end

function Bullets:airworlf_shoot(x, y)
    if not(btn(buttons.o)) then
        return
    end

    local b = Bullet:new(x + 8, y - 1, self.is_enemy);
    add(self.bullets, b)
    self.last_bullet = time()
end

function Bullets:enemy_shoot(x, y)
    local b = Bullet:new(x + 4, y + 4, self.is_enemy);
    add(self.bullets, b)
    self.last_bullet = time()
end

-- Returns true if there has been sufficient time since the last bullet.
function Bullets:bullet_cool_down()
    local duration = time() - self.last_bullet

    if self.is_enemy then
        -- Longer duration for enemy bullets because they shoot continuously &
        -- automatically.
        return duration > 1
    else
        return duration > 0.2
    end
end