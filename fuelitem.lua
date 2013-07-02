Class = require("hump.class")


fuelitem = Class{
    init = function(self, img)
        self.pos = {
		x = 0,
		y = 0
	}
        self.img = img
    end
}

function fuelitem:update(dt)
    -- see hump.vector
    --local dir = (player.pos - self.pos):normalize_inplace()
    --self.pos = self.pos + dir * Critter.speed * dt
end

function fuelitem:draw()
    love.graphics.draw(self.img, self.pos.x, self.pos.y)
end