require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "bar_map"
CONFIG = {}

describe BarMap do  

  it "sets innertown as number one" do
    BarMap::checkpoint(:innertown)
    CONFIG[:checkpoint].should == "1"
  end
  
  it "sets phylis as number 2" do
    BarMap::checkpoint(:phylis)
    CONFIG[:checkpoint].should == "2"
  end
  
  it "sets happy_village as number 3" do
    BarMap::checkpoint(:happy_village)
    CONFIG[:checkpoint].should == "3"
  end

  it "sets mahoneys as number 4" do
    BarMap::checkpoint(:mahoneys)
    CONFIG[:checkpoint].should == "4"
  end

  it "sets five_star as number 5" do
    BarMap::checkpoint(:five_star)
    CONFIG[:checkpoint].should == "5"
  end

  it "sets empty_bottle as number 6" do
    BarMap::checkpoint(:empty_bottle)
    CONFIG[:checkpoint].should == "6"
  end
  
  
end