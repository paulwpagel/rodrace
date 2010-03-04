require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "team_entry"

describe TeamEntry do  
  
  before(:each) do
    stub_time
    @team_entry = TeamEntry.new(:team_number => "123")
  end
  
  it "takes a team number" do
    @team_entry.team_number.should == "123"
  end
  
  it "creates an in timestamp on creation" do        
    @team_entry.check_in
    @team_entry.in_timestamp.should == @now
  end
  
  it "saves to a persistor" do
    Persistor.should_receive(:save_team_entry).with(@team_entry)
    @team_entry.save
  end
  
  it "checks out" do
    @team_entry.check_out
    @team_entry.out_timestamp.should == @now
  end
  
  it "loads a team_entry with team number" do
    entry = TeamEntry.load_from(:team_number => "123")
    entry.team_number.should == "123"
  end
  
  it "loads a team_entry with a time in" do
    entry = TeamEntry.load_from(:in_timestamp => @now)
    entry.in_timestamp.should == @now
  end
  
  it "loads a team_entry with a time in" do
    entry = TeamEntry.load_from(:out_timestamp => @now)
    entry.out_timestamp.should == @now
  end
  
  it "loads a team_entry with team number" do
    entry = TeamEntry.load_from(:team_number => "123", :out_timestamp => @now, :in_timestamp => @now)
    entry.team_number.should == "123"
    entry.in_timestamp.should == @now
    entry.out_timestamp.should == @now
  end
  
  it "delegates to the persistor for loading all team entries" do
    Persistor.should_receive(:load_teams)
    
    TeamEntry.load_teams
  end
  
  it "loads a specific team" do
    team123 = TeamEntry.load_from(:team_number => "123")
    team124 = TeamEntry.load_from(:team_number => "124")
    Persistor.should_receive(:load_teams).and_return([team123, team124])
    
    TeamEntry.find(:team_number => "123").should == team123
  end
end