require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "team_entry"

describe "Main", "checkin" do

  uses_limelight :scene => "main", :hidden => true
  
  before(:each) do
    @entry = mock('entry', :save => nil, :checkin => nil)
    TeamEntry.stub!(:new).and_return(@entry)
  end

  it "should save the team number with an input stamp" do
    TeamEntry.should_receive(:new).with(:team_number => "123").and_return(@entry)
    @entry.should_receive(:checkin)
    @entry.should_receive(:save)
    team_number = scene.find("team_number")
    team_number.text = "123"
    checkin_team_button = scene.find("checkin_team_button")
    
    checkin_team_button.button_pressed(nil)
  end
  
  it "clears the team number text box after button is pressed" do
    team_number = scene.find("team_number")
    team_number.text = "123"
    checkin_team_button = scene.find("checkin_team_button")
    checkin_team_button.button_pressed(nil)
    team_number.text.should == ""
  end
  
  it "does nothing if the team name is not entered" do
    TeamEntry.should_not_receive(:new)
    checkin_team_button = scene.find("checkin_team_button")
    checkin_team_button.button_pressed(nil)
  end

end