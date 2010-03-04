require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "team_entry"
describe "ListTeams", "scene opened" do
  
  before(:each) do
    stub_time
    team = TeamEntry.new(:team_number => "123", :in_timestamp => @now)    
    TeamEntry.stub!(:load_teams).and_return([team])
    Thread.stub!(:new)
  end
  
  uses_limelight :scene => "main", :hidden => true
    
  it "updates the table" do
    list_teams_prop = scene.find("list_teams")
    list_teams_prop.list_teams
    list_teams_prop.should_not be_nil
    list_teams_prop.children.size.should == 1
  end
  
  it "builds the row" do
    list_teams_prop = scene.find("list_teams")
    list_teams_prop.list_teams
    
    first_row = list_teams_prop.children[0]
    first_row.id.should == "row_123"
    first_row.name.should == "team_row"
  end
  
  it "builds the row element #team_number" do
    list_teams_prop = scene.find("list_teams")
    list_teams_prop.list_teams

    first_row = list_teams_prop.children[0]
    first_row.children[0].text.should == "123"
    first_row.children[0].name.should == "cell"
  end
  
  it "builds the row element #check-in-time" do
    list_teams_prop = scene.find("list_teams")
    list_teams_prop.list_teams

    first_row = list_teams_prop.children[0]
    first_row.children[1].text.should == @now.strftime("%H:%M:%S")
    first_row.children[1].name.should == "cell"    
  end
  
  it "builds the row element #time to checkout" do
    list_teams_prop = scene.find("list_teams")
    list_teams_prop.list_teams

    first_row = list_teams_prop.children[0]
    first_row.children[2].text.should == "20:00"
    first_row.children[2].name.should == "cell"    
  end
  
  it "builds the row element #actions" do
    list_teams_prop = scene.find("list_teams")
    list_teams_prop.list_teams

    first_row = list_teams_prop.children[0]
    first_row.children[3].name.should == "cell"  
    first_row.children[3].children.size.should == 2
    first_row.children[3].children[0].text.should == "check out"
    first_row.children[3].children[0].id.should == "checkout_123"
    first_row.children[3].children[0].players.should == "checkout"
    first_row.children[3].children[1].text.should == "delete"
          
  end
    
  
  
  
end