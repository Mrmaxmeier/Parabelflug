function love.load()
	--Vars
	lg = love.graphics
	graphicmode = 4
	fsaa = 0
	fullscreen = false
        modes = love.graphics.getModes()
        SIZEX = modes[graphicmode].width
        SIZEY = modes[graphicmode].height
	lg.setMode( SIZEX, SIZEY, fullscreen, vsync, fsaa )
	for i, mode in ipairs(modes) do
		print("X: ",modes[i].width)
		print("Y: ",modes[i].height)
	end
	
	require "player"
	
	require "bombitem"
	require "fuelitem"
	
	
	--Assets
	heart = lg.newImage("assets/Heart.png")
	
	
	front = love.graphics.newImage("assets/Front.png")
	mid = love.graphics.newImage("assets/Mid.png")
	back = love.graphics.newImage("assets/Back.png")
	images = {{img=back, speed=50}, {img=mid, speed=100},{img=front, speed=200}}
	scrolledPixel = 0
	player = Player:new(love.graphics.newImage("assets/Plane_Side.png"), 300, 200)
	fuelpic = love.graphics.newImage("assets/Fuel.png")
	fuelitems = {}
	bombpic = love.graphics.newImage("assets/Bomb.png")
	bombitems = {}
end

function love.update(dt)
	scrolledPixel = scrolledPixel + dt
	player:update(dt)
	
	for i, fuelitem in ipairs(fuelitems) do
		fuelitem:update(dt)
	end
	for i, bombitem in ipairs(bombitems) do
		bombitem:update(dt)
	end
	
	if math.random() < dt*0.5 then
		table.insert(fuelitems, fuel:new(fuelpic))
		table.insert(bombitems, bomb:new(bombpic))
	end
end

function love.draw()
	for i, v in ipairs(images) do
		w = v.img:getWidth()
		love.graphics.draw(v.img, -scrolledPixel*v.speed%w)
		love.graphics.draw(v.img, -scrolledPixel*v.speed%w - w)
	end
	
	player:draw()
	
	for i, fuelitem in ipairs(fuelitems) do
		fuelitem:draw()
	end
	for i, bombitem in ipairs(bombitems) do
		bombitem:draw()
	end
	
	--HUD
	print("Health: ",player.health," Fuel:", player.fuel)
	for healthNo = 0, player.health - 1 do
		lg.draw(heart, healthNo * 50, 10,  0, 0.1, 0.1)
	end
	for fuelNo = 0, player.fuel - 1 do
		lg.draw(fuelpic, SIZEX - fuelNo * 50 - fuelpic:getWidth(), 10,  0, 1, 1)
	end
	
end