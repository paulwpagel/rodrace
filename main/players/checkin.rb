require "team_entry"

module Checkin
  prop_reader :team_number
  
  def button_pressed(event)
    if team_number.text && team_number.text != ""
      entry = TeamEntry.new(:team_number => team_number.text)
      entry.checkin
      entry.save
    
      team_number.text = ""
    end
  end
end