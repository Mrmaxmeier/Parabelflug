function getRainbowCol()
	r = 0
	g = 255
	b = math.random(255)
	choices = {{r,g,b}, {b,r,g}, {g,b,r}, {r,b,g}, {b,g,r}, {g,r,b}}
	return choices[math.random(6)]
end

function setRainbowCol()
	col = getRainbowCol()
	love.graphics.setColor(col[1], col[2], col[3])
end

function collides(a, b)
	dx = a.x-b.x
	dy = a.y-b.y
	r = a.r + b.r
	return r^2 >= dx^2 + dy^2
end

function table.remVal(t, val)
	for i, v in ipairs(t) do
		if v == val then
			table.remove(t, i)
			return
		end
	end
end

function table.map(tbl, f)
    local t = {}
    for k,v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end