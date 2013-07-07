require "class"
require "util"

fuel = class:new()

function fuel:init(img)
	self.x, self.y =  math.random(SIZEX + 10, SIZEX + 500), math.random(0, SIZEY)
	self.r = 40
	self.img = img
end

function fuel:update(dt)
	self.x = self.x - 200*dt
	if self.x < -SIZEX then
		print("removed Fuel")
		table.remVal(fuelitems, self)
	end
end

function fuel:draw()
	love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.img:getWidth()/2, self.img:getHeight()/2)
end
