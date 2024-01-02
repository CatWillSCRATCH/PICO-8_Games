pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- i have no idea what i'm doing


entities = {}

card_speed = 1
card_anim_spd = 4
tempx = 0
tempy = 0

add(entities,{
	t = "card_spawn",
	x = 0,
	y = 0,
	l = -1
})

function ternary(a,b,c)
	if a==1 then
		return b
	else return c end
end

function summon_card(hpos,vpos,ron,dot,life)
	add(entities,{
		t = "card", -- type
		x = hpos,   -- horizontal position of summoning
		y = vpos,   -- vertical position of summoning
		d = dot,    -- dir of travel
		r = ron,    -- red or not
		l = life or 100,
		f = 4,
		fr = 0
	})
end

function summon_card_adv(column,row,ron,life)
	if column>=2 and column<=9 then
		if row<=0 then
			d = 3
		end
		if row>=8 then
			d = 2
		end
	end
	if row>=2 and row<=6 then
		if column<=0 then
			d = 1
		end
		if column>=11 then
			d = 0
		end
	end
	summon_card(2+(column*10),47+(row*8),ron,d,life)
	d = nil
end

function update_entities()
	for i in all(entities) do
		if i.l <= -1 then
		elseif i.l ==0 then
			del(entities,i)
		end
		if i.t == "card" then
			if i.d == 0 then
				i.x-=card_speed
			elseif i.d == 1 then
				i.x+=card_speed
			elseif i.d == 2 then
				i.y-=card_speed
			elseif i.d == 3 then
				i.y+=card_speed
			end
			
			if i.x>127 then
				i.x=-8
			end
			if i.x<-8 then
				i.x=127
			end
			if i.y>127 then
				i.y=-8
			end
			if i.y<-8 then
				i.y=127
			end
			i.f -= 1
			if i.f < 0 then
				i.fr += 1
				i.f = 4
			end
			if i.fr >= 4 then
				i.fr = 0
			end
		elseif i.t == "card_spawn" then
			i.x=2+(tempx*10)
			i.y=47+(tempy*8)
		end
		i.l -= 1
	end
end

function draw_entities()
	for i in all(entities) do
		if i.t == "card" then
			if i.r == true then
				pal(6,15)
				pal(5,8)
			end
			sspr(88+i.fr*10,0,10,10,i.x,i.y)
			pal()
		end
		if i.t == "card_spawn" then
			sspr(56,0,10,10,i.x,i.y)
		end
	end
end

function _update()
	update_entities()
	if btnp(0) then
		tempx-=1
	elseif btnp(1) then
		tempx+=1
	elseif btnp(2) then
		tempy-=1
	elseif btnp(3) then
		tempy+=1
	end
	if btnp(5) then
		summon_card_adv(tempx,tempy,1)	
	end
end

function _draw()
	cls()
	map()
	--print(tempx..","..tempy,0,0,7)
	draw_entities()
end
__gfx__
00000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000060000000000000000006000000000000000
00000000000000000000000000000000000000000000000000000000000060600000000000000000000000000000777000000000000000077700000067777600
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000007757700067777776000777770000075777700
00077000000000000000000000000000000000000000000000000000000000006000000000000000000000000077777770077777777007777777000077777700
00077000000000000000000000000000000000000000000000000000060000000600000000000000000000000777557776077755757067575577700077557700
00700700000000000000000000000000000000000000000000000000600000006000000000000000000000006777557770075755777007775575760077557700
00000000000000000000000000000000000000000000000000000000060000000000000000000000000000000777777700077777777000777777700077777700
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077577000067777776000077777000077775700
00000000000000000000000000000000000000000000000000000000000606000000000000000000000000000007770000000000000000007770000067777600
00000000000000000000000000000000000000000000000000000000000060000000000000000000000000000000600000000000000000000600000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001111111111111151511111111111115100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005555555155555111115555555555511100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005111115511115511155111111111551100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001115111515111511151115111511151100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001155511551511511151155515551151100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001115111515111511151115111511151100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005111115511115511155111111111551100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111111111115555555155555111115555555555511100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000151111111515111111111111151115111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111555551111155555555555111511155550001000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000115111155151551111111115515551551110011100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000115151115151511151115111515151511150001000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000115515115151511515155511515151511510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000115151115151511151115111515151511150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000115111155151551111111115515551551110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111555551111155555555555111511155550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111111111111151111111111111111151110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000110111011115111555555555551555111550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000101010101015515511151111155115515510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000010001000101515111511151115111515110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000010100001515115511515115511515110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000010001001001515111511151115111515110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005515511151111155115515510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000005111555555555551555111551000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000e5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000e50000e50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000e500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000d50000e500000000e5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000c0c1c1c1c1c1c1c1c1c1c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000d0e3c4d4e4d3e3c4d4e4c500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000d0c2d2e2e4d1c2d2e2e4c300d50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e5d0e3c4d4e4d3e3c4d4e4c500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000d0c2d2e2e4d1c2d2e2e4c300e50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000d0e3c4d4e4d3e3c4d4e4c500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000e0e1e1e1e1e1e1e1e1e1e100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
