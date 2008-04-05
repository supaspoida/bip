require File.dirname(__FILE__) + '/../spec_helper'

describe Song do
  before(:each) do
    @song = Song.new
  end

  it "should be valid" do
    @song.should be_valid
  end
  
  it "should belong to a band" do
    @song.should belong_to(:band)
  end
  
  it "should have many peformances" do
    @song.should have_many(:performances)
  end
end
