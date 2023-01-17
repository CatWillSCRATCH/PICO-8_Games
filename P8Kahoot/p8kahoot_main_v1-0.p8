pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- _draw()

function _draw()
	cls(6)
	print("score: "..score,1,122,1)
	if question == 1 then
	 correct = 4
	 min_sel = 1
	 max_sel = 4
	 rectfill(20,15,108,55,2)
	 set_timer(10)
	 draw_timer(9,36,1,2,7)
	 draw_question(2,"should i text aaliyah after this?",1,7,1)
	 draw_button(1,8,60,52,25,"yes",2,8,7,7)
		draw_button(2,68,60,52,25,"no",13,12,7,7)
		draw_button(3,8,93,52,25,"maybe",9,10,7,7)
		draw_button(4,68,93,52,25,"walmart bag",3,11,7,7)
 elseif question == 2 then
 	correct = 2
	 min_sel = 1
	 max_sel = 4
	 rectfill(20,15,108,55,11)
	 set_timer(10)
	 draw_timer(9,36,1,2,7)
	 draw_question(2,"should i play a game after this?",1,7,1)
	 draw_button(1,8,60,52,25,"walmart bag",2,8,7,7)
		draw_button(2,68,60,52,25,"yes",13,12,7,7)
		draw_button(3,8,93,52,25,"dillons bag",9,10,7,7)
		draw_button(4,68,93,52,25,"target bag",3,11,7,7)
 elseif question == 3 then
  correct = 4
  min_sel = 1
	 max_sel = 4
  rectfill(20,16,108,55,8)
  set_timer(10)
  draw_timer(9,36,1,2,7)
  draw_question(2,"what game?",1,7,1)
  draw_button(1,8,60,52,25,"minecraft.",2,8,7,7)
		draw_button(2,68,60,52,25,"answer: minecraft.",13,12,7,7)
		draw_button(3,8,93,52,25,"jumanji",9,10,7,7)
		draw_button(4,68,93,52,25,"kayser chooses",3,11,7,7)
 elseif question == 4 then
 	correct = 3
  min_sel = 1
	 max_sel = 4
  rectfill(20,16,108,55,12)
  set_timer(10)
  draw_timer(9,36,1,2,7)
  draw_question(2,"kayser chooses:",1,7,1)
  draw_button(1,8,60,52,25,"quidditch",2,8,7,7)
		draw_button(2,68,60,52,25,"minecraft",13,12,7,7)
		draw_button(3,8,93,52,25,"pico-8 kahoot",9,10,7,7)
		draw_button(4,68,93,52,25,"coloring",3,11,7,7)
 elseif question == 5 then
  draw_mult_choice_q(3,12,10,"kayser chooses:","quidditch","minecraft","pico-8 kahoot","coloring",1,4)
 elseif question == 6 then
  draw_true_false_q(1,15,10,"which is better:","minecraft","fortnite",1,2)
 elseif question == 7 then
 	correct = 2
  min_sel = 1
	 max_sel = 10
  rectfill(20,16,108,55,8)
  set_timer(35)
  draw_timer(70,70,1,2,7)
  draw_question(2,"is lucy cute?",1,7,1)
  draw_button(1,8,60,32,11,"yes",2,8,7,7)
		draw_button(2,48,60,32,11,"definitely",13,12,7,7)
		draw_button(3,88,60,32,11,"absolutely",9,10,7,7)
		draw_button(4,8,79,32,11,"no",3,11,7,7)
  draw_button(5,48,79,32,11,"absolutely not",13,12,7,7)
		draw_button(6,88,79,32,11,"definitely not",9,10,7,7)
  draw_button(7,8,98,32,11,"maybe",3,11,7,7)
  draw_button(8,48,98,32,11,"amazing*",13,12,7,7)
		draw_button(9,88,98,32,11,"cutest",9,10,7,7)
  draw_button(10,48,117,32,11,"adorable",3,11,7,7) 
 elseif question >= 7.5 then
 	print_centered("end of demo!",64,59,0,0,1)
 	print_centered("your score: "..score,64,65,0,0,1)
  correct = 0
 else
 	correct = 0
 	print_centered("press ❎ to continue",64,64,0,0,1)
 end
end
-->8
-- functions and _init()

function _init()
 btn0 = 0
 btn1 = 0
 btn2 = 0
 btn3 = 0
 btn5 = 0
 selected = 1
 max_sel = 0
 min_sel = 0
	score = 0
	question = .5
	correct = 0
	chosen = 0
	timer_s = 0
	timer_f = 0
	timer_max = 0
	set_timer_lock = 0
	in_between = 0
	function print_centered(text,x,y,sx,sy,c)
		local w = print(text,0,-20)
		print(text,(x+(sx-(sx/2)))-(w/2)+1.5,(y+(sy-(sy/2)))-2,c)
	end
	function draw_button(id,x,y,sx,sy,text,oc,fc,sc,tc) -- sx - size x, sy - size y, 0c - outline col., fc - fill col., sc - select col., tc - text col.
  -- check if selected
  if id == selected then
  	-- draw outline but with sc
  	rect(x,y,x+sx,y+sy,sc)
  else
   -- draw outline with normal color
   rect(x,y,x+sx,y+sy,oc)
  end
  rectfill(x+1,y+1,x+sx-1,y+sy-1,fc)
  print_centered(text,x,y,sx,sy,tc)
 end
 function draw_question(y,text,oc,fc,tc)
  local w = print(text,0,-128)
  draw_button(-69,64-(w-w/2),y,w+4,9,text,oc,fc,7,tc)
 end
 function draw_timer(x,y,oc,fc,tc)
 	circ(x,y,8,oc)
 	circfill(x,y,7,fc)
 	print_centered(ceil(timer_s),x,y,0,0,tc)
 end
 function set_timer(seconds)
  if set_timer_lock == 0 then
  	timer_max = seconds
  	timer_f = seconds*30
   timer_s = seconds
   set_timer_lock = 1
  else end 
 end
 function draw_mult_choice_q(correct_ans,rectcol,timeleft,question,a1,a2,a3,a4,minsel,maxsel)
 	correct = correct_ans
  rectfill(20,16,108,55,rectcol)
  set_timer(timeleft)
  draw_timer(9,36,1,2,7)
  draw_question(2,question,1,7,1)
  draw_button(1,8,60,52,25,a1,2,8,7,7)
		draw_button(2,68,60,52,25,a2,13,12,7,7)
		draw_button(3,8,93,52,25,a3,9,10,7,7)
		draw_button(4,68,93,52,25,a4,3,11,7,7)
  max_sel = maxsel
  min_sel = minsel
 end
 function draw_true_false_q(correct_ans,rectcol,timeleft,question,a1,a2,minsel,maxsel)
  correct = correct_ans
  rectfill(20,16,108,55,rectcol)
  set_timer(timeleft)
  draw_timer(9,36,1,2,7)
  draw_question(2,question,1,7,1)
  draw_button(1,8,60,112,25,a1,2,8,7,7)
  draw_button(2,8,93,112,25,a2,13,12,7,7)
  max_sel = maxsel
  min_sel = minsel
 end
end
-->8
-- _update()

function _update()
 timer_f -= 1
 timer_s -= .033
 if max(selected,max_sel+1) == selected then
 	selected = max_sel
 end
 if min(selected,min_sel-1) == selected then
 	selected = min_sel
 end
 if max_sel == 4 then
		if btn(0) then
			if btn0 == 0 then
				btn0 = 1
				if selected == 1 or selected == 3 then
				else
				 selected -= 1
				end
			end
		else
			btn0 = 0
		end
		if btn(1) then
			if btn1 == 0 then
				btn1 = 1
				if selected == 2 or selected == 4 then
				else
					selected += 1
				end
			end
		else
			btn1 = 0
		end
		if btn(2) then
			if btn2 == 0 then
				btn2 = 1
				if selected <= 2 then
				else
					selected -= 2
				end
			end
		else
			btn2 = 0
		end
		if btn(3) then
			if btn3 == 0 then
				btn3 = 1
				if selected >= 3 then
				else
					selected += 2
				end
			end
		else
			btn3 = 0
		end
	elseif max_sel == 2 then
		if btn(2) then
			if btn2 == 0 then
				btn2 = 1
				if selected <= 1 then
				else
					selected -= 1
				end
			end
		else
			btn2 = 0
		end
		if btn(3) then
			if btn3 == 0 then
				btn3 = 1
				if selected >= 2 then
				else
					selected += 1
				end
			end
		else
			btn3 = 0
		end
	else
		if btn(0) then
			if btn0 == 0 then
				btn0 = 1
			 selected -= 1
			end
		else
			btn0 = 0
		end
		if btn(1) then
			if btn1 == 0 then
				btn1 = 1
				selected += 1
			end
		else
			btn1 = 0
		end
	end
	if btn(5) then
 	if btn5 == 0 then
 	 btn5 = 1
 		chosen = selected
 		if chosen == correct then
 			if ceil(timer_s*1000/timer_max) >= 0 then
 			 score += ceil(timer_s*1000/timer_max)
 			 question += .5
 			else
 			 question += .5
 		 end
 		else
 		 question += .5
 		end
 		set_timer_lock = 0
 	end
 else
  btn5 = 0
 end
 if ceil(timer_s) == -1 and (question/2*4)%2 == 0 then
		question += .5 
	end
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666661111111111111111111111111111111111111111111111111111111111111111166666666666666666666666666666
66666666666666666666666666666666661777777777777777777777777777777777777777777777777777777777777777166666666666666666666666666666
66666666666666666666666666666666661771717111717177117111711177777711717177117711771171117711777777166666666666666666666666666666
66666666666666666666666666666666661771717171717171777177717177777177717171717171717771777177771777166666666666666666666666666666
66666666666666666666666666666666661771177111711171117117711777777177711171717171711171177111777777166666666666666666666666666666
66666666666666666666666666666666661771717171777177717177717177777177717171717171777171777771771777166666666666666666666666666666
66666666666666666666666666666666661771717171711171177111717177777711717171177117711771117117777777166666666666666666666666666666
66666666666666666666666666666666661777777777777777777777777777777777777777777777777777777777777777166666666666666666666666666666
66666666666666666666666666666666661777777777777777777777777777777777777777777777777777777777777777166666666666666666666666666666
66666666666666666666666666666666661111111111111111111111111111111111111111111111111111111111111111166666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666661111166666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666112222211666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66661222222222166666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66612222222222216666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66122222222222221666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66122222222222221666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
61222222777222222166ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
61222222227222222166ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
61222222227222222166ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
61222222227222222166ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
61222222227222222166ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66122222222222221666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66122222222222221666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66612222222222216666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66661222222222166666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666112222211666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666661111166666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666222222222222222222222222222222222222222222222222222226666666ddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888878878787778778877887778777887787878888888826666666dcccccccc777c777c77cc777cc77c777c777c777c777ccccccccd6666666
66666666288888888787878788788787878788788878878887878888888826666666dcccccccc777cc7cc7c7c7ccc7ccc7c7c7c7c7cccc7cccccccccd6666666
66666666288888888787878788788787878788788878878887778888888826666666dcccccccc7c7cc7cc7c7c77cc7ccc77cc777c77ccc7cccccccccd6666666
66666666288888888778878788788787878788788878878887878888888826666666dcccccccc7c7cc7cc7c7c7ccc7ccc7c7c7c7c7cccc7cccccccccd6666666
66666666288888888877887787778777877787778878887787878888888826666666dcccccccc7c7c777c7c7c777cc77c7c7c7c7c7cccc7cccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666288888888888888888888888888888888888888888888888888826666666dcccccccccccccccccccccccccccccccccccccccccccccccccccd6666666
66666666222222222222222222222222222222222222222222222222222226666666ddddddddddddddddddddddddddddddddddddddddddddddddddddd6666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666777777777777777777777777777777777777777777777777777776666666333333333333333333333333333333333333333333333333333336666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667777a777aa77aa77aaaaa777aaaaa7a7a777a7a7aa77aa77a777766666663bbbbbbbbbbb77bb77b7bbbb77b777b777b77bbb77bbbbbbbbbb36666666
6666666677a7aa7aa7aaa7a7aaaaa7a7aaaaa7a7a7a7a7a7a7a7a7a7aa7a766666663bbbbbbbbbb7bbb7b7b7bbb7b7b7b7bb7bb7b7b7bbbbbbbbbbbb36666666
666666667777aa7aa7aaa7a7a777a777aaaaa77aa777a777a7a7a7a7aa7a766666663bbbbbbbbbb7bbb7b7b7bbb7b7b77bbb7bb7b7b7bbbbbbbbbbbb36666666
6666666677aaaa7aa7aaa7a7aaaaa7a7aaaaa7a7a7a7a7a7a7a7a7a7aa7a766666663bbbbbbbbbb7bbb7b7b7bbb7b7b7b7bb7bb7b7b7b7bbbbbbbbbb36666666
6666666677aaa777aa77a77aaaaaa777aaaaa7a7a7a7a7a7a77aa77aaa7a766666663bbbbbbbbbbb77b77bb777b77bb7b7b777b7b7b777bbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
666666667aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa766666663bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb36666666
66666666777777777777777777777777777777777777777777777777777776666666333333333333333333333333333333333333333333333333333336666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66116611661161116111666666666116611161116111666666666666666666666666666666666666666666666666666666666666666666666666666666666666
61666166616161616166661666666616666166616661666666666666666666666666666666666666666666666666666666666666666666666666666666666666
61116166616161166116666666666616666166616611666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66616166616161616166661666666616666166616661666666666666666666666666666666666666666666666666666666666666666666666666666666666666
61166611611661616111666666666111666166616111666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666

