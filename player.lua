require "class"

Player = class:new()

function Player:init(img, sicknesssplash, x, y)
	self.img = img
	self.sicknesssplash = sicknesssplash
	self.x = x
	self.y = y
	self.r = 90
	self.acc = 150
	self.slope = 0.002
	self.dy = 0
	
	self.dy_old = self.dy
	
	self.fuel = 5
	self.health = 5
	self.score = 0
	self.grav = -9.8
	self.sickness = 0
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
	
	self.fuel = self.fuel - dt*0.1
	
	if self.fuel < 1 then
		self.fuel = 5
		self.health = self.health - 1
	end
	
	if self.health < 1 then
		self.dead = 1
		print("TOOOOOT")
	end
	
	self.beschl = (self.dy - self.dy_old)/dt
	self.grav = self.beschl/10 - 16
	
	
	self.sickness = self.sickness * (1-dt/2) + (math.abs((1/self.grav))*dt)/4
	print(self.sickness)
	
	self.score = self.score + math.abs((1/self.grav))*dt
	--print(grav)
	
end

function Player:draw()
	
	


	love.graphics.setColor(255,255,255,255)
	
	love.graphics.draw(self.img, self.x, self.y, self.dy*self.slope, 0.75, 0.75, 300, 70)

	lg.setColor(255,255,255,self.sickness*255)
	lg.draw(self.sicknesssplash, self.x, self.y, 0, 1, 1, 150, 150)
	love.graphics.setColor(255,255,255,255)
end