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
end
