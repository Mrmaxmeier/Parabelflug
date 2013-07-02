require "class"

Player = class:new()

function Player:init(img, x, y)
	self.img = img
	self.x = x
	self.y = y
	self.acc = 100
	self.slope = 0.002
	self.dy = 0
	
	self.fuel = 0
end

function Player:update(dt)
	self.y = self.y + self.dy * dt
	self.dy = self.dy * 0.8^dt
	if love.keyboard.isDown("down") then
		self.dy = self.dy + dt*self.acc
	end
	if love.keyboard.isDown("up") then
		self.dy = self.dy - dt*self.acc
	end
end

function Player:draw()
	love.graphics.draw(self.img, self.x, self.y, self.dy*self.slope, 1, 1, 300, 70)
end