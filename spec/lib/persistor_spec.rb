require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require File.expand_path(File.dirname(__FILE__) + "/../../configuration")
require "persistor"

describe Persistor, "save" do
  
  before(:each) do
    stub_time
    @file = mock(File, :write => nil)
    File.stub!(:open).and_yield(@file)
    File.stub!(:exist?).and_return(false)
  end
  
  it "saves a team_entry" do
    team_entry = TeamEntry.new(:team_number => "123", :in_timestamp => @now, :out_timestamp => @now)
    File.should_receive(:open).with(CONFIG[:data_root] + "/123_1.team", "w+").and_yield(@file)
    @file.should_receive(:write).with(@now.to_s).twice
    
    Persistor::save_team_entry(team_entry)
  end
  
end

describe Persistor, "load" do
  
  before(:each) do
    stub_time
  end
  
  def create_team(filename, time_out = @now)
    File.open("#{CONFIG[:data_root]}/#{filename}", "w+") do |file| 
      file.write(@now) 
      file.write("\n")
      file.write(time_out + 1) if time_out
    end
  end
  
  def delete_team(filename)
    File.delete("#{CONFIG[:data_root]}/#{filename}")
  end

  it "loads all team entries" do
    begin
      create_team("123_1.team")
      create_team("124_1.team")
    
      teams = Persistor::load_teams
      teams.size.should == 2
      teams[0].in_timestamp.to_s.should == @now.to_s
      teams[1].out_timestamp.to_s.should == (@now + 1).to_s
    ensure
      delete_team("123_1.team")
      delete_team("124_1.team")
    end
  end
  
  it "can load a team with no time out stamp" do
    begin
      create_team("123_1.team", nil)
    
      teams = Persistor::load_teams
      teams[0].in_timestamp.to_s.should == @now.to_s
      teams[0].out_timestamp.should be_nil
    ensure
      delete_team("123_1.team")
    end    
  end
end