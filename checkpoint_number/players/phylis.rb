require "bar_map"
module Phylis
  def button_pressed(event)
    BarMap.checkpoint(:phylis)
    scene.load "main"
  end  
end