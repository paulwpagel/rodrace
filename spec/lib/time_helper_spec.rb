require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "time_helper"

describe TimeHelper do  
  
  it "tells seconds in minutes:seconds" do
    TimeHelper::in_minutes(1200).should == "20:00"
    TimeHelper::in_minutes(60).should == "01:00"
    TimeHelper::in_minutes(61).should == "01:01"
  end
end