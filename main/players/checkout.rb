module Checkout
  
  def mouse_clicked(event = nil)
    team_number = self.id.gsub(/confirm_checkout_/, "")
    team_entry = TeamEntry.find(:team_number => team_number)
    team_entry.checkout
    team_entry.save
    scene.load("main")
  end
end