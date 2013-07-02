function love.load()
	require "player"
	
	front = love.graphics.newImage("assets/Front.png")
	mid = love.graphics.newImage("assets/Mid.png")
	back = love.graphics.newImage("assets/Back.png")
	images = {{img=back, speed=50}, {img=mid, speed=100},{img=front, speed=200}}
	scrolledPixel = 0
	player = Player:new(love.graphics.newImage("assets/Plane_Side.png"), 300, 200)
end

function love.update(dt)
	scrolledPixel = scrolledPixel + dt
	player:update(dt)
end

function love.draw()
	for i, v in ipairs(images) do
		w = v.img:getWidth()
		love.graphics.draw(v.img, -scrolledPixel*v.speed%w)
		love.graphics.draw(v.img, -scrolledPixel*v.speed%w - w)
	end
	player:draw()
end
