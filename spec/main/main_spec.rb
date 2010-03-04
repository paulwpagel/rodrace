require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe "Main" do
  uses_limelight :scene => "main", :hidden => true

  it "has team number input" do
    team_number = scene.find("team_number")
    team_number.should_not be_nil
  end
  
  it "has checkin button" do
    checkin_button = scene.find("checkin_team_button")
    checkin_button.should_not be_nil
  end

end