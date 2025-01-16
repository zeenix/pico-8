-- Scrolling Map
SMap = {}
SMap.__index = SMap

function SMap:new()
    local this = setmetatable({}, SMap)
    this.scroll = -128
    this.scrolling = true

    return this
end

function SMap:stop_scroll() self.scrolling = false end

function SMap:update()
    if (not self.scrolling) return

    local lasty = 128 * 16 - 128
    if (self.scroll >= lasty) self.scroll = -256

    self.scroll += 0.3
end

function SMap:draw()
    cls(colors.dark_blue)

    for i = 0, 7 do
        local tile_x = i * 16
        local map_y = i * -256 + self.scroll 
        map(tile_x, 0, 0, map_y, 16, 32)
    end
end