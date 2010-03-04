require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "team_entry"

describe "Main", "checkout" do
  
  before(:each) do
    stub_time
    @entry = TeamEntry.new(:team_number => "123", :in_timestamp => @now)    
    Thread.stub!(:new)
  end

  uses_limelight :scene => "main", :hidden => true  

  it "should save the team number with an input stamp" do
    TeamEntry.should_receive(:find).with(:team_number => "123").and_return(@entry)
    @entry.should_receive(:checkout)
    @entry.should_receive(:save)

    list_teams_prop = scene.find("list_teams")
    list_teams_prop.list_teams
    
    checkout_prop = scene.find("checkout_123")
    checkout_prop.should_not be_nil
    checkout_prop.mouse_clicked(nil)
  end

end