local fnt = Font.load("app0:assets/helpfont.ttf") 
while true do
	Graphics.initBlend()
	Screen.clear()
	Font.print(fnt, 425, 0, "HELP MENU 0.1", Color.new(255, 255, 255)) 
	Font.print(fnt, 10, 30, "BASIC FUNCTIONS", Color.new(255, 255, 255)) 
	Font.print(fnt, 22, 60, "[] - OPEN OR CLOSE MENU", Color.new(255, 255, 255)) 
	Font.print(fnt, 22, 75, "() - RUN A LUA FILE", Color.new(255, 255, 255)) 
	Font.print(fnt, 28, 90, "X - RUN A SELF FILE", Color.new(255, 255, 255)) 
	Font.print(fnt, 28, 120, "^ - SCROLL UP", Color.new(255, 255, 255)) 
	Font.print(fnt, 28, 135, "> - SPEED SCROLL DOWN", Color.new(255, 255, 255)) 
	Font.print(fnt, 28, 150, "v - SCROLL DOWN", Color.new(255, 255, 255)) 
	Font.print(fnt, 28, 165, "< - SPEED SCROLL UP", Color.new(255, 255, 255)) 
	Graphics.termBlend()
	Screen.flip()
	if Controls.check(Controls.read(), SCE_CTRL_SQUARE) then 
    System.wait(800000)
    Font.unload(fnt)
		break 
	end
end
