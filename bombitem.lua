require "class"
require "util"

bomb = class:new()

function bomb:init(img)
	self.x, self.y =  math.random(SIZEX + 10, SIZEX + 500), math.random(0, SIZEY)
	self.r = 80*0.5
	self.img = img
end

function bomb:update(dt)
	self.x = self.x - 200*dt
	if self.x < -SIZEX then
		print("removed Bomb")
		table.remVal(bombitems, self)
	end
end

function bomb:draw()
	love.graphics.draw(self.img, self.x, self.y, 0, 0.5, 0.5, 160, 160)
end
