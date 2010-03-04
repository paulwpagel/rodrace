require "bar_map"
module FiveStar
  def button_pressed(event)
    BarMap.checkpoint(:five_star)
    scene.load "main"
  end  
end