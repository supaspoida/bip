require File.dirname(__FILE__) + '/../spec_helper'

describe Setlist do
  before(:each) do
    @setlist = Setlist.new
  end

  it "should be valid" do
    @setlist.should be_valid
  end
  
  it "should have many performances of songs" do
    @setlist.should have_many(:performances)
    @setlist.should have_many(:songs)
  end
  
  it "should belong to a user" do
    @setlist.should belong_to(:user)
  end
  
  it "should have many performances at an appearance" do
    @setlist.should have_many(:performances)
    @setlist.should belong_to(:appearance)
  end
  
  it "should be unapproved after create" 
  
end
