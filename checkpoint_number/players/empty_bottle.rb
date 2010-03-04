require "bar_map"
module EmptyBottle
  def button_pressed(event)
    BarMap.checkpoint(:empty_bottle)
    scene.load "main"
  end  
end