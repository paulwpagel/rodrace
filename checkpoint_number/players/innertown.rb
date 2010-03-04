require "bar_map"
module Innertown
  def button_pressed(event)
    BarMap.checkpoint(:innertown)
    scene.load "main"
  end  
end