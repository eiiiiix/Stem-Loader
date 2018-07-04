white = Color.new(255, 255, 255)
cyan = Color.new(0, 255, 255)
::start::
selfs = System.listDirectory("app0:")
image = Graphics.loadImage("app0:sce_sys/pic0.png")
i = 1

while true do
   y = 75+(-i*20)

   Graphics.initBlend()
   Screen.clear()
   Graphics.drawImage(0, 0, image)
   Graphics.debugPrint(250, 25, "StemLoader v0.4 - Vita SELF/LUA Loader", white)
   
   for j, file in pairs(selfs) do
      x = 5
      if i == j then
         color = cyan
         x = 10
      else
         color = white
      end
      Graphics.debugPrint(x, y, file.name, color)
      y = y + 20
   end
   Graphics.termBlend()

   pad = Controls.read()
   if Controls.check(pad, SCE_CTRL_CROSS) then
      Graphics.initBlend()
      Screen.clear()
      Graphics.termBlend()
      Screen.flip()
      Graphics.initBlend()
      Screen.clear()
      Graphics.termBlend()
      System.wait(800000)
      System.launchEboot("app0:" .. selfs[i].name)
   elseif Controls.check(pad, SCE_CTRL_CIRCLE) then
      Graphics.initBlend()
      Screen.clear()
      Graphics.termBlend()
      Screen.flip()
      Graphics.initBlend()
      Screen.clear()
      Graphics.termBlend()
      System.wait(800000)
      dofile("app0:" .. selfs[i].name)
   elseif Controls.check(pad, SCE_CTRL_SQUARE) then
      Graphics.initBlend()
      Screen.clear()
      Graphics.termBlend()
      Screen.flip()
      Graphics.initBlend()
      Screen.clear()
      Graphics.termBlend()
      System.wait(800000)
      dofile("app0:assets/help.lua")
   elseif Controls.check(pad, SCE_CTRL_TRIANGLE) then
      System.deleteFile("ux0:app/STEM00001/" .. selfs[i].name)
      goto start
   elseif Controls.check(pad, SCE_CTRL_UP) and not Controls.check(oldpad, SCE_CTRL_UP) then
      i = i - 1
   elseif Controls.check(pad, SCE_CTRL_DOWN) and not Controls.check(oldpad, SCE_CTRL_DOWN) then
      i = i + 1
   elseif Controls.check(pad, SCE_CTRL_LEFT) and not Controls.check(oldpad, SCE_CTRL_LEFT) then
      i = i - 5
   elseif Controls.check(pad, SCE_CTRL_RIGHT) and not Controls.check(oldpad, SCE_CTRL_RIGHT) then
      i = i + 5
   end
   
   if i > #selfs then
      i = 1
   elseif i < 1 then
      i = #selfs
   end
   
   -- Update oldpad and flip screen
   oldpad = pad
   Screen.flip()
   
end
