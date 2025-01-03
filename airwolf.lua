function _init()
    pi = 3.14159265359

    poke(0x5f36,0x2)

    airwolf = {
        x = 20,
        y = 20,
        sprite_num = 0,
        -- width+height in number of sprites (IOW multiple of 8 pixels)
        width = 2,
        height = 2,
        angle = 0,

        update = function(self)
            local speed = 4
            local blade_length = 6

            self.move(self)

            self.angle += speed
            -- Keep within 0 to 2*pi
            self.angle = self.angle % (2 * pi)

            local a = (self.angle / (2 * pi)) + 0.5  -- Convert to brads
            self.blade_coords = {
                x1 = self.x + cos(a) * blade_length + 8,
                y1 = self.y + sin(a) * blade_length + 6,
                x2 = self.x - cos(a) * blade_length + 8,
                y2 = self.y - sin(a) * blade_length + 6,
            }
        end,

        draw = function(self)
            spr(self.sprite_num, self.x, self.y, self.width, self.height)

            local coords = self.blade_coords
            -- The main rotor
            line(coords.x1, coords.y1, coords.x2, coords.y2, 5)

            -- The tail rotor
            circ(self.x + 8, self.y + 14, 1, 13)
        end,

        move = function(self)
            local b = buttons

            if btn(b.left) then self.x -= 1
            elseif btn(b.right) then self.x += 1 end

            if btn(b.down) then self.y += 1
            elseif btn(b.up) then self.y -= 1 end
        end
    }
end

function _update()
    airwolf:update()
end

function _draw()
    cls(3)
    airwolf:draw()
end
