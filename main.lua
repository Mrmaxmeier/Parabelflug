function love.load()
	front = love.graphics.newImage("assets/Front.png")
	mid = love.graphics.newImage("assets/Mid.png")
	back = love.graphics.newImage("assets/Back.png")
	images = {{img=back, speed=50}, {img=mid, speed=100},{img=front, speed=200}}
	n = 0
end

function love.update(dt)
	n = n + dt
end

function love.draw()
	for i, v in ipairs(images) do
		w = v.img:getWidth()
		love.graphics.draw(v.img, -n*v.speed%w)
		love.graphics.draw(v.img, -n*v.speed%w - w)
	end
end