require "bar_map"
module Mahoneys
  def button_pressed(event)
    BarMap.checkpoint(:mahoneys)
    scene.load "main"
  end  
end