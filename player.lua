require "class"

Player = class:new()

function Player:init(img, x, y)
	self.img = img
	self.x = x
	self.y = y
	self.acc = 150
	self.slope = 0.002
	self.dy = 0
	
	self.dy_old = self.dy
	
	self.fuel = 5
	self.health = 5
	self.score = 0
	self.grav = -9.8
end

function Player:update(dt)
	self.dy_old = self.dy
	
	self.y = self.y + self.dy * dt
	self.dy = self.dy * 0.8^dt
	if love.keyboard.isDown("down") then
		self.dy = self.dy + dt*self.acc
	end
	if love.keyboard.isDown("up") then
		self.dy = self.dy - dt*self.acc
	end
	
	
	
	self.beschl = (self.dy - self.dy_old)/dt
	self.grav = self.beschl/10 - 16
	
	
	self.score = self.score + math.abs((1/self.grav))*dt
	--print(grav)
	
end

function Player:draw()
	love.graphics.draw(self.img, self.x, self.y, self.dy*self.slope, 0.75, 0.75, 300, 70)
end