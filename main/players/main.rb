module Main
  def scene_opened(event)
    Thread.new do 
      loop do
        scene.find("list_teams").list_teams
        sleep 5
      end      
    end
  end
end