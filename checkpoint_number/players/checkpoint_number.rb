module CheckpointNumber

  def button_pressed(event)
    p self
    CONFIG[:checkpoint] = scene.find("checkpoint_number").text
    scene.load "main"
  end
end