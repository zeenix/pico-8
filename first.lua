function _init()
  xpos=63
  ypos=63
end

function _update()
	if btn(0) then
		xpos-=1
	end
	if btn(1) then
		xpos+=1
	end
	if btn(2) then
		ypos-=1
	end
	if btn(3) then
		ypos+=1
	end
end

function _draw()
  cls()
  spr(1,xpos,ypos)
end

