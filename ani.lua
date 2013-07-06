require "class"

AnimatedImg = class:new()

anis = {}

function AnimatedImg:init(img, steps)
	self.t = 0
	self.img = img
	self.steps = steps
	table.insert(anis, self)
end

function AnimatedImg:update(dt)
	self.t = self.t + dt
end

function AnimatedImg:draw()
	repeat
		coords = self.steps[1]:coords(self.t)
		if not coords then
			table.remove(self.steps, 1)
			if table.getn(self.steps) < 1 then
				table.remVal(anis, self)
				self.t = 0
				return
			end
		end
	until coords
	local c = coords
	love.graphics.draw(self.img, c.x, c.y, c.rot, c.sx, c.sy, c.ox, c.oy)
end

function linear(a, b, t, k)
	return a*(1-t) + b*t
end

stdCoords = {x=0, y=0, rot=0, sx=1, sy=1, ox=0, oy=0}

function stdCoords:with(changes)
	local res = {}
	for k, v in pairs(self) do
		res[k]=v
	end
	for k, v in pairs(changes) do
		res[k]=v
	end
	return res
end

Step = class:new()

function Step:init(conf)
	self.t = conf.t or 1
	self.a = stdCoords:with(conf.a)
	print(self.a.x)
	self.b = stdCoords:with(conf.b)
	print(self.b.x)
	self.interp = conf.interp or linear
end

function Step:coords(t)
	if t > self.t then return end
	tval = t / self.t
	res = {}
	for i, k in ipairs({"x", "y", "rot", "sx", "sy", "ox", "oy"}) do
		local va = self.a[k]
		local vb = self.b[k]
		res[k] = self.interp(va, vb, tval, k)
	end
	return res
end
