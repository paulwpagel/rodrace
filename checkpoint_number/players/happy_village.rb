require "bar_map"
module HappyVillage
  def button_pressed(event)
    BarMap.checkpoint(:happy_village)
    scene.load "main"
  end  
end