pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
-- _draw()

function _draw()
	cls(6)
	print("score: "..score,1,122,1)
	if question == 0.5 then
		draw_question(40,"random questions",1,7,1)
  draw_question(64,"press ❎ to continue",1,7,1)
	elseif question == 1 then
	 draw_mult_choice_q(4,2,15,"what is 2+3?","6","-1","1","5",1,4)
 elseif question == 2 then
  draw_true_false_q(1,1,15,"true/false: pigs are pink.","true","false",1,2)
	elseif question == 3 then
	 draw_mult_choice_q(2,5,30,"what color is this sharpie?","red","blue","yellow","green",1,4)
 elseif question == 4 then
  draw_mult_choice_q(3,14,15,"ask mom the answer or guess.","seriously?","what?","i don't know.","no.",1,4)
 elseif question == 5 then
 	draw_mult_choice_q(4,12,30,"sort gr. to le.: 1, 7, 8, 3","7, 8, 1, 3","8, 7, 1, 3","1, 3, 7, 8","8, 7, 3, 1",1,4)
 elseif question == 6 then
 	draw_true_false_q(2,11,15,"kahoot backwards is tohaat.","true","false",1,2)
 elseif question == 7 then
 	draw_mult_choice_q(1,7,15,"……… once told me...","somebody","you","nobody","us",1,4)	
	elseif question >= 7.5 then
 	print_centered("end of demo!",64,59,0,0,1)
 	print_centered("your score: "..score,64,65,0,0,1)
  correct = 0
 else
 	correct = 0
 	draw_question(64,"press ❎ to continue",1,7,1)
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
