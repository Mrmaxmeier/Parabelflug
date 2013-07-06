function love.load()
	--Vars
	lg = love.graphics
	--[[graphicmode = 4
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
	--]]
	require "ani"
	require "player"
	
	require "bombitem"
	require "fuelitem"
	
	
	--Assets
	heart = lg.newImage("assets/Heart.png")
	sicknesssplash = lg.newImage("assets/SicknessSplash.png")
	
	
	front = love.graphics.newImage("assets/Front.png")
	mid = love.graphics.newImage("assets/Mid.png")
	back = love.graphics.newImage("assets/Back.png")
	images = {{img=back, speed=50}, {img=mid, speed=100},{img=front, speed=200}}
	scrolledPixel = 0
	player = Player:new(love.graphics.newImage("assets/Plane_Side.png"), sicknesssplash, 300, 200)
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
	
	if math.random() < dt*0.125 then
		table.insert(fuelitems, fuel:new(fuelpic))
		table.insert(bombitems, bomb:new(bombpic))
	end
	for k, ani in ipairs(anis) do
		ani:update(dt)
	end
end

function love.draw()
	for i, v in ipairs(images) do
		w = v.img:getWidth()
		love.graphics.draw(v.img, -scrolledPixel*v.speed%w)
		love.graphics.draw(v.img, -scrolledPixel*v.speed%w - w)
	end
	
	
	for i, fuelitem in ipairs(fuelitems) do
		fuelitem:draw()
		if collides(player, fuelitem) then
			print "fuuueeel"
			player.fuel = player.fuel + 1
			table.remVal(fuelitems, fuelitem)
		end
	end
	for i, bombitem in ipairs(bombitems) do
		bombitem:draw()
		if collides(player, bombitem) then
			print "booooommmmmmbbbb"
			player.health = player.health - 1
			table.remVal(bombitems, bombitem)
		end
	end
	
	--HUD
	--print("Health: ",player.health," Fuel:", player.fuel)
	
	for healthNo = 0, player.health - 1 do
		lg.draw(heart, 10 + healthNo*30, 10,  0, 0.075, 0.075)
	end
	for fuelNo = 0, math.floor(player.fuel - 1) do
		if fuelNo+2 > player.fuel then
			local a = 255 * (player.fuel - math.floor(player.fuel))
			love.graphics.setColor(255,255,255,a)
		end
		lg.draw(fuelpic, 10 + SIZEX - fuelNo*30 - fuelpic:getWidth(), 7,  0, 0.7, 0.7)
		love.graphics.setColor(255,255,255,255)
	end
	
	lg.print("Score: "..tostring(math.floor(player.score)), SIZEX/2 - 40, 0, 0, 2, 2)
	lg.print("Gravitation: "..tostring(math.floor(player.grav)), SIZEX/2, 20, 0, 1, 1)
	
	
	if player.dead == 1 then
		lg.print("TOOOOOOOOOT", SIZEX/2, 50, 0, 1, 1)
	end
	--Player
	
	for k, ani in ipairs(anis) do
		ani:draw()
	end
	
	player:draw()
end